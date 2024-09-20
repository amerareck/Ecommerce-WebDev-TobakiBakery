package com.mycompany.miniproject.type;

public enum ProductState {
	ON_SALE("ON_SALE"),
	NOT_SALE("NOT_SALE"),
	SOLD_OUT("SOLD_OUT");
	
	private final String value;
	
	ProductState(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return this.value;
	}
	
    public static ProductState fromValue(String value) {
        for (ProductState productstate : ProductState.values()) {
            if (productstate.name().equalsIgnoreCase(value)) {
                return productstate;
            }
        }
        throw new IllegalArgumentException("No enum constant for value: " + value);
    }
}
