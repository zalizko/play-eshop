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

import play.db.jpa.GenericModel;

/**
 * The persistent class for the product_catalog database table.
 * 
 */
@Entity
@Table(name = "product_catalog")
public class ProductCatalog extends GenericModel {

	@Id
	@Column(name = "product_catalog", unique = true, nullable = false)
	//@GenericGenerator(strategy = "product_catalogg", name = "system-uuid")
	public int productCatalog;

	@Column(name = "cat_level", precision = 10)
	public BigDecimal catLevel;

	@Column(name = "catalog_code", length = 20)
	public String catalogCode;

	@Column(name = "catalog_type", precision = 10)
	public BigDecimal catalogType;

	@Temporal(TemporalType.TIMESTAMP)
	public Date created;

	@Column(name = "created_by", precision = 10)
	public BigDecimal createdBy;

	@Column(precision = 10)
	public BigDecimal customer;

	@Column(length = 500)
	public String description;

	@Column(name = "item_count", precision = 10)
	public BigDecimal itemCount;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_item_created")
	public Date lastItemCreated;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_item_updated")
	public Date lastItemUpdated;

	@Column(length = 100)
	public String name;

	@Column(name = "status_type", precision = 10)
	public BigDecimal statusType;

	@Column(name = "struct_unit", precision = 10)
	public BigDecimal structUnit;

	@Temporal(TemporalType.TIMESTAMP)
	public Date updated;

	@Column(name = "updated_by", precision = 10)
	public BigDecimal updatedBy;

	@Column(name = "upper_catalog", precision = 10)
	public BigDecimal upperCatalog;

	// bi-directional many-to-one association to ProductProductCatalog
	@OneToMany(mappedBy = "productCatalogBean")
	public Set<ProductProductCatalog> productProductCatalogs;

}