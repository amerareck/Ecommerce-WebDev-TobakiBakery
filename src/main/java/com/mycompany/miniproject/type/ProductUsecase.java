package com.mycompany.miniproject.type;

public enum ProductUsecase {
	THUMBNAIL("THUMBNAIL"),
	DETAIL("DETAIL");
	
	private final String value;
	
	ProductUsecase(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return this.value;
	}
	
    public static ProductUsecase fromValue(String value) {
        for (ProductUsecase productUsecase : ProductUsecase.values()) {
            if (productUsecase.name().equalsIgnoreCase(value)) {
                return productUsecase;
            }
        }
        throw new IllegalArgumentException("No enum constant for value: " + value);
    }
}
