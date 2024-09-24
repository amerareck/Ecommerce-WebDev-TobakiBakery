package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.ProductDTO;

@Mapper
public interface ProductImageDAO {

	public List<ProductDTO> selectProductName(ProductDTO dto);

	public int deleteImage(ProductDTO dto);

	public ProductDTO selectProductImage(ProductDTO dto);

	public int insertProductImage(ProductDTO dto);

	public int updateProductImage(ProductDTO dto);

	public int deleteAllProductImage(ProductDTO dto);

	public int selectProductAllImages(ProductDTO dto);
	
}
