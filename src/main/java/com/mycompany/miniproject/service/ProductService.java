package com.mycompany.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.ProductDAO;
import com.mycompany.miniproject.dao.ProductImageDAO;
import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductImageDAO imageDAO;
	
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
		return imageDAO.selectProductImage(dto);
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

	public static List<ProductDAO> getProductsByIds(String[] productIdArray) {
		
		return null;
	}

	public boolean insertProduct(ProductDTO dto) {
		return productDAO.insertProduct(dto) == 1;
	}

	public boolean insertProductImage(ProductDTO dto) {
		return imageDAO.insertProductImage(dto) == 1;
	}

	public int getRecentProductId(String productName) {
		ProductDTO dto = productDAO.selectRecentProductId(productName);
		if(dto!=null) {
			return dto.getProductId();
		}
		return 0;
	}

	public int getProductAllCount() {
		return productDAO.selectProductAllCount();
	}

	public List<ProductDTO> getAllProductList(Pager pager) {
		return productDAO.selectAllProductList(pager);
	}

	public List<ProductDTO> getImageNames(ProductDTO dto) {
		return imageDAO.selectProductName(dto);
	}

	public boolean removeImage(ProductDTO dto) {
		return imageDAO.deleteImage(dto) == 1;
	}

	public boolean updateProduct(ProductDTO dto) {
		return productDAO.updateProduct(dto) == 1;
	}

	public boolean updateDetailImage(ProductDTO dto) {
		if (getProductImage(dto) != null) {
			return imageDAO.updateProductImage(dto) == 1;
		} else {
			return insertProductImage(dto);
		}
	}

	public boolean removeProduct(ProductDTO dto) {
		// 트랜잭션 처리 요망
		int count = imageDAO.selectProductAllImages(dto);
		boolean check = imageDAO.deleteAllProductImage(dto) == count;
		if(check) {
			check = productDAO.deleteProduct(dto) == 1;
		}
		return check;
	}
} 
