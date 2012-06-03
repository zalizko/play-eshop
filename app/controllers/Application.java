package controllers;

import java.util.List;

import models.ProductCatalog;
import play.mvc.Before;
import play.mvc.Controller;
import play.mvc.With;
import utils.Utils;

@With(RenderVariablesAssigner.class)
public class Application extends Controller {
	@Before
	static void beforeAction() {
		Utils.assignCurrentUrl(request, params);
	}

	public static void index() {
		attachCatalog();
		render();
	}

	static void attachCatalog() {
		List<ProductCatalog> catalog = ProductCatalog.findAll();
		renderArgs.put("catalog", catalog);
	}

}