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
 * The persistent class for the cst_user database table.
 * 
 */
@Entity
@Table(name = "cst_user")
public class CstUser extends GenericModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "cst_user", unique = true, nullable = false)
	public int cstUser;

	@Column(name = "contact_email", length = 30)
	public String contactEmail;

	@Temporal(TemporalType.TIMESTAMP)
	public Date created;

	@Column(name = "created_by", precision = 10)
	public BigDecimal createdBy;

	@Column(name = "last_session", precision = 10)
	public BigDecimal lastSession;

	@Column(length = 300)
	public String passw;

	@Temporal(TemporalType.TIMESTAMP)
	public Date updated;

	@Column(name = "updated_by", precision = 10)
	public BigDecimal updatedBy;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "user_status_date")
	public Date userStatusDate;

	@Column(name = "user_status_type", precision = 10)
	public BigDecimal userStatusType;

	@Column(length = 20)
	public String username;

	// bi-directional many-to-one association to Customer
	@ManyToOne
	@JoinColumn(name = "customer")
	public Customer customer;

	public String getContactEmail() {
		return contactEmail;
	}

	public Date getCreated() {
		return created;
	}

	public BigDecimal getCreatedBy() {
		return createdBy;
	}

	public int getCstUser() {
		return cstUser;
	}

	public Customer getCustomer() {
		return customer;
	}

	public BigDecimal getLastSession() {
		return lastSession;
	}

	public String getPassw() {
		return passw;
	}

	public Date getUpdated() {
		return updated;
	}

	public BigDecimal getUpdatedBy() {
		return updatedBy;
	}

	public String getUsername() {
		return username;
	}

	public Date getUserStatusDate() {
		return userStatusDate;
	}

	public BigDecimal getUserStatusType() {
		return userStatusType;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public void setCreatedBy(BigDecimal createdBy) {
		this.createdBy = createdBy;
	}

	public void setCstUser(int cstUser) {
		this.cstUser = cstUser;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public void setLastSession(BigDecimal lastSession) {
		this.lastSession = lastSession;
	}

	public void setPassw(String passw) {
		this.passw = passw;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	public void setUpdatedBy(BigDecimal updatedBy) {
		this.updatedBy = updatedBy;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUserStatusDate(Date userStatusDate) {
		this.userStatusDate = userStatusDate;
	}

	public void setUserStatusType(BigDecimal userStatusType) {
		this.userStatusType = userStatusType;
	}

}