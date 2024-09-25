package com.mycompany.miniproject.type;

public enum DeliveryStatus {
	DELIVERY_STAY("DELIVERY_STAY"),
	DELIVERY_ING("DELIVERY_ING"),
	DELIVERY_CANCEL("DELIVERY_CANCEL");
	
	private final String value;
	
	DeliveryStatus(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return this.value;
	}
	
    public static DeliveryStatus fromValue(String value) {
        for (DeliveryStatus deliverystate : DeliveryStatus.values()) {
            if (deliverystate.name().equalsIgnoreCase(value)) {
                return deliverystate;
            }
        }
        throw new IllegalArgumentException("No enum constant for value: " + value);
    }
}
