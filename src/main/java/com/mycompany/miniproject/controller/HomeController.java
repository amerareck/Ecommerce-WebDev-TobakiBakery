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
}
