package com.flyaway.model;

import java.io.Serializable;

import javax.persistence.Embeddable;
@Embeddable
public class BookingDetailsPK implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int flightId;
	private int seatNumber;
	private int subTotal;
	
	public BookingDetailsPK() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookingDetailsPK(int flightId, int seatNumber, int subTotal) {
		super();
		this.flightId = flightId;
		this.seatNumber = seatNumber;
		this.subTotal = subTotal;
	}
	public int getFlightId() {
		return flightId;
	}
	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}
	
	public int getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(int seatNumber) {
		this.seatNumber = seatNumber;
	}
	public int getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(int subTotal) {
		this.subTotal = subTotal;
	}
	@Override
	public String toString() {
		return "BookingDetailsPK [flightId=" + flightId + ", seatNumber=" + seatNumber + ", subTotal=" + subTotal + "]";
	}
	
	
}
