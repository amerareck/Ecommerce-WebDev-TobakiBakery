package com.mycompany.miniproject.controller;


import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import java.util.Map;

import java.util.Set;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.security.access.annotation.Secured;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.miniproject.dto.BoardForm;
import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductDTO;
import com.mycompany.miniproject.dto.ProductForm;
import com.mycompany.miniproject.dto.ProductReviewDTO;
import com.mycompany.miniproject.dto.ProductReviewForm;
import com.mycompany.miniproject.service.MemberService;
import com.mycompany.miniproject.service.ProductReviewService;
import com.mycompany.miniproject.service.ProductService;
import com.mycompany.miniproject.type.Category;
import com.mycompany.miniproject.type.ProductState;
import com.mycompany.miniproject.type.ProductUsecase;
import com.mycompany.miniproject.validator.BoardValidator;
import com.mycompany.miniproject.validator.ProductValidator;
import com.mycompany.miniproject.validator.ReviewValidator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductReviewService productReviewService;

	@GetMapping("/productListAll")
	public String getProdutListAll(
			@RequestParam(name = "categoryName", defaultValue = "")String categoryName, 
			Model model,
			@RequestParam(defaultValue="1")int pageNo, 
			@RequestParam(name = "listName", defaultValue = "") String listName,
			HttpSession session) { 
		
		log.info("categoryName: " + categoryName);
		log.info("listName: " + listName);
	   


		log.info("상품목록 실행");
		log.info("categoryName: " + categoryName);
		log.info("pageNo: " + pageNo);
		int totalRows = 0;
		Pager pager = new Pager(8, 5, totalRows, pageNo);
		pager.setCategoryName(categoryName);
		pager.setListName(listName);
		getProductListPager(listName, categoryName, model, pageNo, session);
		
	 	List<ProductDTO> productList = new ArrayList<>();
	    String listTitle = "";
	    int prodCount = 0;
	    
	    if ("best".equals(listName)) {
	    		productService.updateBestProductList();
	        productList = productService.getBestProductList(pager);
	        prodCount = productService.getProductBestCount();
	        pager.setTotalRows(prodCount);
	        listTitle = "BEST 상품";
	    } else if ("new".equals(listName)) {
	    		productService.updateNewProductList();
	        productList = productService.getNewProductList(pager);
	        prodCount = productService.getProductNewCount();
	        pager.setTotalRows(prodCount);
	        listTitle = "신상품";
	    } else if ("recom".equals(listName)) {
	        productList = productService.getRecomProductList(pager);
	        prodCount = productService.getProductRecomCount();
	        pager.setTotalRows(prodCount);
	        listTitle = "추천 상품";
	    } else if (categoryName !=null && "BREAD".equals(categoryName)) {
	        productList = productService.getCategoryProductList(categoryName, pager);
	        prodCount = productService.getCategoryProductCount(categoryName);
	        pager.setTotalRows(prodCount);
	        listTitle = "빵";
	    } else if (categoryName !=null && "CAKE".equals(categoryName)) {
	        productList = productService.getCategoryProductList(categoryName, pager);
	        prodCount = productService.getCategoryProductCount(categoryName);
	        pager.setTotalRows(prodCount);
	        listTitle = "케이크";
	    } else if (categoryName !=null && "DESSERT".equals(categoryName)) {
	        productList = productService.getCategoryProductList(categoryName, pager);
	        prodCount = productService.getCategoryProductCount(categoryName);
	        pager.setTotalRows(prodCount);
	        listTitle = "디저트";
	    } else {
	        productList = productService.getAllProductList(pager);
	        prodCount = productService.getProductAllCount();
	        pager.setTotalRows(prodCount);
	        listTitle = "전체 상품";
	    }
	   
	    model.addAttribute("prodCount", prodCount);
	    model.addAttribute("productList", productList);
	    model.addAttribute("listTitle", listTitle);

		
		return "/product/productListAll";
	}
	
	public void getProductListPager( String listName, String categoryName, Model model,int pageNo, HttpSession session) {
		 int totalRows=0;
		 
		    if ((listName == null || listName.trim().isEmpty()) && (categoryName == null || categoryName.trim().isEmpty())) {
		        totalRows = productService.getProductAllCount();
		    } else if ("best".equals(listName)) {
		        totalRows = productService.getProductBestCount();
		    } else if ("new".equals(listName)) {
		        totalRows = productService.getProductNewCount();
		    } else if ("recom".equals(listName)) {
		        totalRows = productService.getProductRecomCount();
		    } else if (categoryName != null && !categoryName.trim().isEmpty()) {
		        totalRows = productService.getCategoryProductCount(categoryName);
		    }
		    
		    Pager pager = new Pager(8, 5, totalRows, pageNo);
		    if (categoryName != null && !categoryName.isEmpty()) {
		        pager.setCategoryName(categoryName);
		    }
		    if (listName != null && !listName.isEmpty()) {
		        pager.setListName(listName);
		    }

		    session.setAttribute("pager", pager);

		
	}
	
	
	@GetMapping("/searchProduct")
	public String getProductSearch(
			@RequestParam(name = "type", defaultValue = "productName")String type,
			@RequestParam(value="keyword", required=true) String keyword,
			Model model,
			@RequestParam(defaultValue="1") int pageNo) {
		log.info("실햄");
		log.info("type: " + type);
		int searchProductCount = productService.getSearchProductCount(type, keyword);
		if(searchProductCount < 1 || keyword.isEmpty() || keyword==null) {

			
			return "redirect:/product/productListAll?";
		}
		Pager pager = new Pager(8, 5, searchProductCount, pageNo);
		pager.setKeyword(keyword);
		pager.setSearchType("productName");
		List<ProductDTO> searchList = productService.getResultSearchProduct(pager);
		model.addAttribute("productList",searchList);
		model.addAttribute("prodCount", searchProductCount);
		model.addAttribute("pager", pager);
		model.addAttribute("listTitle", "상품 검색");
		
		return "/product/productListAll";
	}
	
	
	@GetMapping("/productDetail")
	public String getProductDetail(
			ProductDTO product, 
			Model model) {
		getProdDetail(product.getProductId(), model);
		
		String categoryName = productService.getProductCategoryName(product.getProductId());
		model.addAttribute("categoryName", categoryName);

		
		getProdSmartRecom(product, model);
		
		log.info("상품상세 실행");
		
		
		return "/product/productDetail";
	}
	
	public void getProdSmartRecom(ProductDTO product, Model model) {
		ProductDTO prod = new ProductDTO();
	    prod.setProductId(product.getProductId());

		
	    Set<ProductDTO> prodSmart = productService.getProductSmartRecom(prod);
		model.addAttribute("prodSmart", prodSmart);
		log.info(prodSmart.toString());
	}

	public void getProdDetail(int productId,  Model model) {
		ProductDTO prodDetail = productService.getProductDetail(productId);
		log.info("productDetail: " + prodDetail);
		
		model.addAttribute("prodDetail", prodDetail);
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
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/addProduct")
	public String submitProduct(@Valid ProductForm form, Errors error, Model model, RedirectAttributes redi) throws IOException {
		log.info("실행");
		log.info("productForm: "+form.toString());
		
		//유효성 검사 시작
		if(error.hasErrors()) {
			log.info("유효성 검사 실패");
			for(FieldError e : error.getFieldErrors()) {
				redi.addFlashAttribute(e.getField()+"Error", e.getDefaultMessage());
			}
			redi.addFlashAttribute("reform", form);
			return "redirect:/admin/addProduct";
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
			redi.addFlashAttribute("isAlert", true);
			redi.addFlashAttribute("alert", "상품이 등록되었습니다.");
			redi.addFlashAttribute("adminMain", "active");
			redi.addFlashAttribute("listType", "product");
			
			return "redirect:/admin/list?type=product";
		} else {
			redi.addFlashAttribute("isAlert", true);
			redi.addFlashAttribute("alert", "서버로부터 상품 등록에 실패하였습니다.\n서버 상태를 확인해주세요.");
			redi.addFlashAttribute("reform", form);
			
			return "redirect:/admin/addProduct";
		}

	}
	
	@GetMapping("/getImageNames")
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
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/deleteImage")
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
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/update")
	public String updateProduct(@Valid ProductForm form, Errors error, Model model, RedirectAttributes redi) throws IOException {
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
			redi.addFlashAttribute("isAlert", true);
			redi.addFlashAttribute("alert", "상품 수정에 있어 오류가 발생했습니다.");
			//redi.addFlashAttribute("redirect", "../admin/main?pageNo="+form.getPageNo());
		} else {
			redi.addFlashAttribute("isAlert", true);
			redi.addFlashAttribute("alert", "상품 수정이 완료되었습니다.");
		}
		return "redirect:/admin/list?type=product&pageNo="+form.getPageNo();
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/delete")
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
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/deleteList")
	public void removeProductList(@RequestBody List<ProductDTO> list, HttpServletResponse res) throws IOException {
		log.info("실행");
		log.info(list.toString());
		
		JSONObject json = new JSONObject();
		if(productService.removeProductList(list)) {
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

	
	@GetMapping("/addReview")
	public String addReview(String type, Model model) {
		log.info("실행");
		if(type == null) return "redirect:/product/productListAll";
		
		String[] elNames = {
				"active", "title", "breadcrumb", "showCategory", "showReview",
				"boardType", "formAction",
				"author", "postTitle", "isSecret", "postContent", "postFile", "timestamp"
		};

		if(type.equals("helpdesk")) {
			String[] data = {
					"helpdesk", "문의사항", "문의사항", "none", "none",
					"helpdesk", "submitHelpdesk",
					"memberId", "title", "lockState", "content", "attach", "datetime"
			};
			
			for(int i=0; i<elNames.length; i++) {
				model.addAttribute(elNames[i], data[i]);
			}
		} 
		
		return "product/reviewInsert";
	}

	
	
	// 리뷰 작성 폼 페이지로 이동
		@Autowired
		private MemberService memberService;
		
		@GetMapping("/list")
		public String getReviewList(@RequestParam(value="pageNo", defaultValue="1") int pageNo,Model model) {
		    log.info("실행");
		    String[]elnames= {"active", "title", "breadcrumb","boardAllcount"};
		    int boardAllCount = productReviewService.getReviewAllCount();
		    Pager pager = new Pager(10,5,boardAllCount,pageNo);
		    model.addAttribute("pager",pager);
		    String[] data = {"review", "상품후기", "상품후기", Integer.toString(boardAllCount)};
		    List<ProductReviewDTO> dto = productReviewService.getReviewList(pager);
		    model.addAttribute("reviewList",dto);
		    for(int i=0;i<elnames.length;i++) {
		    	model.addAttribute(elnames[i],data[i]);
		    }
		return "product/reviewList";
		}
			
		    
		   /* // 상품 후기 개수 가져오기
		    int reviewCount = productReviewService.getProductReviewAllCount();
		    Pager pager = new Pager(10, 5, reviewCount, pageNo);
		    model.addAttribute("pager", pager);
		    
		    // 상품 후기 리스트 가져오기
		    List<ProductReviewDTO> reviewList = productReviewService.getProductReviewList(pager);
		    model.addAttribute("reviewList", reviewList);
		    
		    // 기타 필요한 데이터 설정
		    model.addAttribute("active", "productReview");
		    model.addAttribute("title", "상품후기");
		    model.addAttribute("breadcrumb", "상품후기");
		    model.addAttribute("boardType", "productReview");
		    model.addAttribute("reviewAllCount", reviewCount);*/
		    
		
		
		@GetMapping("/addBoard")
		public String addBorad(@RequestParam int productId, Model model) {
		    log.info("실행");
		    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		    String memberId = authentication.getName();
		    model.addAttribute("memberId", memberId);
		    
	    	ProductDTO product = productService.getProductDetail(productId);
		    
		    model.addAttribute("productName", product.getProductName());
		    model.addAttribute("productPrice", product.getProductPrice());
		    model.addAttribute("productImageUrl", "/product/productImage?productId=" + productId + "&productUsecase=THUMBNAIL");
		    model.addAttribute("productId", productId);
		    
		    String[]elNames = {"active", "title", "breadcrumb","showCategory", "showReview",
		    		"formAction", "author","postTitle","postContent","postFile","timestamp"};
		    
		    String[]data = {"review", "상품후기", "상품후기", "none","review",
		    		"submitReview","memberId","reviewTitle","reviewContent","reviewAttach","reviewDate"};
		    for(int i =0;i<elNames.length;i++) {
		    	model.addAttribute(elNames[i],data[i]);
		    	
		    }
		    return "product/reviewInsert";
		}
		    
		   
		    /*
		    ProductDTO product = productService.getProductDetail(productId);
		    
		    model.addAttribute("productName", product.getProductName());
		    model.addAttribute("productPrice", product.getProductPrice());
		    model.addAttribute("productImageUrl", "/product/productImage?productId=" + productId + "&productUsecase=THUMBNAIL");
		    model.addAttribute("productId", productId);
		    
		    log.info("로그인된 사용자 ID: " + memberId);
		    log.info("상품명: " + product.getProductName());
		    log.info("상품 가격: " + product.getProductPrice());*/

		@GetMapping("/detail")
		public String getReviewDetail(String boardNum, Model model) {
		    log.info("실행");
		    if(boardNum==null)return "redirect:/product/list";

		    Map<String, Object> map = new HashMap<>();
		    String[]elNames = {"review","title","breadcrumb"};
		    String[]data= {"review","상품후기","상품후기"};
		    for(int i=0;i<elNames.length;i++){
		    	model.addAttribute(elNames[i],data[i]);
		    }
		    	boardNum=boardNum.replaceAll("[^0-9]","");
		    	
		    	ProductReviewDTO dto = productReviewService.getReviewPostByBoardNum(Integer.parseInt(boardNum));
		    	productReviewService.increaseReviewViews(dto.getProductReviewId());
		    	map.put("title", dto.getReviewTitle());
				map.put("boardId", dto.getProductReviewId());
				map.put("datetime", dto.getReviewDate());
				map.put("memberId", dto.getMemberId());
				map.put("views", dto.getReviewViews());
				map.put("content", dto.getReviewContent());
				
				List<String> imageNames = productReviewService.getBoardImageNames(dto.getProductReviewId());
				map.put("imageNames", imageNames);
				model.addAttribute("board", map);
				return "product/reviewDetail";
		}
		
		    /*// 상품후기 정보를 가져옴
		    ProductReviewDTO reviewDTO = productReviewService.getProductReviewByProductId(productReviewId);
		    if (reviewDTO != null) {
		        // 조회수 증가
		        productReviewService.increaseProductReviewViews(productReviewId);
		        
		        // 상세 정보 map에 추가
		        map.put("title", reviewDTO.getReviewTitle());
		        map.put("reviewId", reviewDTO.getProductReviewId());
		        map.put("datetime", reviewDTO.getReviewDate());
		        map.put("memberId", reviewDTO.getMemberId());
		        map.put("views", reviewDTO.getReviewViews() + 1);
		        map.put("content", reviewDTO.getReviewContent());
		        map.put("reviewPoint", reviewDTO.getReviewPoint());
		        
		        // 이미지 이름 리스트 가져오기
		        List<String> imageNames = productReviewService.getProductReviewImageNames(productReviewId);
		        map.put("imageNames", imageNames);

		        // 모델에 추가
		        model.addAttribute("review", map);
		    } else {
		        // 리뷰가 없는 경우 오류 페이지로 리다이렉트
		        return "redirect:/product/review/list";
		    }

		    return "product/reviewDetail";
		}*/
		@PostMapping("/removeBoard")
		public void removeProductReview(String boardIndex, HttpServletResponse res) {
		    log.info("실행");
		    log.info("삭제할 리뷰 인덱스: " + boardIndex);

		    // 리뷰 삭제 로직 호출
		    //boolean result = productReviewService.removeProductReview(productReviewId);

		    // JSON 결과 리턴
		    JSONObject json = new JSONObject();
		    json.put("status", "ok");
		   /* if(result) {
		        json.put("status", "ok");
		    } else {
		        json.put("status", "fail");
		    }*/

		    try (PrintWriter pw = res.getWriter()) {
		        res.setContentType("application/json; charset=UTF-8");
		        pw.println(json.toString());
		        pw.flush();
		    } catch(IOException ioe) {
		        ioe.printStackTrace();
		    }
		}
		@InitBinder("productReviewForm")
		public void reviewSubmitBinder(WebDataBinder binder) {
			log.info("InitBinder 실행");
			binder.setValidator(new ReviewValidator());
		}
		
		@PostMapping("/submitReview")
		public String submitReview(@Valid ProductReviewForm form, Errors error, RedirectAttributes redi) throws IOException {
			log.info("실행");
			log.info(form.toString());
			
			 /*Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			 String memberId = authentication.getName();
			    
			    model.addAttribute("memberId", memberId);
			    log.info(""+memberId);*/
		    
			if(error.hasErrors()) {
				log.info("유효성 검사 실패");
				log.info(error.getFieldError("reviewTitle").getDefaultMessage());
				redi.addFlashAttribute("isAlert", true);
				redi.addFlashAttribute("alert", error.getFieldError("reviewTitle").getDefaultMessage());
				return "redirect:/product/addBoard";
			}
			
			

				/*FieldError fieldError = error.getFieldError("title");
				if(fieldError != null) {
					redi.addFlashAttribute("isAlert", true);
					redi.addFlashAttribute("alert", fieldError.getDefaultMessage());
				}
				return "redirect:/product/addReview";
			}
			*/
			// 유효성 검사 통과
			ProductReviewDTO productReviewDTO = new ProductReviewDTO();
			productReviewDTO.setMemberId(form.getMemberId());
			productReviewDTO.setReviewTitle(form.getReviewTitle());
			productReviewDTO.setReviewPoint(form.getReviewPoint());
			productReviewDTO.setReviewContent(form.getReviewContent());
			productReviewDTO.setProductId(form.getProductId());
			productReviewDTO.setReviewDate(form.getReviewDate());
			productReviewDTO.setProductReviewId(productReviewService.insertReviewPost(productReviewDTO));

			List<ProductReviewDTO> imageList = new ArrayList<>();
			if(form.getAttach()!=null) {
				for(MultipartFile mf : form.getAttach()) {		
				if(mf != null && !mf.isEmpty()) {
					ProductReviewDTO image = new ProductReviewDTO();
					image.setImageOriginalName(mf.getOriginalFilename());
					image.setImageType(mf.getContentType());
					image.setImageData(mf.getBytes());
					image.setProductReviewId(productReviewDTO.getProductReviewId());
					image.setMemberId(productReviewDTO.getMemberId());
					imageList.add(image);
				}
				}
			}
			productReviewService.insertReviewPost(productReviewDTO);
			if(!imageList.isEmpty()) {
				productReviewService.insertReviewImages(imageList);
			}
			return "redirect:/product/detail?&boardNum="+productReviewDTO.getProductReviewId();
		}
		
			//dto.setProductReviewId(productReviewService.insertProductReview(dto));
			
			//List<ProductReviewDTO> imageList = new ArrayList<>();
			/*for(MultipartFile mf : form.getAttach()) {
				if(!mf.isEmpty()) {
					ProductReviewDTO image = new ProductReviewDTO();
					image.setImageOriginalName(mf.getOriginalFilename());
					image.setImageType(mf.getContentType());
					image.setImageData(mf.getBytes());
					image.setProductReviewId(dto.getProductReviewId());
					image.setMemberId(dto.getMemberId());
					imageList.add(image);
				}*/
			/*}

			if(!imageList.isEmpty()) {productReviewService.insertProductReviewImages(imageList);
			}
			
			return "redirect:/product/detail?productReviewId="+dto.getProductReviewId();*/
		
		@GetMapping("/image")
		public void getImage(String imageName, String boardId, HttpServletResponse res) throws IOException {
		    log.info("실행");

		    // ProductReviewDTO 객체 생성 및 값 설정
		    ProductReviewDTO dto = new ProductReviewDTO();
		    dto.setProductReviewId(Integer.parseInt(boardId.replaceAll("[^0-9]", "")));
		    dto.setImageOriginalName(imageName);

		    // 이미지 데이터 조회
		    dto = productReviewService.getImage(dto);
		    String contentType = dto.getImageType();
			String fileName = dto.getImageOriginalName();
			String encodingFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			res.setContentType(contentType);
			res.setHeader("Content-Disposition", "attachment; filename=\""+encodingFileName+"\"");
			OutputStream out = res.getOutputStream();
			out.write(dto.getImageData());
			out.flush();
			out.close();
		}


		    /*// 이미지 응답 설정 및 전송
		    if (dto != null && dto.getImageData() != null) {
		        String contentType = dto.getImageType();
		        String fileName = dto.getImageOriginalName();
		        String encodingFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		        res.setContentType(contentType);
		        res.setHeader("Content-Disposition", "attachment; filename=\"" + encodingFileName + "\"");

		        try (OutputStream out = res.getOutputStream()) {
		            out.write(dto.getImageData());
		            out.flush();
		        }
		    } else {
		        res.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
		    }*/
		
		@GetMapping("/update")
		public String updateReview(String boardNum,@RequestParam int productReviewId, Model model) {
		    log.info("실행");

		    // 상품 후기 작성 페이지를 로드
		    
		    

		    // 기존 후기 정보 가져오기
		    //ProductReviewDTO dto = productReviewService.getProductReviewByProductId(productReviewId);
		    Map<String, Object> map = new HashMap<>();
		    boardNum=boardNum.replaceAll("[^0-9]", "");

		    	ProductReviewDTO dto=new ProductReviewDTO();
		    	dto=productReviewService.getReviewPostByBoardNum(Integer.parseInt(boardNum));
		    	
		        dto.setReviewContent(dto.getReviewContent().replaceAll("<br>", "\n"));
		        map.put("author", dto.getMemberId());
		        map.put("title", dto.getReviewTitle());
		        map.put("content", dto.getReviewContent());
		        map.put("reviewPoint", dto.getReviewPoint());
		        
		        map.put("reviewId", dto.getProductReviewId());
		        map.put("savedFileNames", productReviewService.getBoardImageNames(Integer.parseInt(boardNum)));
		    

		    model.addAttribute("board", map);
		   // model.addAttribute("formAction", "updateSubmit");
		    model.addAttribute("updateBoard", "show");

		    return "redirect:/product/addBoard";
		}
}
		

	/*	private String addReview(Model model) {
			// TODO Auto-generated method stub
			return null;
		}

		@PostMapping("/updateSubmit")
		public String updateReviewSubmit(
		        @Valid BoardForm form, 
		        Errors error, 
		        RedirectAttributes redi) throws IOException {
		    
		    log.info("실행");
		    log.info(form.toString());

		    // 유효성 검사 실패 시
		    if (error.hasErrors()) {
		        log.info("유효성 검사 실패");
		        FieldError fieldError = error.getFieldError("title");
		        if (fieldError != null) {
		            redi.addFlashAttribute("isAlert", true);
		            redi.addFlashAttribute("alert", fieldError.getDefaultMessage());
		        }
		        return "redirect:/product/addReview?reviewId=";
		    }

		    // ReviewDTO로 데이터 매핑
		    ProductReviewDTO dto = new ProductReviewDTO();
		    dto.setMemberId(form.getMemberId());
		    dto.setReviewTitle(form.getTitle());
		    dto.setReviewContent(form.getContent());
		    dto.setReviewPoint(form.getReviewPoint());
		    dto.setProductReviewId(form.getProductReviewId());
		    dto.setReviewDate(form.getDatetime());
		    productReviewService.updateProductReview(dto);

		    // 첨부 이미지 처리
		    List<ProductReviewDTO> imageList = new ArrayList<>();
		    for (MultipartFile mf : form.getAttach()) {
		        if (!mf.isEmpty()) {
		            ProductReviewDTO image = new ProductReviewDTO();
		            image.setImageOriginalName(mf.getOriginalFilename());
		            image.setImageType(mf.getContentType());
		            image.setImageData(mf.getBytes());
		            image.setProductReviewId(dto.getProductReviewId());
		            image.setMemberId(dto.getMemberId());
		            imageList.add(image);
		        }
		    }

		    // 이미지 저장
		    if (!imageList.isEmpty()) {
		        productReviewService.insertProductReviewImages(imageList);
		    }

		    return "redirect:/product/reviewDetail?reviewId=" + form.getProductReviewId();
		}
		@PostMapping("/removeImage")
		public void deleteProductReviewImageForAjax(
		        @RequestParam String imageName, 
		        @RequestParam("productReviewId") int productReviewId, 
		        HttpServletResponse res) throws IOException {

		    log.info("실행");
		    log.info("삭제할 imageName: " + imageName);

		    // 이미지 삭제를 위한 map 설정
		    Map<String, Object> map = new HashMap<>();
		    map.put("imageOriginalName", imageName);
		    map.put("reviewId", productReviewId);

		    JSONObject json = new JSONObject();

		    // 이미지 삭제 결과 처리
		    if (productReviewService.deleteReviewImage(map)) {
		        json.put("result", "ok");
		    } else {
		        json.put("result", "notFoundImage");
		    }

		    // JSON 응답 전송
		    res.setContentType("application/json; charset=UTF-8");
		    try (PrintWriter pw = res.getWriter()) {
		        pw.println(json);
		        pw.flush();
		    }
		}*/



