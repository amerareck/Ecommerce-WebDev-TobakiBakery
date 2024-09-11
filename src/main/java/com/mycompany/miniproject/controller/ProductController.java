package com.mycompany.miniproject.controller;


import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.miniproject.dto.ProductDTO;
import com.mycompany.miniproject.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;

	@RequestMapping("/itemList-static")
	public String getProdutList() { 
		log.info("상품목록 실행");
		return "/product/itemList-static";
	}
	
	@RequestMapping("/itemDetail-static")
	public String getProductDetail() {
		log.info("상품상세 실행");
		return "/product/itemDetail-static";
	}
	
	@RequestMapping("/itemList-best")
	public String getProductBestList() {
		log.info("best상품 실행");
		return "/product/itemList-best";
	}
	@RequestMapping("/itemList-recom")
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

