package controllers;

import static org.apache.commons.lang.StringUtils.isNotBlank;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Predicate;
import org.apache.commons.lang.StringUtils;

import models.Product;
import models.ProductCatalog;
import play.data.binding.As;
import play.db.DB;
import play.db.jpa.GenericModel.JPAQuery;
import play.mvc.Controller;

public class Search extends Controller {

	private static final String DATE_FORMAT = "dd.MM.yyyy";

	public static void index(int category, String name, String description, String price_start, String price_end,
			@As(DATE_FORMAT) Date date_add_start, @As(DATE_FORMAT) Date date_add_end,
			@As(DATE_FORMAT) Date date_mod_start, @As(DATE_FORMAT) Date date_mod_end) {
		StringBuilder query = new StringBuilder();
		List<Object> params = new ArrayList();

		if (isNotBlank(name)) {
			addAND(query);
			query.append(" name like ? ");
			params.add(prepareParam(name));
		}

		if (isNotBlank(description)) {
			addAND(query);
			query.append(" description like ? ");
			params.add(prepareParam(description));
		}

		if (isNotBlank(price_start)) {
			BigDecimal p = null;
			try {
				p = new BigDecimal(price_start);
				addAND(query);
				query.append(" price > ? ");
				params.add(p);
			} catch (NumberFormatException e) {

			}
		}

		if (isNotBlank(price_end)) {
			BigDecimal p = null;
			try {
				p = new BigDecimal(price_end);
				addAND(query);
				query.append(" price < ? ");
				params.add(p);
			} catch (NumberFormatException e) {

			}
		}

		if (date_add_start != null) {
			addAND(query);
			query.append(" created > ? ");
			params.add(date_add_start);
		}

		if (date_add_end != null) {
			addAND(query);
			query.append(" created < ? ");
			params.add(date_add_end);
		}

		if (date_mod_start != null) {
			addAND(query);
			query.append(" updated > ? ");
			params.add(date_mod_start);
		}

		if (date_mod_end != null) {
			addAND(query);
			query.append(" updated < ? ");
			params.add(date_mod_end);
		}

		List<Product> products = Product.find(query.toString(), params.toArray()).fetch();


		if (category > 0) {

			ProductCatalog productCatalog = ProductCatalog.findById(category);

			if (productCatalog != null) {
				Connection conn = DB.getConnection();
				try {
					final List<Integer> productsInCategory = new ArrayList();
					ResultSet rs = conn.createStatement().executeQuery(
							"SELECT DISTINCT product FROM `product_product_catalog` WHERE product_catalog = "
									+ category);
					while (rs.next()) {
						productsInCategory.add(rs.getInt("product"));
					}
					CollectionUtils.filter(products, new Predicate() {
						public boolean evaluate(Object arg0) {
							int productId = ((Product) arg0).product;
							return productsInCategory.contains(productId) ? true : false;
						}
					});
				} catch (SQLException e) {

				}
			}
		}

		renderArgs.put("products", products);
		await(500);
		render();
	}

	private static String prepareParam(String p) {
		return "%" + p.trim() + "%";
	}

	private static void addAND(StringBuilder sb) {
		if (sb.length() > 0) {
			sb.append(" AND ");
		}
	}

}
