package com.mycompany.miniproject.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.MemberDTO;
import com.mycompany.miniproject.dto.OrderDTO;
import com.mycompany.miniproject.dto.OrderForm;
import com.mycompany.miniproject.dto.ProductDTO;
import com.mycompany.miniproject.service.MemberService;
import com.mycompany.miniproject.service.OrderService;
import com.mycompany.miniproject.service.ProductService;
import com.mycompany.miniproject.type.DeliveryStatus;
import com.mycompany.miniproject.type.ProductUsecase;
import com.mycompany.miniproject.validator.OrderValidator;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Secured("ROLE_USER")
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	
	@PostMapping("/sendCart")
	public void receiveCart(@RequestBody List<CartDTO> dto, HttpSession session, HttpServletResponse res) throws IOException {
		log.info("실행");
		log.info(dto.toString());
		
		boolean soldOut = false;
		boolean notSale = false;
		JSONArray soldOutProductId = new JSONArray();
		JSONArray notSaleProductId = new JSONArray();
		for(CartDTO ele : dto) {
			if(productService.isSoldOut(ele.getProductId())) {
				soldOut = true;
				soldOutProductId.put(ele.getProductId());
				continue;
			}
			if(!orderService.checkProductStock(ele)) {
				notSale = true;
				notSaleProductId.put(ele.getProductId());
			}
		}
		
		JSONObject json = new JSONObject();
		if(soldOut || notSale) {
			if(soldOut) {
				json.put("status", "sold_out");
				json.put("soldOutProductId", soldOutProductId);
			} else {
				json.put("status", "out_of_stock");
				json.put("notSaleProductId", notSaleProductId);
			}
		} else {
			session.setAttribute("cartList", dto);
			json.put("status", "ok");
			json.put("redirect", "payment");
		}
		
		
		res.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = res.getWriter();
		pw.println(json.toString());
		pw.flush();
		pw.close();
	}
	
	@GetMapping("/payment")
	@SuppressWarnings("unchecked")
	public String getOrderDetail(HttpSession session, Model model) {
		log.info("실행");
		
		List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
		if(cartList == null) return "redirect:/order/cart";
		
		OrderDTO dto = new OrderDTO();
		MemberDTO user = memberService.getMemberInfo();
		List<ProductDTO> productList = new ArrayList<>();
		
		for(CartDTO cart : cartList) {
			ProductDTO prod = productService.getProductDetail(cart.getProductId());
			for(ProductDTO ele : productService.getImageNames(prod)) {
				if(ele.getProductUsecase() == ProductUsecase.THUMBNAIL) {
					prod.setImageOriginalName(ele.getImageOriginalName());
					break;
				}
			}
			prod.setCartCount(cart.getCartCount());
			prod.setProductPrice(prod.getProductPrice()*prod.getCartCount());
			productList.add(prod);
			dto.setOrderTotalPrice(dto.getOrderTotalPrice()+prod.getProductPrice());
		}
		dto.setProductList(productList);
		dto.setMemberId(user.getMemberId());
		dto.setReceiverName(user.getMemberName());
		dto.setReceiverEmail(user.getMemberEmail());
		dto.setReceiverPhoneNum(user.getPhoneNum());
		dto.setDeliveryPostNum(user.getPostNum());
		dto.setDeliveryAddress(user.getAddress());
		dto.setDeliveryAddressDetail(user.getAddressDetail());
		
		log.info(dto.toString());
		//session.removeAttribute("cartList");
		model.addAttribute("orderData", dto);
		
		return "order/orderSheet";
	}
	
	@RequestMapping("/orderPay")	
	public String getorderPay() {
		log.info("실행");
		return "order/orderPay";
	}
	
	@PostMapping("/addCart")
	public void addItemCart(CartDTO cartDto, HttpSession session, HttpServletResponse res, Authentication auth) throws IOException{
		
	    String memberId = auth.getName(); 
	    JSONObject json = new JSONObject();
	    if(!memberId.equals("anonymousUser")) {
	    	log.info("productId: " + cartDto.getProductId());
			cartDto.setMemberId(memberId);
			
			
			if(orderService.addItemToCart(cartDto)) {
				json.put("status", "ok");
				session.setAttribute("commonCartCount", orderService.getCartItemCount(memberId));
			} else {
				json.put("status", "fail");
			}
	    } else {
	    	json.put("status", "fail");
	    }
		
		
		res.setContentType("application/json; charset=UTF-8");
		PrintWriter printwriter = res.getWriter();
		printwriter.println(json.toString());
		printwriter.flush();
		printwriter.close();
	}
	
	@PostMapping("/addCartForm")
	public String addCartFromForm(CartDTO dto, HttpSession session, Authentication auth) {
		log.info("실행");
		log.info(dto.toString());
		dto.setMemberId(auth.getName());
		orderService.addItemsToCart(dto);
		session.setAttribute("commonCartCount", orderService.getCartItemCount(auth.getName()));
		
		return "redirect:/order/cart";
	}
	
	@PostMapping("/instantOrder")
	public String instantOrder(CartDTO dto, Model model, HttpSession session) {
		log.info("실행");
		log.info(dto.toString());
		
		OrderDTO order = new OrderDTO();
		MemberDTO user = memberService.getMemberInfo();
		List<ProductDTO> productList = new ArrayList<>();
		dto.setMemberId(user.getMemberId());
		dto.setOrderTotalPrice(dto.getProductCurrentPrice()*dto.getCartCount());
		
		ProductDTO prod = productService.getProductDetail(dto.getProductId());
		for(ProductDTO ele : productService.getImageNames(prod)) {
			if(ele.getProductUsecase() == ProductUsecase.THUMBNAIL) {
				prod.setImageOriginalName(ele.getImageOriginalName());
				break;
			}
		}
		prod.setCartCount(dto.getCartCount());
		prod.setProductPrice(dto.getOrderTotalPrice());
		productList.add(prod);
		order.setOrderTotalPrice(dto.getOrderTotalPrice());
		
		order.setProductList(productList);
		order.setMemberId(user.getMemberId());
		order.setReceiverName(user.getMemberName());
		order.setReceiverEmail(user.getMemberEmail());
		order.setReceiverPhoneNum(user.getPhoneNum());
		order.setDeliveryPostNum(user.getPostNum());
		order.setDeliveryAddress(user.getAddress());
		order.setDeliveryAddressDetail(user.getAddressDetail());
		
		log.info(dto.toString());
		model.addAttribute("orderData", order);
		session.setAttribute("directCart", dto);
		
		return "order/orderSheet";
	}
	
	@GetMapping("/cart")
	public String getCart(Model model) {
		CartDTO cartDto = new CartDTO();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		cartDto.setMemberId(authentication.getName());
		
		List<ProductDTO> cartItemList = orderService.getCartItemsByMemberId(cartDto);
		if(cartItemList.isEmpty()) return "order/orderCartNothing";
		
		int totalPrice = 0;
        for (ProductDTO item : cartItemList) {
        	cartDto.setProductId(item.getProductId());
        	item.setProductPrice(orderService.getSingleProductTotalPrice(cartDto));
            totalPrice += item.getProductPrice();
        }
        model.addAttribute("cartItemList", cartItemList);
        model.addAttribute("totalPrice", totalPrice);
		 
		return "order/orderCart";
	}
	
	
	@PostMapping("/updateQty")
	public void updateQty(CartDTO dto, Authentication authentication, HttpSession session, HttpServletResponse res) throws IOException {
		log.info("실행");
		
		JSONObject json = new JSONObject();
		String memberId = authentication.getName();
		dto.setMemberId(memberId);
		log.info(dto.toString());
		
		if(orderService.updateCartCount(dto)) {
			int productPrice = orderService.getSingleProductTotalPrice(dto);
			List<ProductDTO> cartItemList = orderService.getCartItemsByMemberId(dto);
			int totalPrice = 0;
	        for (ProductDTO item : cartItemList) {
	            totalPrice += item.getProductPrice() * item.getCartCount();
	        }
	        session.setAttribute("commonCartCount", orderService.getCartItemCount(memberId));
			json.put("status", "ok");
			json.put("productPrice", productPrice);
			json.put("totalPrice", totalPrice);
		} else {
			json.put("status", "fail");
		}
		
		res.setContentType("applcation/json; charset=UTF-8");
		PrintWriter pw = res.getWriter();
		pw.println(json.toString());
		pw.flush();
		pw.close();
		
	}
	
	@PostMapping("/deleteCartItem")
	public String removeItem(
			@RequestParam(value="productId", required=true) int productId,
			Authentication authentication,
			HttpSession session) {
		
		log.info("productId: "+productId);
		CartDTO cartDto = new CartDTO();
		cartDto.setMemberId(authentication.getName());
		cartDto.setProductId(productId);
		
		orderService.removeCartItem(cartDto);
		session.setAttribute("commonCartCount", orderService.getCartItemCount(cartDto.getMemberId()));
		
		return "redirect:/order/cart";
	}
	
	@PostMapping("/deleteCartItems")
	public void removeItems(
			@RequestBody List<CartDTO> list, 
			Authentication authentication,
			HttpSession session,
			HttpServletResponse res) throws IOException {
		log.info("실행");
		JSONObject json = new JSONObject();
		
		String member = authentication.getName();
		if (member != null) {
			for(CartDTO dto : list) {
				dto.setMemberId(member);
			}
			orderService.removeCartItems(list);
			session.setAttribute("commonCartCount", orderService.getCartItemCount(member));
			
			json.put("status", "ok");
		} else {
			json.put("status", "not-found-user");
		}
		
		res.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = res.getWriter();
		pw.println(json.toString());
		pw.flush();
		pw.close();
	}
	
	@InitBinder("orderForm")
	public void orderFormBinder(WebDataBinder binder) {
		log.info("유효성 검증 실행");
		binder.setValidator(new OrderValidator());
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping("/submitOrder")
	public void submitOrder(@RequestBody @Valid OrderForm orderForm, Errors error, HttpSession session, HttpServletResponse res) throws IOException {
		log.info("실행");
		JSONObject response = new JSONObject();
		
		if(error.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
            error.getFieldErrors().forEach(fieldError -> 
            	errorMap.put(fieldError.getField(), fieldError.getDefaultMessage())
            );
            response.put("status", "fail");
            response.put("errors", errorMap);
            res.setContentType("application/json; charset=UTF-8");
            PrintWriter pw = res.getWriter();
            pw.println(response.toString());
            pw.flush();
            pw.close();
            return;
		}
		
		OrderDTO dto = new OrderDTO();
		MemberDTO user = memberService.getMemberInfo();
		dto.setMemberId(user.getMemberId());
		dto.setDeliveryPostNum(orderForm.getDeliveryPostNum());
		dto.setDeliveryAddress(orderForm.getDeliveryAddress());
		dto.setDeliveryAddressDetail(orderForm.getDeliveryAddressDetail());
		dto.setReceiverName(orderForm.getReceiverName());
		dto.setReceiverPhoneNum(orderForm.getReceiverPhoneNum());
		dto.setOrderMemo(orderForm.getOrderMemo());
		dto.setDeliveryMemo(orderForm.getOrderMemo());
		dto.setDeliveryStatus(DeliveryStatus.DELIVERY_STAY);
		dto.setOrderTotalPrice(orderForm.getOrderTotalPrice());
		dto.setProductList(orderForm.getProductList());
		
		boolean complete = true;
		int orderNumber = orderService.addOrder(dto);
		if(orderNumber == 0 ) {
			log.info("상품 주문 프로세스에 오류가 발생.");
			response.put("status", "not-add-order");
			response.put("redirect", "payment");
			complete = false;
		}
		
		List<CartDTO> cart = (List<CartDTO>) session.getAttribute("cartList");
		boolean direct = false;
		if(cart == null) {
			cart = new ArrayList<>();
			direct = cart.add((CartDTO) session.getAttribute("directCart"));
		}
		
		for(CartDTO ele : cart) {
			ele.setMemberId(dto.getMemberId());
		}
		if(!direct || !orderService.removeCartItems(cart)) {
			log.info("상품 주문 프로세스에 오류가 발생.");
			response.put("status", "not-remove-cart");
			response.put("redirect", "cart");
			complete = false;
		}
		
		if(complete) {
			session.removeAttribute("cartList");
			session.removeAttribute("directCart");
			session.setAttribute("commonCartCount", orderService.getCartItemCount(user.getMemberId()));
			for(CartDTO ele : cart) {
				ProductDTO product = new ProductDTO();
				product.setProductId(ele.getProductId());
				product.setCartCount(ele.getCartCount());
				productService.decreaseProductStock(product);
			}
			response.put("status", "ok");
			response.put("orderNumber", orderNumber);
			response.put("redirect", "complete");
		}
		
		res.setContentType("application/json; charset=UTF-8");
        PrintWriter pw = res.getWriter();
        pw.println(response.toString());
        pw.flush();
        pw.close();
	}
	
	@GetMapping("/complete")
	public String orderComplete(String orderNumber, Model model) {
		log.info("실행");
		
		String memberId = memberService.getMemberInfo().getMemberId();
		OrderDTO dto = new OrderDTO();
		dto.setMemberId(memberId);
		dto.setOrderNumber(Integer.parseInt(orderNumber));
		
		if(orderService.checkOrder(dto)) {
			model.addAttribute("orderNumber", orderNumber);			
			return "order/orderPay";
		} else {
			return "redirect:/mypage/mypageMain";
		}
	}
	
	@PostMapping("/update")
	public void updateOrder(@Valid OrderForm form, Errors error, HttpServletResponse res) throws IOException {
		log.info("실행");
		JSONObject json = new JSONObject();
		
		if(error.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
            error.getFieldErrors().forEach(fieldError -> 
            	errorMap.put(fieldError.getField(), fieldError.getDefaultMessage())
            );
            json.put("status", "fail");
            json.put("errors", errorMap);
            res.setContentType("application/json; charset=UTF-8");
            PrintWriter pw = res.getWriter();
            pw.println(json.toString());
            pw.flush();
            pw.close();
            return;
		}
		
		OrderDTO dto = new OrderDTO();
		dto.setOrderNumber(form.getOrderNumber());
		dto.setDeliveryPostNum(form.getDeliveryPostNum());
		dto.setDeliveryAddress(form.getDeliveryAddress());
		dto.setDeliveryAddressDetail(form.getDeliveryAddressDetail());
		dto.setDeliveryStatus(DeliveryStatus.fromValue(form.getDeliveryStatus()));
		dto.setReceiverName(form.getReceiverName());
		dto.setReceiverPhoneNum(form.getReceiverPhoneNum());
		dto.setOrderMemo(form.getOrderMemo());
		orderService.updateOrder(dto);
		
		json.put("status", "ok");
		res.setContentType("application/json; charset=UTF-8");
        PrintWriter pw = res.getWriter();
        pw.println(json.toString());
        pw.flush();
        pw.close();
	}
	
	@GetMapping("/orderDetail")
	public String getOrderDetailPage(
			@RequestParam(value="orderNumber", required=true) int orderNumber,	
			OrderDTO order, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String memberId = authentication.getName(); 
		order.setMemberId(memberId);
		List<OrderDTO> buyer = orderService.getBuyerInfo(order);
		List<OrderDTO> deliveryInfo = orderService.getDeliveryInfo(order);
		List<OrderDTO> buyProductInfo = orderService.getProductBuyInfo(order);
		log.info("buyerList:" + buyer);
		log.info("buyerList:" + deliveryInfo);
		log.info("buyerList:" + buyProductInfo);
		model.addAttribute("buyerList", buyer);
		model.addAttribute("deliList", deliveryInfo);
		model.addAttribute("buyProdList", buyProductInfo);
		
		return "/order/orderDetail";
	}
	
}