package com.mycompany.miniproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductDTO;
import com.mycompany.miniproject.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("")
	public String getIndex(Model model) {
		log.info("실행");
		getNewProductList(model);
		getBestProductList(model);
		return "index";
	}
	
	public void getNewProductList(Model model) {
		productService.updateNewProductList();
		int totalRows = productService.getProductNewCount();
		Pager pager = new Pager(8, 1, totalRows, 1);
		List<ProductDTO> newProdList = productService.getNewProductList(pager);
		log.info(newProdList.toString());
		
		model.addAttribute("newProdList", newProdList);
	}
	
	public void getBestProductList(Model model) {
		productService.updateBestProductList();
		int totalRows = productService.getProductBestCount();
		Pager pager = new Pager(8, 1, totalRows, 1);
		List<ProductDTO> bestProductList = productService.getBestProductList(pager);
		log.info(bestProductList.toString());
		
		model.addAttribute("bestProductList", bestProductList);
	}
}
