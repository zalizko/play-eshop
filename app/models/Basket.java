package models;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Basket implements Serializable {

	private Map<Integer, Integer> products = new HashMap<Integer, Integer>();

	public Map<Integer, Integer> getProducts() {
		return products;
	}

	public int size() {
		return getProducts().size();
	}

}
