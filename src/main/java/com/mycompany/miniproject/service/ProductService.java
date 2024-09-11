package com.mycompany.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.ProductDAO;
import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	// 뱃지 다는 방식에 대해서 깊은 논의가 필요함. db에 없으니 이거 상품 꺼내올떄마다 뱃지체크하게 생겼네
	public ProductDTO checkNewProduct(ProductDTO target) {
		List<ProductDTO> list = productDAO.selectNewProduct();
		for(ProductDTO dto : list) {
			if(dto.equals(target)) {
				target.setProductNew(1);
				break;
			}
		}
		return target;
	}
	
	public List<ProductDTO> getNewProductList() {
		List<ProductDTO> list = productDAO.selectNewProduct();
		
		return list;
	}
	
	public ProductDTO getProductImage(ProductDTO dto) {
		ProductDTO img = productDAO.selectProductImage(dto);
		
		return img;
	}
	
	public ProductDTO checkBestProduct(ProductDTO target) {
		List<ProductDTO> list = productDAO.selectBestProduct();
		for(ProductDTO dto : list) {
			if(dto.equals(target)) {
				target.setProductBest(1);
				break;
			}
		}
		return target;
	}
	
	public List<ProductDTO> getBestProductList(){
		List<ProductDTO> bestList = productDAO.selectBestProduct();
		for(ProductDTO dto : bestList) {
			dto.setProductBest(1); 
		}
		return bestList;
	}
	
	public List<ProductDTO> getRecomProductList(){
		List<ProductDTO> recomList = productDAO.selectRecomProduct();
		
		return recomList;
	}
	
	public List<ProductDTO> getProductListAll(String categoryName, Pager pager){
		List<ProductDTO> prodList = productDAO.selectAll(pager);
		
		return prodList;
	}
	
	public int getProductCount(String categoryName) {
		int productCnt = productDAO.countProduct(categoryName);
		return productCnt;
	}
	
	public int getTotalRows() {
		log.info("실행");
		int totalRows = productDAO.totalRows();
		return totalRows;
	}
	
	public  ProductDTO getProductDetail(int productId) {
		 ProductDTO prodDetail = productDAO.selectProductDetail(productId);
	    return prodDetail;
	}
} 
