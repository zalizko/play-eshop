package controllers;

import models.CstUser;
import models.LoginForm;
import models.SessionContext;
import play.cache.Cache;
import play.mvc.Before;
import play.mvc.Controller;

public class RenderVariablesAssigner extends Controller {
	@Before
	static void assignRenderArgs() {
		if (Login.isLoggedIn()) {
			SessionContext sessionContext = Session.getSessionContext();
			renderArgs.put("user", sessionContext.getUser());
			renderArgs.put("basket", sessionContext.getBasket());
			renderArgs.put("basketSize", Order.size());
		}
	}

}
