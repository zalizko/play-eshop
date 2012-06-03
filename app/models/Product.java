package models;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import play.db.jpa.GenericModel;

/**
 * The persistent class for the product database table.
 * 
 */
@Entity
@Table(name = "product")
public class Product extends GenericModel {
	// @GeneratedValue(strategy = GenerationType.AUTO)
	// @Column(unique = true, nullable = false)

	@Id
	// @GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "product")
	public int product;

	@Column(precision = 10)
	public BigDecimal catalog;

	@Column(length = 20)
	public String code;

	@Column(length = 20)
	public String code1;

	@Temporal(TemporalType.TIMESTAMP)
	public Date created;

	@Column(name = "created_by", precision = 10)
	public BigDecimal createdBy;

	@Column(length = 300)
	public String description;

	@Column(precision = 10)
	public BigDecimal enterprise;

	@Column(length = 100)
	public String name;

	@Column(precision = 10, scale = 6)
	public BigDecimal price;

	@Column(precision = 10, scale = 6)
	public BigDecimal price2;

	@Column(precision = 10, scale = 6)
	public BigDecimal price3;

	@Column(length = 100)
	public String producer;

	@Column(name = "product_status_type", precision = 10)
	public BigDecimal productStatusType;

	@Column(name = "product_type", precision = 10)
	public BigDecimal productType;

	@Temporal(TemporalType.TIMESTAMP)
	public Date updated;

	@Column(name = "updated_by", precision = 10)
	public BigDecimal updatedBy;

	// bi-directional many-to-one association to OrderItem
	@OneToMany(mappedBy = "productBean")
	public Set<OrderItem> orderItems;

	// bi-directional many-to-one association to ProductProductCatalog
	@OneToMany(mappedBy = "productBean")
	public Set<ProductProductCatalog> productProductCatalogs;

	@Transient
	private int taken;

	public int getTaken() {
		return taken;
	}

	public void setTaken(int taken) {
		this.taken = taken;
	}

}