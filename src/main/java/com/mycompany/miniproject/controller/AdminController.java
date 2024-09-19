package com.mycompany.miniproject.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.miniproject.dto.OrderDTO;
import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductDTO;
import com.mycompany.miniproject.service.OrderService;
import com.mycompany.miniproject.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	ProductService productService;
	@Autowired
	OrderService orderService;
	
	@GetMapping("/main")
	public String mainPage(Model model) {
		log.info("실행");
		model.addAttribute("adminMain", "active");
		model.addAttribute("listType", "product");
		
		return "admin/adminMain";
	}
	
	@GetMapping("/OrderList")
	public String OrderList(Model model) {
		log.info("실행");
		model.addAttribute("orderList", "active");
		model.addAttribute("listType", "order");
		
		return "admin/adminMain";
	}
	
	@GetMapping("/addProduct")
	public String addProduct(Model model) {
		log.info("실행");
		model.addAttribute("addProduct", "active");
		
		return "admin/adminProductDetails";
	}
	
	@GetMapping("/list")
	public String getElementList(
				@RequestParam(value="type", required=true) String type, 
				@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		log.info("실행");
		
		int allCount;
		Pager pager = null;
		
		if(type.equals("product")) {
			allCount = productService.getProductAllCount();
			pager = new Pager(10, 5, allCount, pageNo);
			model.addAttribute("pager", pager);
			
			return getProductList(pager, model);

		} else if(type.equals("order")) {
			allCount = orderService.getOrderAllCount();
			pager = new Pager(10, 5, allCount, pageNo);
			model.addAttribute("pager", pager);
			
			return getOrderList(pager, model);
		}
		return "redirect:/admin/list?type=product";
	}
	
	public String getProductList(Pager pager, Model model) {
		log.info("실행");
		
		List<ProductDTO> list = productService.getAllProductList(pager);
		model.addAttribute("productList", list);
		
		return "admin/ProductList";
	}
	
	public String getOrderList(Pager pager, Model model) {
		log.info("실행");
		
		List<OrderDTO> list = orderService.getAllOrderList(pager);
		model.addAttribute("orderList", list);
		
		return "admin/OrderList";
	}
	
	@PostMapping("/updateProduct")
	public void updateProduct(ProductDTO dto, HttpServletResponse res) {
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
