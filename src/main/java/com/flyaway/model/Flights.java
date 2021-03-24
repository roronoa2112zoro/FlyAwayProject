package com.flyaway.model;


import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity  
@Table(name="flights")
public class Flights{
	@Id   
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	private int flightId;
	private String flightName;
	private String departure;
	private String arrival;
	private LocalDate departureDate;
	private LocalDate arrivalDate;
	private int totalSeats;
	private int availableSeats;
	private int economy;
	private int business;
	private int first;
	
	@OneToMany(mappedBy = "seatPk.flights")
	private List<Seats> seats;
	
	public Flights() {
		super();
	}

	public Flights(int flightId, String flightName, String departure, String arrival, LocalDate departureDate,
			LocalDate arrivalDate, int totalSeats, int availableSeats, int economy, int business, int first, List<Seats> seats) {
		super();
		this.flightId = flightId;
		this.flightName = flightName;
		this.departure = departure;
		this.arrival = arrival;
		this.departureDate = departureDate;
		this.arrivalDate = arrivalDate;
		this.totalSeats = totalSeats;
		this.availableSeats = availableSeats;
		this.economy = economy;
		this.business = business;
		this.first = first;
		this.seats = seats;
	}

	public boolean isEmpty()
	{
		return (totalSeats==availableSeats);
	}

	public int getFlightId() {
		return flightId;
	}

	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}

	public String getFlightName() {
		return flightName;
	}

	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}

	public int getTotalSeats() {
		return totalSeats;
	}

	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}

	public int getAvailableSeats() {
		return availableSeats;
	}

	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}

	public String getDeparture() {
		return departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public String getArrival() {
		return arrival;
	}

	public void setArrival(String arrival) {
		this.arrival = arrival;
	}

	public LocalDate getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(LocalDate departureDate) {
		this.departureDate = departureDate;
	}

	public LocalDate getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(LocalDate arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public int getEconomy() {
		return economy;
	}

	public void setEconomy(int economy) {
		this.economy = economy;
	}

	public int getBusiness() {
		return business;
	}

	public void setBusiness(int business) {
		this.business = business;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}
	
	public List<Seats> getSeats() {
		return seats;
	}

	public void setSeats(List<Seats> seats) {
		this.seats = seats;
	}

	@Override
	public String toString() {
		return "Flights [flightId=" + flightId + ", flightName=" + flightName + ", departure=" + departure
				+ ", arrival=" + arrival + ", departureDate=" + departureDate + ", arrivalDate=" + arrivalDate
				+ ", totalSeats=" + totalSeats + ", availableSeats=" + availableSeats + ", economy=" + economy
				+ ", business=" + business + ", first=" + first + "]";
	}	
	
}
