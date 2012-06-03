package controllers;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import models.Basket;
import models.Product;
import play.data.validation.Required;
import play.mvc.Controller;
import play.mvc.With;

/*
 * If user is not logged in then Secure controller rejects request
 */

@With({ Secure.class, RenderVariablesAssigner.class })
public class Order extends Controller {

	static Basket getBasket() {
		return Session.getSessionContext().getBasket();
	}

	public static void add(@Required Integer id) {
		// Imitation of long request for testing ajax spinner
		if (id.equals(1)) {
			await(1000);
		}

		Map<Integer, Integer> products = getBasket().getProducts();

		Integer quantity = 0;
		if (products.containsKey(id)) {
			quantity = products.get(id);
		}
		quantity++;
		products.put(id, quantity);
	}

	public static void remove(@Required Integer id) {
		Map<Integer, Integer> products = getBasket().getProducts();

		Integer quantity = 0;
		if (products.containsKey(id)) {
			quantity = products.get(id);
		}

		if (--quantity <= 0) {
			products.remove(id);
		} else {
			products.put(id, quantity);
		}

	}

	static int size() {
		Basket basket = getBasket();

		int total = 0;
		for (Integer productQuantity : basket.getProducts().values()) {
			total += productQuantity;
		}

		return total;
	}

	public static void index() {
		Map<Integer, Integer> productsMap = getBasket().getProducts();

		List<Product> products = new LinkedList<Product>();
		for (Entry<Integer, Integer> entry : productsMap.entrySet()) {
			Product product = Product.findById(entry.getKey());
			if (product == null)
				continue;
			product.setTaken(entry.getValue());
			products.add(product);
		}
		
		render(products);
	}
}
