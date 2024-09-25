package com.mycompany.miniproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.ProductDAO;
import com.mycompany.miniproject.dao.ProductImageDAO;
import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductDTO;
import com.mycompany.miniproject.type.ProductUsecase;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductImageDAO imageDAO;
	
	
	public List<ProductDTO> getNewProductList(Pager pager) {
		List<ProductDTO> list = productDAO.selectNewProduct(pager);
		return list;
	}
	
	public ProductDTO getProductImage(ProductDTO dto) {
		return imageDAO.selectProductImage(dto);
	}
	
	
	public List<ProductDTO> getBestProductList(Pager pager){
		List<ProductDTO> bestList = productDAO.selectBestProduct(pager);
		return bestList;
	}
	
	public List<ProductDTO> getRecomProductList(Pager pager){
		List<ProductDTO> recomList = productDAO.selectRecomProduct(pager);
		
		return recomList;
	}
	
	public List<ProductDTO> getCategoryProductList(String categoryName, Pager pager){
		List<ProductDTO> prodList = productDAO.selectCategoryProductList(pager);
		
		return prodList;
	}
	
	public int getCategoryProductCount(String categoryName) {
		int productCnt = productDAO.countCategoryProduct(categoryName);
		return productCnt;
	}
	
	public int getProductBestCount() {
		int countBest = productDAO.selectProductBestCount();
		return countBest;
	}
	public int getProductNewCount() {
		int countNew = productDAO.selectProductNewCount();
		return countNew;
	}
	public int getProductRecomCount() {
		int countRecom = productDAO.selectProductRecomCount();
		return countRecom;
	}
	
	public int getTotalRows() {
		log.info("실행");
		int totalRows = productDAO.totalRows();
		return totalRows;
	}
	
	public ProductDTO getProductDetail(int productId) {
		 ProductDTO prodDetail = productDAO.selectProductDetail(productId);
	    return prodDetail;
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
		int count = imageDAO.selectProductAllImagesCount(dto);
		boolean check = imageDAO.deleteAllProductImage(dto) == count;
		if(check) {
			check = productDAO.deleteProduct(dto) == 1;
		}
		return check;
	}

	public boolean removeProductList(List<ProductDTO> list) {
		// 트랜잭션 처리는 removeProduct 메소드에 위임.
		for(ProductDTO dto : list) {
			if(!removeProduct(dto)) {
				return false;
			}
		}
		return true;
	}

	public List<ProductDTO> getProductSmartRecom(String categoryName) {
		return productDAO.selectSmartRecom(categoryName);
	}
	
	public String getProductCategoryName(int productId) {
		return productDAO.selectProductCategory(productId);
	}

	public List<ProductDTO> getResultSearchProduct(Pager pager) {
		List<ProductDTO> list = null;
		// 검색 유형에 따라 상품 리스트 호출
		if(pager.getSearchType().equals("productName")) {
			list = productDAO.selectResultSearchProductByName(pager);
		} else if(pager.getSearchType().equals("category")) {
			list = productDAO.selectResultSearchProductByCategory(pager);
		} else if(pager.getSearchType().equals("productState")) {
			list = productDAO.selectResultSearchProductByProductState(pager);
		} else {
			list = new ArrayList<ProductDTO>();
		}
		
		// 섬네일 이미지 가져오기
		if(!list.isEmpty()) {
			for(ProductDTO dto : list) {
				dto.setProductUsecase(ProductUsecase.THUMBNAIL);
				ProductDTO image = imageDAO.selectProductImage(dto);
				dto.setImageOriginalName(image.getImageOriginalName());
				dto.setImageType(image.getImageType());
				dto.setImageData(image.getImageData());
			}
		}
		return list;
	}

	public int getSearchProductCount(String type, String keyword) {
		int count = 0;
		// 검색 유형에 따라 상품 총 갯수 호출
		if(type.equals("productName")) {
			count = productDAO.selectSearchCountByName(keyword);
		} else if(type.equals("category")) {
			count = productDAO.selectSearchCountByCategory(keyword);
		} else if(type.equals("productState")) {
			count = productDAO.selectSearchCountByProductState(keyword);
		}
		
		return count;
	}
	
	public int updateNewProductList() {
		log.info("실행");
		 productDAO.resetProductNew();
		 int prodNewUpdate = productDAO.updateNewProduct();
		return prodNewUpdate;
	}

	public int updateBestProductList() {
		log.info("실행");
		 productDAO.resetProductBest();
		 int prodBestUpdate = productDAO.updateBestProduct();
		return prodBestUpdate;
	}
} 
