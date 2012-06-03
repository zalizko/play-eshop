package models;

import java.io.Serializable;

public class SessionContext implements Serializable {
	private CstUser user;
	private Basket basket;

	public Basket getBasket() {
		return basket;
	}

	public void setBasket(Basket basket) {
		this.basket = basket;
	}

	public CstUser getUser() {
		return user;
	}

	public void setUser(CstUser user) {
		this.user = user;
	}
}
