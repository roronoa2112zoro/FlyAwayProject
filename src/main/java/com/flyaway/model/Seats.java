package com.flyaway.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "seats")
public class Seats{
	@Id
	private SeatPK seatPk;
	private String className;
	
	
	public Seats() {
		super();
	}

	public Seats(SeatPK seatPk, String className) {
		super();
		this.seatPk = seatPk;
		this.className = className;
		
	}

	public SeatPK getSeatPk() {
		return seatPk;
	}

	public void setSeatPk(SeatPK seatPk) {
		this.seatPk = seatPk;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	

	@Override
	public String toString() {
		return "Seat [seatPk=" + seatPk + ", className=" + className  + "]";
	}

}
