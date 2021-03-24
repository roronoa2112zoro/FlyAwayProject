package com.flyaway.model;

import java.util.List;


public class BookingDetails {
	
	private int flightId;
	private List<Seats> seats;
	private int totalPrice;
	
	public BookingDetails() {
		super();
	}
	
	public BookingDetails(int flightId, List<Seats> seats, int totalPrice) {
		super();
		this.flightId = flightId;
		this.seats = seats;
		this.totalPrice = totalPrice;
	}
	
	public int getFlightId() {
		return flightId;
	}
	
	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}
	
	public List<Seats> getSeats() {
		return seats;
	}
	
	public void setSeats(List<Seats> seats) {
		this.seats = seats;
	}
	
	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "BookingDetails [flightId=" + flightId + ", seats=" + seats + ", totalPrice=" + totalPrice + "]";
	}
	
}
	
	