package com.mycompany.miniproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.CartDAO;
import com.mycompany.miniproject.dao.OrderDAO;
import com.mycompany.miniproject.dao.OrderProductDAO;
import com.mycompany.miniproject.dao.ProductDAO;
import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.OrderDTO;
import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductDTO;
import com.mycompany.miniproject.type.DeliveryStatus;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class OrderService {
	
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private OrderProductDAO orderProductDAO;
	@Autowired
	private ProductDAO productDAO;
	
	public List<ProductDTO> getCartItemsByMemberId(CartDTO cartDto) {
		log.info("장바구니 로딩");
		return cartDAO.selectCartItemsByMemberId(cartDto);
	}
	
	public boolean addItemToCart(CartDTO cartDto) {
		CartDTO dto = checkCart(cartDto);
		
		if (dto==null) {
			return cartDAO.insertCartItem(cartDto) == 1;
		} else {
			cartDto.setCountHandler(cartDto.getCartCount()+1);
			return cartDAO.updateCartCount(cartDto) == 1;
		}
		
	}
	
	public boolean addItemsToCart(CartDTO dto) {
		if(dto.getCartCount() < 2) {
			return addItemToCart(dto);
		} else {
			if(checkCart(dto) == null) {
				return cartDAO.insertCartItemForProducts(dto) == 1;
			} else {
				dto.setCountHandler(dto.getCartCount());
				return cartDAO.updateCartCount(dto) == 1;
			}
		}
	}
		
	public CartDTO checkCart(CartDTO cartDto) {
		return cartDAO.checkCartProduct(cartDto);
	}
	
	public boolean updateCartCount(CartDTO cartDto) {
		return cartDAO.updateCartCount(cartDto) == 1;
	}

	public void deleteItem(CartDTO cartDto) {
		try {
			cartDAO.deleteCartProduct(cartDto);
			
		}catch(Exception e) {
			throw e;
		}		
	}

	public int getOrderAllCount() {
		return orderDAO.selectAllCount();
	}

	public List<OrderDTO> getAllOrderList(Pager pager) {
		return orderDAO.selectAllOrderList(pager);
	}
	
	public List<OrderDTO> getOrderProduct(OrderDTO dto) {
		return orderProductDAO.getProductInfo(dto.getOrderNumber());
	}

	public boolean removeCartItem(CartDTO cartDto) {
		return cartDAO.deleteCartItem(cartDto) == 1;
		
	}
	public int getCartItemCount(String memberId) {
		return cartDAO.countCartItem(memberId);
	}

	public boolean removeCartItems(List<CartDTO> list) {
		for(CartDTO dto : list) {
			if(!removeCartItem(dto)) {
				return false;
			}
		}
		return true;
	}

	public int getSingleProductTotalPrice(CartDTO dto) {
		return productDAO.selectTotalPrice(dto);
	}
	public List<OrderDTO> getOrderListByMemberId(String memberId) {
	 	log.info("이거 서비스인데 실행되나?");
        return orderDAO.selectOrderListByMemberId(memberId);
    }

	public int addOrder(OrderDTO dto) {
		//트랜잭션 요망
		int result = 0;
		if(orderDAO.insertOrder(dto) == 1) {
			int orderNumber = orderDAO.selectRecentOrderNumber(dto);
			for(ProductDTO prodDTO : dto.getProductList()) {
				dto.setOrderNumber(orderNumber);
				dto.setOrderProductCount(prodDTO.getCartCount());
				dto.setOrderProductPrice(prodDTO.getProductPrice());
				dto.setProductId(prodDTO.getProductId());
				orderProductDAO.insertOrderProduct(dto);
				result = orderNumber;
			}
		}
		return result;
	}

	public boolean updateOrder(OrderDTO dto) {
		return orderDAO.updateOrder(dto) == 1;
	}

	public List<OrderDTO> getSelectOrderDelivery(String memberId) {
		
		List<OrderDTO> orderDelivery = orderDAO.selectOrderDelivery(memberId);
		if(orderDelivery == null) {
			return null;
		}else {
		return orderDelivery;
		}
	}

	public List<OrderDTO> selectOrderDateSearch(OrderDTO order) {
		List<OrderDTO> orderDeliveryDate = orderDAO.selectOrderDeliveryDate(order);
		if(orderDeliveryDate == null) {
			return null;
		}else {
		return orderDeliveryDate;
		}
	}


	public int getSearchOrderCount(String productName) {
		Integer productId = productDAO.selectProductIdByProductName(productName);
		if(productId != null) {
			return orderProductDAO.searchOrderCountByProductId(productId);
		} else {
			return 0;
		}
	}

	public int getSearchOrderCount(DeliveryStatus deliveryStatus) {
		return orderDAO.searchOrderCountByDeliveryStatus(deliveryStatus.toString());
	}

	public List<OrderDTO> getSearchOrderList(Pager pager) {
		int start = pager.getStartRowNo();
		int end = pager.getEndRowNo();
		List<OrderDTO> list = new ArrayList<>();
		
		if(pager.getSearchType().equals("productName")) {
			Integer productId = productDAO.selectProductIdByProductName(pager.getKeyword());
			if(productId != null) {
				for(Integer orderNumber : orderProductDAO.searchOrderNumberByProductId(productId)) {
					if(start > end || orderNumber == null) break;
					
					OrderDTO dto = orderDAO.searchOrderByOrderNumber(orderNumber);
					if(dto == null) break;
					
					list.add(dto);
					start++;
				}
			}
		} else if(pager.getSearchType().equals("orderNumber")) {
			//단일 값 리턴
			OrderDTO dto = orderDAO.searchOrderByOrderNumber(Integer.parseInt(pager.getKeyword()));
			if(dto != null) list.add(dto);
		} else if(pager.getSearchType().equals("deliveryStatus")) {
			list = orderDAO.searchOrderByDeliveryStatus(pager);
		}
		
		return list;
	}

	public boolean checkProductStock(CartDTO dto) {
		log.info("실행");
		int stock = productDAO.selectProductStock(dto.getProductId());
		return stock - dto.getCartCount() >= 0;
	}

	public List<OrderDTO> getBuyerInfo(OrderDTO order) {
		List<OrderDTO> buyerInfo = orderDAO.selectBuyerInfo(order);
		return buyerInfo;
	}

	public List<OrderDTO> getDeliveryInfo(OrderDTO order) {
		List<OrderDTO> deliveryInfo = orderDAO.selectDeliveryInfo(order);

		return deliveryInfo;
	}

	public List<OrderDTO> getProductBuyInfo(OrderDTO order) {
		List<OrderDTO> productBuyInfo = orderDAO.selectproductBuyInfo(order);
		return productBuyInfo;
	}

	public boolean checkOrder(OrderDTO dto) {
		return orderDAO.selectOrderSingleRow(dto) != null;
	}

}