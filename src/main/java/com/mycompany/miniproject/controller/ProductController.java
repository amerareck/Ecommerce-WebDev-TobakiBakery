package com.mycompany.miniproject.controller;


import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductDTO;
import com.mycompany.miniproject.dto.ProductForm;
import com.mycompany.miniproject.service.ProductService;
import com.mycompany.miniproject.type.Category;
import com.mycompany.miniproject.type.ProductState;
import com.mycompany.miniproject.type.ProductUsecase;
import com.mycompany.miniproject.validator.ProductValidator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;

	@GetMapping("/productListAll")
	public String getProdutListAll(@RequestParam(name = "categoryName", defaultValue = "")String categoryName, 
			Model model,@RequestParam(defaultValue="1")int pageNo, 
			HttpSession session) { 
		log.info("categoryName: " + categoryName);
		if (categoryName == null || categoryName.trim().isEmpty()) {
	        categoryName = null;
	    }

		log.info("상품목록 실행");
		getAllProductList(categoryName, model, pageNo, session);
		int prodCount = productService.getProductCount(categoryName);
		log.info("상품갯수: " + prodCount);
		log.info("categoryName: " + categoryName);
		log.info("pageNo: " + pageNo);
		
		model.addAttribute("prodCount", prodCount);
	    
		return "/product/productListAll";
	}
	
	public void getAllProductList( String categoryName, Model model,int pageNo, HttpSession session) {
		int totalRows = productService.getProductCount(categoryName);
		Pager pager = new Pager(8, 5, totalRows, pageNo);
		pager.setCategoryName(categoryName);
		session.setAttribute("pager", pager);
		List<ProductDTO> prodListAll = productService.getProductListAll(categoryName, pager);
		log.info(prodListAll.toString());
		
		model.addAttribute("prodListAll", prodListAll);
	}
	
	
	@GetMapping("/productDetail")
	public String getProductDetail(@RequestParam("productId") int productId, Model model) {
		getProdDetail(productId, model);
		log.info("상품상세 실행");
		return "/product/productDetail";
	}
	
	public void getProdDetail(int productId,  Model model) {
		ProductDTO prodDetail = productService.getProductDetail(productId);
		log.info("productDetail" + prodDetail);
		
		model.addAttribute("prodDetail", prodDetail);
	}
	
	
	@GetMapping("/itemList-best")
	public String getProductBestList() {
		log.info("best상품 실행");
		return "/product/itemList-best";
	}
	
	@GetMapping("/itemList-recom")
	public String getProductRecomList(Model model) {
		log.info("추천상품 실행");
		getRecomProductList(model);
		return "/product/itemList-recom";
	}
	
	public void getRecomProductList(Model model) {
		List<ProductDTO> recomProductList = productService.getRecomProductList();
		log.info(recomProductList.toString());
		
		model.addAttribute("recomProductList", recomProductList);
	}
	
	@GetMapping("/productImage")
	public void getProductImage(ProductDTO product, HttpServletResponse res, HttpServletRequest req) throws IOException {
		ProductDTO prodImage = productService.getProductImage(product);

		if(prodImage == null || prodImage.getImageType() == null) {
			String imgPath = "/resources/image/no-thumbnail.png";
			Path path = Paths.get(req.getServletContext().getRealPath(imgPath));
			Files.copy(path, res.getOutputStream());
			return;
		}

		String contentType = prodImage.getImageType();
		String fileName = prodImage.getImageOriginalName();
		String encodingFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		res.setContentType(contentType);
		res.setHeader("Content-Disposition", "attachment; filename=\""+encodingFileName+"\"");

		OutputStream out = res.getOutputStream();
		out.write(prodImage.getImageData());
		out.flush();
		out.close();

	}
	
	@InitBinder("productForm")
	public void productFormBinder(WebDataBinder binder) {
		log.info("InitBinder 실행");
		binder.setValidator(new ProductValidator());
	}
	
	@PostMapping("/addProduct")
	public String submitProduct(@Valid ProductForm form, Errors error, Model model) throws IOException {
		log.info("실행");
		log.info("productForm: "+form.toString());
		
		//유효성 검사 시작
		if(error.hasErrors()) {
			log.info("유효성 검사 실패");
			
			for(FieldError e : error.getFieldErrors()) {
				model.addAttribute("isAlert", true);
				model.addAttribute("alert", e.getDefaultMessage());
				model.addAttribute("reform", form);
				return "admin/adminProductDetails";
			}
		}
		
		//유효성 검사 통과
		ProductDTO dto = new ProductDTO();
		dto.setProductName(form.getProductName());
		dto.setProductDetail(form.getProductDetail());
		dto.setCategoryName(Category.fromValue(form.getCategoryName()));
		dto.setProductPrice(form.getProductPrice());
		dto.setProductStock(form.getProductCount());
		dto.setProductState(ProductState.fromValue(form.getProductState()));
		dto.setProductRecom(form.isProductRecom() ? 1 : 0);
		boolean productInsert = productService.insertProduct(dto);
		
		//상품 정상 등록
		if(productInsert) { 
			int pid = productService.getRecentProductId(form.getProductName());

			//상품 id를 정상으로 추출
			if(pid != 0) { 
				dto.setProductId(pid);
				//상품 디테일 이미지 처리
				MultipartFile detail = form.getProductDetailImagefile();
				if(!detail.isEmpty()) {
					dto.setProductUsecase(ProductUsecase.fromValue("DETAIL"));
					dto.setImageOriginalName(detail.getOriginalFilename());
					dto.setImageType(detail.getContentType());
					dto.setImageData(detail.getBytes());
					productInsert = productService.insertProductImage(dto);
				}
				
				//상품 섬네일 이미지 처리
				for(MultipartFile mf : form.getProductThumbnailImagefile()) {
					if(!mf.isEmpty()) {
						dto.setProductUsecase(ProductUsecase.fromValue("THUMBNAIL"));
						dto.setImageOriginalName(mf.getOriginalFilename());
						dto.setImageType(mf.getContentType());
						dto.setImageData(mf.getBytes());
						productInsert = productService.insertProductImage(dto);
					}
				}
			//상품 id를 추출하지 못함
			} else {
				productInsert = false;
			}
		}
		
		// 상품과 첨부 이미지가 정상적으로 처리된 경우.
		if(productInsert) {
			model.addAttribute("isAlert", true);
			model.addAttribute("alert", "상품이 등록되었습니다.");
			model.addAttribute("redirect", "../admin/main");
			return "common/alert";
		} else {
			model.addAttribute("isAlert", true);
			model.addAttribute("alert", "서버로부터 상품 등록에 실패하였습니다.\n서버 상태를 확인해주세요.");
			model.addAttribute("reform", form);
			
			return "admin/adminProductDetails";
		}

	}
	
	@GetMapping("getImageNames")
	public void getImageNames(ProductDTO dto, HttpServletResponse res) throws IOException {
		log.info("실행");
		List<ProductDTO> imageNames = productService.getImageNames(dto);
		JSONArray names = new JSONArray();
		JSONObject json = new JSONObject();
		
		if(imageNames.isEmpty()) {
			json.put("status", "no-data");
		} else {
			for(ProductDTO namesDTO : imageNames) {
				JSONObject name = new JSONObject();
				name.put("imageName", namesDTO.getImageOriginalName());
				name.put("productUsecase", namesDTO.getProductUsecase());
				names.put(name);
			}
			json.put("status", "ok");
			json.put("imageNames", names);
		}
		
		res.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = res.getWriter();
		pw.println(json.toString());
		pw.flush();
		pw.close();
	}
	
	@PostMapping("deleteImage")
	public void removeImage(ProductDTO dto, HttpServletResponse res) throws IOException {
		log.info("실행");
		JSONObject json = new JSONObject();
		
		if(productService.removeImage(dto)) {
			json.put("status", "ok");
		} else {
			json.put("status", "error");
		}
		
		res.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = res.getWriter();
		pw.println(json.toString());
		pw.flush();
		pw.close();
	}
	
	@PostMapping("update")
	public String updateProduct(@Valid ProductForm form, Errors error, Model model) throws IOException {
		log.info("실행");
		log.info("productForm: "+form.toString());
		
		//유효성 검사 시작
		if(error.hasErrors()) {
			log.info("유효성 검사 실패");
			
			for(FieldError e : error.getFieldErrors()) {
				model.addAttribute("isAlert", true);
				model.addAttribute("alert", e.getDefaultMessage());
				model.addAttribute("redirect", "../admin/main");
				return "common/alert";
			}
		}
		
		//유효성 검사 통과
		ProductDTO dto = new ProductDTO();
		dto.setProductId(form.getProductId());
		dto.setProductName(form.getProductName());
		dto.setProductDetail(form.getProductDetail());
		dto.setCategoryName(Category.fromValue(form.getCategoryName()));
		dto.setProductPrice(form.getProductPrice());
		dto.setProductStock(form.getProductCount());
		dto.setProductState(ProductState.fromValue(form.getProductState()));
		dto.setProductRecom(form.isProductRecom() ? 1 : 0);
		boolean productUpdate = productService.updateProduct(dto);
		
		if(productUpdate) {
			MultipartFile mf = form.getProductDetailImagefile();
			if(!mf.isEmpty()) {
				dto.setImageOriginalName(mf.getOriginalFilename());
				dto.setImageType(mf.getContentType());
				dto.setImageData(mf.getBytes());
				dto.setProductUsecase(ProductUsecase.DETAIL);
				
				productUpdate = productService.updateDetailImage(dto);
			}
		}
		
		for(MultipartFile mf : form.getProductThumbnailImagefile()) {
			if (!mf.isEmpty() && productUpdate) {
				dto.setImageOriginalName(mf.getOriginalFilename());
				dto.setImageType(mf.getContentType());
				dto.setImageData(mf.getBytes());
				dto.setProductUsecase(ProductUsecase.THUMBNAIL);
				
				//섬네일 이미지는 다중 이미지 허용이므로, 업데이트가 아닌 이미지 추가.
				//이미지 삭제는 별도 요청을 통해서 이루어져야 함.
				productUpdate = productService.insertProductImage(dto);
			}
		}
		
		// 트랜잭션 처리 필요!
		if(!productUpdate) {
			model.addAttribute("isAlert", true);
			model.addAttribute("alert", "상품 수정에 있어 오류가 발생했습니다.");
			model.addAttribute("redirect", "../admin/main?pageNo="+form.getPageNo());
		} else {
			model.addAttribute("isAlert", true);
			model.addAttribute("alert", "상품 수정이 완료되었습니다.");
			model.addAttribute("redirect", "../admin/main?pageNo="+form.getPageNo());
		}
		return "common/alert";
	}
	
	@PostMapping("delete")
	public void removeProduct(ProductDTO dto, HttpServletResponse res) throws IOException {
		log.info("실행");
		
		JSONObject json = new JSONObject();
		if(productService.removeProduct(dto)) {
			json.put("status", "ok");
		} else {
			json.put("status", "fail");
		}
		
		res.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = res.getWriter();
		pw.println(json.toString());
		pw.flush();
		pw.close();
	}
	
	@PostMapping("deleteList")
	public void removeProductList(@RequestBody List<ProductDTO> list, HttpServletResponse res) throws IOException {
		log.info("실행");
		log.info(list.toString());
		
		JSONObject json = new JSONObject();
		if(productService.removeProductList(list)) {
			json.put("status", "ok");
		} else {
			json.put("status", "fail");
		}
		
		res.setContentType("application/json");
		PrintWriter pw = res.getWriter();
		pw.println(json.toString());
		pw.flush();
		pw.close();
	}
}

