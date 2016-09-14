package facebook.dao;
// Generated 26 Aug, 2016 10:28:34 AM by Hibernate Tools 5.1.0.Beta1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * HibernateSequence generated by hbm2java
 */
@Entity
@Table(name = "hibernate_sequence", catalog = "post")
public class HibernateSequence implements java.io.Serializable {

	private Long nextVal;

	public HibernateSequence() {
	}

	public HibernateSequence(Long nextVal) {
		this.nextVal = nextVal;
	}

	@Id

	@Column(name = "next_val")
	public Long getNextVal() {
		return this.nextVal;
	}

	public void setNextVal(Long nextVal) {
		this.nextVal = nextVal;
	}

}