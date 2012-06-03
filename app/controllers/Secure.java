package controllers;

import play.mvc.Before;
import play.mvc.Controller;
import play.mvc.Http.StatusCode;

public class Secure extends Controller {

	@Before
	static void checkAuthorities() {
		if (!Login.isLoggedIn()) {
			response.status = StatusCode.FORBIDDEN;
		}
	}
}
