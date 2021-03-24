package com.flyaway.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.flyaway.dao.FlightDao;
import com.flyaway.hibernate.HibernateUtil;
import com.flyaway.model.Flights;

@SuppressWarnings("deprecation")
public class FlightDaoImpl implements FlightDao{

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Flights> getFlights(String departure, String arrival) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Flights> results = new ArrayList<Flights>();
		try{
			
			transaction = session.beginTransaction();
			System.out.println(departure + arrival);
			Query query = session.createQuery("FROM Flights where Departure= :departure and Arrival= :arrival");
			query.setString("departure", departure);
			query.setString("arrival", arrival);
			results = query.list();
			transaction.commit();
		}
		catch(Exception e) {
			if(transaction != null)
				transaction.rollback();
			System.out.println(e.getMessage());
		}
		finally {
			session.close();
		}
		return results;
	}

	public void updateSeatCount(Flights flight,int seatCount) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();

		try{
			transaction = session.beginTransaction();
			flight.setAvailableSeats(flight.getAvailableSeats()-seatCount);
			session.saveOrUpdate(flight);
			transaction.commit();
		}
		catch(Exception e) {
			if(transaction != null)
				transaction.rollback();
			System.out.println(e.getMessage());
		}
		finally {
			session.close();
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Flights> getAllFlights() {
		List<Flights> flightList = new ArrayList<Flights>();
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try{
			transaction = session.beginTransaction();
			
			flightList = session.createQuery("FROM Flights").list();
			transaction.commit();
		}
		catch(Exception e) {
			if(transaction != null)
				transaction.rollback();
			System.out.println(e.getMessage());
		}
		finally {
			session.close();
		}
		
	return flightList;
		
	}
	
}
