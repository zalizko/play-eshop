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
 * The persistent class for the cst_address database table.
 * 
 */
@Entity
@Table(name = "cst_address")
public class CstAddress extends GenericModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "cst_address", unique = true, nullable = false)
	public int cstAddress;

	@Column(length = 100)
	public String address;

	@Column(name = "address_type", precision = 10)
	public BigDecimal addressType;

	@Column(precision = 10)
	public BigDecimal country;

	@Column(length = 100)
	public String county;

	@Temporal(TemporalType.TIMESTAMP)
	public Date created;

	@Column(name = "created_by", precision = 10)
	public BigDecimal createdBy;

	@Column(length = 30)
	public String email;

	@Column(length = 100)
	public String house;

	@Column(length = 20)
	public String mobile;

	@Column(length = 50)
	public String note;

	@Column(length = 100)
	public String parish;

	@Column(length = 20)
	public String phone;

	@Column(length = 20)
	public String sms;

	@Column(name = "town_county", length = 100)
	public String townCounty;

	@Temporal(TemporalType.TIMESTAMP)
	public Date updated;

	@Column(name = "updated_by", precision = 10)
	public BigDecimal updatedBy;

	@Column(length = 20)
	public String zip;

	// bi-directional many-to-one association to Customer
	@ManyToOne
	// @JoinColumn(name = "customer")
	public Customer customer;

}