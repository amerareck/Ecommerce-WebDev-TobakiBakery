package com.mycompany.miniproject.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
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
import com.mycompany.miniproject.dto.SearchForm;
import com.mycompany.miniproject.service.MemberService;
import com.mycompany.miniproject.service.OrderService;
import com.mycompany.miniproject.service.ProductService;
import com.mycompany.miniproject.type.DeliveryStatus;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Secured("ROLE_ADMIN")
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	ProductService productService;
	@Autowired
	OrderService orderService;
	@Autowired
	MemberService memberService;
	
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
		
		int productAllCount = productService.getProductAllCount();
		int orderAllCount = orderService.getOrderAllCount();
		Pager pager = null;
		model.addAttribute("productAllCount", productAllCount);
		model.addAttribute("orderAllCount", orderAllCount);
		
		if(type.equals("product")) {
			pager = new Pager(10, 5, productAllCount, pageNo);
			model.addAttribute("pager", pager);
			
			return getProductList(pager, model);

		} else if(type.equals("order")) {
			
			pager = new Pager(10, 5, orderAllCount, pageNo);
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
		for(OrderDTO dto : list) {
			List<OrderDTO> orderProduct = orderService.getOrderProduct(dto);
			log.info("orderProduct size: "+orderProduct.size());
			List<ProductDTO> productList = new ArrayList<>();
			for(OrderDTO ele : orderProduct) {
				ProductDTO prod = productService.getProductDetail(ele.getProductId());
				prod.setCartCount(ele.getOrderProductCount());
				productList.add(prod);
			}
			log.info("productList size: "+productList.size());
			dto.setMemberName(memberService.getMember(dto.getMemberId()).getMemberName());
			dto.setProductList(productList);
			dto.setProductListSize(dto.getProductList().size());
			dto.setProductName(productService.getProductDetail(productList.get(0).getProductId()).getProductName());
		}
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
	
	@GetMapping("/searchOrder")
	public String searchOrder(SearchForm form, Model model) {
		log.info("실행");
		log.info(form.toString());
		model.addAttribute("orderList", "active");
		model.addAttribute("listType", "order");
		int searchOrderCount = 0;
		if(form.getKeyword() == null || form.getKeyword().isEmpty()) {
			if(form.getType().equals("productName")) {
				form.setKeyword(form.getProductName());
			} else if(form.getType().equals("orderNumber")) {
				form.setKeyword(Integer.toString(form.getOrderNumber()));
			} else if(form.getType().equals("deliveryStatus")) {
				form.setKeyword(form.getDeliveryStatus());
			} else {
				model.addAttribute("isAlert", true);
				model.addAttribute("alert", "검색 타입에 대한 에러가 발생하였습니다.\n다시 검색을 시도해 주세요.");
				
				return getElementList("order", 1, model);
			}
		}
		
		if(form.getType().equals("orderNumber")) {
			searchOrderCount = 1;
		} else if(form.getType().equals("productName")){
			searchOrderCount = orderService.getSearchOrderCount(form.getKeyword());
		} else if(form.getType().equals("deliveryStatus")){
			searchOrderCount = orderService.getSearchOrderCount(DeliveryStatus.fromValue(form.getKeyword()));
		} 
		log.info("searchOrderCount: "+searchOrderCount);
		model.addAttribute("searchCount", searchOrderCount);
		
		Pager pager = new Pager(10, 5, searchOrderCount, form.getPageNo() == 0 ? 1 : form.getPageNo());
		pager.setSearchType(form.getType());
		pager.setKeyword(form.getKeyword());
		
		List<OrderDTO> searchList = orderService.getSearchOrderList(pager);
		log.info(searchList.toString());
		if(searchList.isEmpty()) {
			model.addAttribute("isAlert", true);
			model.addAttribute("alert", "검색 결과가 존재하지 않습니다.");
			
			return getElementList("order", 1, model);
		}
		
		for(OrderDTO dto : searchList) {
			List<OrderDTO> orderProduct = orderService.getOrderProduct(dto);
			log.info("orderProduct size: "+orderProduct.size());
			List<ProductDTO> productList = new ArrayList<>();
			for(OrderDTO ele : orderProduct) {
				ProductDTO prod = productService.getProductDetail(ele.getProductId());
				prod.setCartCount(ele.getOrderProductCount());
				productList.add(prod);
			}
			log.info("productList size: "+productList.size());
			dto.setMemberName(memberService.getMember(dto.getMemberId()).getMemberName());
			dto.setProductList(productList);
			dto.setProductListSize(dto.getProductList().size());
			dto.setProductName(productService.getProductDetail(productList.get(0).getProductId()).getProductName());
		}
		
		model.addAttribute("orderList", searchList);
		model.addAttribute("pager", pager);
		model.addAttribute("isSearchPage", true);
		
		return "admin/adminOrderList";
	}
}
