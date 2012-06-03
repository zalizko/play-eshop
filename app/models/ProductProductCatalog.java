package models;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import play.db.jpa.GenericModel;

/**
 * The persistent class for the product_product_catalog database table.
 * 
 */
@Entity
@Table(name = "product_product_catalog")
public class ProductProductCatalog extends GenericModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "product_product_catalog", unique = true, nullable = false)
	public int productProductCatalog;

	@Temporal(TemporalType.TIMESTAMP)
	public Date created;

	@Column(name = "created_by", precision = 10)
	public BigDecimal createdBy;

	@Temporal(TemporalType.TIMESTAMP)
	public Date deleted;

	@Column(name = "deleted_by", precision = 10)
	public BigDecimal deletedBy;

	@Column(length = 100)
	public String note;

	@Column(name = "relation_type", precision = 10)
	public BigDecimal relationType;

	// bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name = "product")
	public Product productBean;

	// bi-directional many-to-one association to ProductCatalog
	@ManyToOne
	@JoinColumn(name = "product_catalog")
	public ProductCatalog productCatalogBean;

}