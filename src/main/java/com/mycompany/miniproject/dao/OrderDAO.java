package com.mycompany.miniproject.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.OrderDTO;
import com.mycompany.miniproject.dto.Pager;

@Mapper
public interface OrderDAO {

	public int selectAllCount();

	public List<OrderDTO> selectAllOrderList(Pager pager);

	public CartDTO getSelectedProduct(CartDTO cartDto);
	public List<OrderDTO> selectOrderListByMemberId(String memberId);

	public int insertOrder(OrderDTO dto);

	public int selectRecentOrderNumber(OrderDTO dto);

	public int updateOrder(OrderDTO dto);

	public List<OrderDTO> selectOrderDelivery(String memberId);

	public List<OrderDTO> selectOrderDeliveryDate(OrderDTO order);
	

}