package com.flyaway.model;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class FeaturesPrimaryKey implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public int flightId;
	public String className;
	public FeaturesPrimaryKey(int flightId, String className) {
		super();
		this.flightId = flightId;
		this.className = className;
	}
	public FeaturesPrimaryKey() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getFlightId() {
		return flightId;
	}
	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((className == null) ? 0 : className.hashCode());
		result = prime * result + flightId;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FeaturesPrimaryKey other = (FeaturesPrimaryKey) obj;
		if (className == null) {
			if (other.className != null)
				return false;
		} else if (!className.equals(other.className))
			return false;
		if (flightId != other.flightId)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "FeaturesPrimaryKey [flightId=" + flightId + ", className=" + className + "]";
	}
	
	
	
}