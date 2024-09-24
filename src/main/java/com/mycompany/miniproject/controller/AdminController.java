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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String mainPage(@RequestParam(value="pageNo", defaultValue="1") int pageNo, RedirectAttributes redi) {
		log.info("실행");
		redi.addFlashAttribute("adminMain", "active");
		redi.addFlashAttribute("listType", "product");
		
		return "redirect:/admin/list?type=product&pageNo="+pageNo;
	}
	
	@GetMapping("/OrderList")
	public String OrderList(RedirectAttributes redi) {
		log.info("실행");
		redi.addFlashAttribute("orderList", "active");
		redi.addFlashAttribute("listType", "order");
		
		return "redirect:/admin/list?type=order";
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
			model.addAttribute("allCount", allCount);
			
			pager = new Pager(10, 5, allCount, pageNo);
			model.addAttribute("pager", pager);
			
			return getProductList(pager, model);

		} else if(type.equals("order")) {
			allCount = orderService.getOrderAllCount();
			model.addAttribute("allCount", allCount);
			
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
		
		return "admin/adminProductList";
	}
	
	public String getOrderList(Pager pager, Model model) {
		log.info("실행");
		
		List<OrderDTO> list = orderService.getAllOrderList(pager);
		model.addAttribute("orderList", list);
		
		return "admin/adminOrderList";
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
	
	@GetMapping("/searchProduct")
	public String searchProduct(
			@RequestParam(value="type", required=true) String type, 
			@RequestParam(value="keyword", required=true) String keyword, 
			@RequestParam(value="pageNo", defaultValue="1") int pageNo, 
			Model model, RedirectAttributes redi) {
		log.info("실행");
		log.info("type: "+type+"\nkeyword: "+keyword);
		
		int searchProductCount = productService.getSearchProductCount(type, keyword);
		if(searchProductCount < 1) {
			redi.addFlashAttribute("isAlert", true);
			redi.addFlashAttribute("alert", "검색 결과가 존재하지 않습니다.\\n다른 키워드를 검색해 해주세요.");
			
			redi.addFlashAttribute("adminMain", "active");
			redi.addFlashAttribute("listType", "product");
			return "redirect:/admin/list?type=product&pageNo="+pageNo;
		}
		
		Pager pager = new Pager(10, 5, searchProductCount, pageNo);
		pager.setSearchType(type);
		pager.setKeyword(keyword);
		List<ProductDTO> searchList = productService.getResultSearchProduct(pager);
		
		model.addAttribute("adminMain", "active");
		model.addAttribute("listType", "product");
		model.addAttribute("isSearchPage", true);
		model.addAttribute("postListTitle", "검색 목록 리스트");
		model.addAttribute("searchProductCount", searchProductCount);
		model.addAttribute("pager", pager);
		model.addAttribute("productList", searchList);
		
		
		return "admin/adminProductList";
	}
}
