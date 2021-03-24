package com.flyaway.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Features")
public class Features {
	@Id
	private FeaturesPrimaryKey featuresId;
	int price;
	public Features() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FeaturesPrimaryKey getFeaturesId() {
		return featuresId;
	}
	public void setFeaturesId(FeaturesPrimaryKey featuresId) {
		this.featuresId = featuresId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Features [featuresId=" + featuresId + ", price=" + price + "]";
	}
	
	
}
