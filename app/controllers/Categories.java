package controllers;

import java.util.ArrayList;
import java.util.Map;

import java.util.List;

import org.apache.commons.lang.ArrayUtils;

import models.Product;
import models.ProductCatalog;
import models.ProductProductCatalog;
import play.data.validation.Required;
import play.i18n.Messages;
import play.mvc.Before;
import play.mvc.Controller;
import play.mvc.With;
import utils.Utils;

import static org.apache.commons.collections.CollectionUtils.isEmpty;

@With(RenderVariablesAssigner.class)
public class Categories extends Controller {
	@Before
	static void beforeAction() {
		Utils.assignCurrentUrl(request, params);
	}

	static ProductCatalog productCatalog;

	public static void category(@Required int id) {
		checkCategoryId(id);

		renderArgs.put("currentCategory", productCatalog);

		List<Product> products = new ArrayList<Product>();

		if (!isEmpty(productCatalog.productProductCatalogs)) {
			for (ProductProductCatalog ppc : productCatalog.productProductCatalogs) {
				products.add(ppc.productBean);
			}
			setTaken(products);
		}

		renderArgs.put("products", products);

		Application.attachCatalog();
		render();
	}

	private static void setTaken(List<Product> products) {
		if (!Login.isLoggedIn())
			return;
		Map<Integer, Integer> orderProducts = Order.getBasket().getProducts();

		for (Product product : products) {
			int productId = product.product;
			if (orderProducts.containsKey(productId)) {
				product.setTaken(orderProducts.get(productId));
			}
		}
	}

	static void checkCategoryId(int id) {
		if (id < 1) {
			redirect("Application.index");
		}

		productCatalog = ProductCatalog.findById(id);
		if (productCatalog == null) {
			redirect("Application.index");
		}

	}

}
