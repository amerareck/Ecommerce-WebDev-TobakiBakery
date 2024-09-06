package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.ProductDTO;

@Mapper
public interface ProductDAO {
	public List<ProductDTO> selectBestProd();

	public ProductDTO selectProductImage(ProductDTO dto);
	
}
