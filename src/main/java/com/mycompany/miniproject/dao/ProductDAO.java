package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductDTO;

@Mapper
public interface ProductDAO {
	public List<ProductDTO> selectNewProduct();

	public List<ProductDTO> selectBestProduct();
	public List<ProductDTO> selectRecomProduct();

	public List<ProductDTO> selectAll(Pager pager);

	public int countProduct(String categoryName);

	public ProductDTO selectProductDetail(int productId);

	public int totalRows();

	public ProductDAO getProductById(int productId);

	public int insertProduct(ProductDTO dto);

	public ProductDTO selectRecentProductId(String productName);

	public int selectProductAllCount();

	public List<ProductDTO> selectAllProductList(Pager pager);

	public List<String> selectImageNamesWithProductId(int productId);

	public int updateProduct(ProductDTO dto);

	public int deleteProduct(ProductDTO dto);
}
