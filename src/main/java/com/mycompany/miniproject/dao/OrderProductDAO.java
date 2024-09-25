package com.mycompany.miniproject.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.OrderDTO;

@Mapper

public interface OrderProductDAO {

	public int insertOrderProduct(OrderDTO dto);
	
}
