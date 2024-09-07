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
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("")
	public String getIndex(Model model) {
		log.info("실행");
		getNewProductList(model);
		getBestProductList(model);
		return "index";
	}
	
	public void getNewProductList(Model model) {
		List<ProductDTO> newProdList = productService.getNewProductList();
		log.info(newProdList.toString());
		
		model.addAttribute("newProdList", newProdList);
	}
	
	public void getBestProductList(Model model) {
		List<ProductDTO> bestProductList = productService.getBestProductList();
		log.info(bestProductList.toString());
		
		model.addAttribute("bestProductList", bestProductList);
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
