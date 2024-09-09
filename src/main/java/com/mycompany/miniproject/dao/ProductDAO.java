package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductDTO;

@Mapper
public interface ProductDAO {
	public List<ProductDTO> selectNewProduct();

	public ProductDTO selectProductImage(ProductDTO dto);

	public List<ProductDTO> selectBestProduct();
	public List<ProductDTO> selectRecomProduct();

	public List<ProductDTO> selectAll(Pager pager);

	public int countProduct();
	
}
