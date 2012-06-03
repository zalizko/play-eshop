package models;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import play.db.jpa.GenericModel;

/**
 * The persistent class for the order_item database table.
 * 
 */
@Entity
@Table(name = "order_item")
public class OrderItem extends GenericModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "order_item", unique = true, nullable = false)
	public int orderItem;

	@Column(precision = 10)
	public BigDecimal item;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "item_added")
	public Date itemAdded;

	@Column(name = "item_count", precision = 10)
	public BigDecimal itemCount;

	@Column(name = "item_price", precision = 10, scale = 6)
	public BigDecimal itemPrice;

	@Column(name = "item_type", precision = 10)
	public BigDecimal itemType;

	// bi-directional many-to-one association to Product
	@ManyToOne
	//@JoinColumn(name = "product")
	public Product productBean;

	// bi-directional many-to-one association to Order
	@ManyToOne
	//@JoinColumn(name = "order_")
	public Order orderBean;

}