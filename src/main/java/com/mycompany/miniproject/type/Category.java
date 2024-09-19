package com.mycompany.miniproject.type;

public enum Category {
	BRADE,
	CAKE,
	DESSERT;
	
    public static Category getCategory(String value) {
        for (Category category : Category.values()) {
            if (category.name().equalsIgnoreCase(value)) {
                return category;
            }
        }
        throw new IllegalArgumentException("No enum constant for value: " + value);
    }
}
