package com.mycompany.miniproject.type;

public enum ProductState {
	ON_SALE,
	NOT_SALE,
	SOLD_OUT;
	
    public static ProductState getProductState(String value) {
        for (ProductState productstate : ProductState.values()) {
            if (productstate.name().equalsIgnoreCase(value)) {
                return productstate;
            }
        }
        throw new IllegalArgumentException("No enum constant for value: " + value);
    }
}
