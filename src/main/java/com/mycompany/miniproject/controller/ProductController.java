package com.mycompany.miniproject.controller;


import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductDTO;
import com.mycompany.miniproject.service.ProductService;

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
	
}

