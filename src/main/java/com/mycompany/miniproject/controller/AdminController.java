package com.mycompany.miniproject.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.miniproject.dto.ProductDTO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController { 
	@GetMapping("/getAdminMain")
	public String adminMain(Model model) {
		log.info("실행");
		
		model.addAttribute("adminMain", "active");
		return "admin/admin-main";
	}
	
	@GetMapping("/addProduct")
	public String addProduct(Model model) {
		log.info("실행");
		model.addAttribute("addProduct", "active");
		return "admin/admin-product-details";
	}
	
	@PostMapping("/addProduct")
	public void submitProduct(ProductDTO dto, HttpServletResponse res) {
		log.info("실행");
		log.info(dto.toString());
		
		JSONObject json = new JSONObject();
		json.put("status", "ok");
		
		try(PrintWriter pw = res.getWriter()) {
			res.setContentType("application/json; charset=UTF-8");
			pw.println(json.toString());
			pw.flush();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
	}
	@PostMapping("/updateProduct")
	public void updateProduct(ProductDTO dto,BindingResult result, HttpServletResponse res) {
		log.info("실행");
		log.info(dto.toString());
		
		JSONObject json = new JSONObject();
		
		if (result.hasErrors()) {
	        // 유효성 검사 실패 처리
	        log.error("유효성 검사 실패: " + result.getAllErrors());
	        
	        json.put("status", "error");
	        json.put("message", result.getAllErrors().get(0).getDefaultMessage());
	    } else {
	        // 유효성 검사 통과
	        log.info(dto.toString());
	        json.put("status", "ok");
	    }
		
		try(PrintWriter pw = res.getWriter()) {
			res.setContentType("application/json; charset=UTF-8");
			pw.println(json.toString());
			pw.flush();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
	@PostMapping("/removeProductList")
	public void removeProductList(@RequestBody List<ProductDTO> removeList, HttpServletResponse res) {
		log.info("실행");
		for(ProductDTO ele : removeList)
			log.info(""+ele.getProductId());
		
		JSONObject json = new JSONObject();
		json.put("status", "ok");
		
		try(PrintWriter pw = res.getWriter()) {
			res.setContentType("application/json; charset=UTF-8");
			pw.println(json.toString());
			pw.flush();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
	@PostMapping("/removeProduct")
	public void removeProduct(@RequestBody ProductDTO productDTO, HttpServletResponse res) {
		log.info("실행");
		log.info(""+productDTO.getProductId());
		
		JSONObject json = new JSONObject();
		json.put("status", "ok");
		
		try(PrintWriter pw = res.getWriter()) {
			res.setContentType("application/json; charset=UTF-8");
			pw.println(json.toString());
			pw.flush();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
	}
}
