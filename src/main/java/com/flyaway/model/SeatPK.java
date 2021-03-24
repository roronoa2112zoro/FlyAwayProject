package com.flyaway.model;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class SeatPK implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int seatNumber;
	
	@ManyToOne
	@JoinColumn(name = "flightId")
	Flights flights;

	public SeatPK() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SeatPK(int seatNumber, Flights flights) {
		super();
		this.seatNumber = seatNumber;
		this.flights = flights;
	}

	public int getSeatNumber() {
		return seatNumber;
	}

	public void setSeatNumber(int seatNumber) {
		this.seatNumber = seatNumber;
	}

	public Flights getFlights() {
		return flights;
	}

	public void setFlights(Flights flights) {
		this.flights = flights;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((flights == null) ? 0 : flights.hashCode());
		result = prime * result + seatNumber;
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
		SeatPK other = (SeatPK) obj;
		if (flights == null) {
			if (other.flights != null)
				return false;
		} else if (!flights.equals(other.flights))
			return false;
		if (seatNumber != other.seatNumber)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "SeatPK [seatNumber=" + seatNumber + ", flights=" + flights + "]";
	}
	
	
}
