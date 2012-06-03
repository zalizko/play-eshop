package models;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import play.db.jpa.GenericModel;

/**
 * The persistent class for the customer database table.
 * 
 */
@Entity
@Table(name = "customer")
public class Customer extends GenericModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(unique = true, nullable = false)
	public int customer;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "birth_date")
	public Date birthDate;

	@Temporal(TemporalType.TIMESTAMP)
	public Date created;

	@Column(name = "created_by", precision = 10)
	public BigDecimal createdBy;

	@Column(name = "cst_state_type", nullable = true)
	public Integer cstStateType;

	@Column(name = "cst_type")
	public Integer cstType;

	@Column(name = "first_name", length = 100)
	public String firstName;

	@Column(name = "identity_code", length = 20)
	public String identityCode;

	@Column(name = "last_name", length = 100)
	public String lastName;

	@Column(length = 1000)
	public String note;

	@Temporal(TemporalType.TIMESTAMP)
	public Date updated;

	@Column(name = "updated_by", precision = 10)
	public BigDecimal updatedBy;

	// bi-directional many-to-one association to CstUser
	@OneToMany(mappedBy = "customer")
	public Set<CstUser> cstUsers;

	// bi-directional many-to-one association to CstAddress
	@OneToMany(mappedBy = "customer")
	public Set<CstAddress> cstAddresses;

	// bi-directional many-to-one association to Order
	@OneToMany(mappedBy = "customer")
	public Set<Order> orders;

}