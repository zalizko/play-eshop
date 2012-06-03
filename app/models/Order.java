package models;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import play.db.jpa.GenericModel;

/**
 * The persistent class for the order_ database table.
 * 
 */
@Entity
@Table(name = "order_")
public class Order extends GenericModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "order_", unique = true, nullable = false)
	public int order;

	@Column(length = 50)
	public String a1;

	@Column(length = 50)
	public String a2;

	@Temporal(TemporalType.TIMESTAMP)
	public Date completed;

	@Column(name = "completed_by", precision = 10)
	public BigDecimal completedBy;

	@Temporal(TemporalType.TIMESTAMP)
	public Date confirmed;

	@Column(name = "confirmed_by", precision = 10)
	public BigDecimal confirmedBy;

	@Column(precision = 10)
	public BigDecimal contract;

	@Temporal(TemporalType.TIMESTAMP)
	public Date created;

	@Column(name = "created_by", precision = 10)
	public BigDecimal createdBy;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "customer_confirmed")
	public Date customerConfirmed;

	@Column(name = "customer_confirmed_by", precision = 10)
	public BigDecimal customerConfirmedBy;

	@Temporal(TemporalType.TIMESTAMP)
	public Date d1;

	@Temporal(TemporalType.TIMESTAMP)
	public Date d2;

	@Column(name = "e_shop_chart", precision = 10)
	public BigDecimal eShopChart;

	@Column(precision = 10)
	public BigDecimal n1;

	@Column(precision = 10)
	public BigDecimal n2;

	@Column(length = 300)
	public String note;

	@Column(precision = 10)
	public BigDecimal offer;

	@Column(name = "order_number", length = 20)
	public String orderNumber;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "order_status_date")
	public Date orderStatusDate;

	@Column(name = "order_status_type", precision = 10)
	public BigDecimal orderStatusType;

	@Column(name = "order_type", precision = 10)
	public BigDecimal orderType;

	@Temporal(TemporalType.TIMESTAMP)
	public Date payd;

	@Column(precision = 10)
	public BigDecimal project;

	@Temporal(TemporalType.TIMESTAMP)
	public Date shipped;

	@Column(name = "shipping_address", precision = 10)
	public BigDecimal shippingAddress;

	@Column(name = "struct_unit", precision = 10)
	public BigDecimal structUnit;

	@Temporal(TemporalType.TIMESTAMP)
	public Date updated;

	@Column(name = "updated_by", precision = 10)
	public BigDecimal updatedBy;

	// bi-directional many-to-one association to Customer
	@ManyToOne
	@JoinColumn(name = "customer")
	public Customer customer;

	// bi-directional many-to-one association to OrderItem
	@OneToMany(mappedBy = "orderBean")
	public Set<OrderItem> orderItems;

}