package com.mycompany.miniproject.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.OrderDTO;
import com.mycompany.miniproject.dto.Pager;

@Mapper
public interface OrderDAO {

	int selectAllCount();

	List<OrderDTO> selectAllOrderList(Pager pager);

	public CartDTO getSelectedProduct(CartDTO cartDto);
	public List<OrderDTO> selectOrderListByMemberId(String memberId);

}