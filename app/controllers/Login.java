package controllers;

import models.CstUser;
import play.data.validation.Password;
import play.data.validation.Required;
import play.libs.Codec;
import play.mvc.Before;
import play.mvc.Controller;
import play.mvc.With;

@With(RenderVariablesAssigner.class)
public class Login extends Controller {

	public static final String TPL_LOGIN = Login.class.getSimpleName() + "/login.html";

	@Before(unless = "logout")
	static void ifLoggedIn() {
		if (isLoggedIn()) {
			goHome();
		}
	}

	private static void goHome() {
		redirect("/");
	}

	public static void index() {
		render(TPL_LOGIN);
	}

	public static boolean isLoggedIn() {
		return Session.started();
	}

	public static void login(@Required(message = "login.username.required") final String username,
			@Required(message = "login.password.required") @Password String password) {

		if (!validation.hasErrors()) {
			CstUser user = null;
			password = Codec.hexMD5(password);
			user = CstUser.find("username = ? and passw = ?", username, password).first();
			if (user == null) {
				validation.addError("common", "login.invalid.credentials", "");
			} else {
				Session.start(user);
			}
		}

		if (validation.hasErrors()) {
			validation.keep();
			redirect(request.querystring);
		} else {
			goHome();
		}
	}

	public static void logout() {
		Session.destroy();
		goHome();
	}
}
