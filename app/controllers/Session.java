package controllers;

import java.util.Date;

import models.Basket;
import models.CstUser;
import models.SessionContext;
import play.cache.Cache;
import play.libs.Crypto;
import play.mvc.Controller;

public class Session extends Controller {
	public static String KEY_SESSION_ID = "sessionid";

	static boolean started() {
		return session.contains(KEY_SESSION_ID) && Cache.get(getSessionId()) != null;
	}

	static void start(CstUser user) {
		destroy();

		String sessionId = Crypto.sign(new Date().toString());

		SessionContext sessionContext = new SessionContext();
		sessionContext.setUser(user);
		sessionContext.setBasket(new Basket());

		session.put(KEY_SESSION_ID, sessionId);
		Cache.add(sessionId, sessionContext);
	}

	static void destroy() {
		String sessionId = Session.getSessionId();
		if (sessionId != null) {
			session.remove(KEY_SESSION_ID);
			Cache.delete(sessionId);
		}
	}

	static String getSessionId() {
		return session.get(KEY_SESSION_ID);
	}

	static SessionContext getSessionContext() {
		return Session.started() ? (SessionContext) Cache.get(getSessionId()) : null;
	}
}
