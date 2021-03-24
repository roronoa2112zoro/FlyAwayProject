package com.flyaway.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.flyaway.dao.SeatDao;
import com.flyaway.hibernate.HibernateUtil;
import com.flyaway.model.Seats;

@SuppressWarnings("deprecation")
public class SeatDaoImpl implements SeatDao{
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Seats> getSeats(int flightId, String className){
		List<Seats> results = new ArrayList<Seats>();
		
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try{
			
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM Seats where flightId= :flightId and className= :className ");
			query.setInteger("flightId", flightId);
			query.setString("className", className);
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

	public void updateSeats(Seats seat) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try{	
			transaction = session.beginTransaction();
			
			session.saveOrUpdate(seat);
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
}
