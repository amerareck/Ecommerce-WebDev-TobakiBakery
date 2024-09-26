package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.OrderDTO;

@Mapper

public interface OrderProductDAO {

	public int insertOrderProduct(OrderDTO dto);

	public List<OrderDTO> getProductInfo(int orderNumber);
	
}
