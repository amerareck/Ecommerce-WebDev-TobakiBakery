package com.mycompany.miniproject.type;

public enum Category {
	BRADE("BRADE"),
	CAKE("CAKE"),
	DESSERT("DESSERT");
	
	private final String value;
	
	Category(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return this.value;
	}
	
    public static Category fromValue(String value) {
        for (Category category : Category.values()) {
            if (category.name().equalsIgnoreCase(value)) {
                return category;
            }
        }
        throw new IllegalArgumentException("No enum constant for value: " + value);
    }
}
