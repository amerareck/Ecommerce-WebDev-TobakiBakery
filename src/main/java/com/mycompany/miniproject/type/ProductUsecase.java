package com.mycompany.miniproject.type;

public enum ProductUsecase {
	THUMBNAIL,
	DETAIL;
	
    public static ProductUsecase getProductUsecaseType(String value) {
        for (ProductUsecase productUsecase : ProductUsecase.values()) {
            if (productUsecase.name().equalsIgnoreCase(value)) {
                return productUsecase;
            }
        }
        throw new IllegalArgumentException("No enum constant for value: " + value);
    }
}
