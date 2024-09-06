package com.mycompany.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.ProductDAO;
import com.mycompany.miniproject.dto.ProductDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MainService {
	
	@Autowired
	private ProductDAO productDAO;
	
	// 뱃지 다는 방식에 대해서 깊은 논의가 필요함. db에 없으니 이거 상품 꺼내올떄마다 뱃지체크하게 생겼네
	public ProductDTO checkNewProduct(ProductDTO target) {
		List<ProductDTO> list = productDAO.selectBestProd();
		for(ProductDTO dto : list) {
			if(dto.equals(target)) {
				target.setNewProduct(true);
				break;
			}
		}
		return target;
	}
	
	public List<ProductDTO> getNewProductList() {
		List<ProductDTO> list = productDAO.selectBestProd();
		for(ProductDTO dto : list) {
			dto.setNewProduct(true);
		}
		return list;
	}
	
	public ProductDTO getProductImage(ProductDTO dto) {
		ProductDTO img = productDAO.selectProductImage(dto);
		
		return img;
	}
}
