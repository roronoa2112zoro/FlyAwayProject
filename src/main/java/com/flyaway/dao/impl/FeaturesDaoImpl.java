package com.flyaway.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.flyaway.dao.FeaturesDao;
import com.flyaway.hibernate.HibernateUtil;
import com.flyaway.model.Features;


@SuppressWarnings("deprecation")
public class FeaturesDaoImpl implements FeaturesDao {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Features> getFeaturesForFlight(String flightId, String className) {
		System.out.println(flightId + className);
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Features> results = new ArrayList<Features>();
		System.out.println(Integer.parseInt(flightId));
		try{
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM Features where flightId= :flightId and className= :className");
			query.setInteger("flightId", Integer.parseInt(flightId));
			query.setString("className", className);
			results = query.list();
			System.out.println(results);
			transaction.commit();
		}
		catch(Exception e) {
			
		}
		return results;
	}

	@SuppressWarnings("unchecked")
	public List<Features> getAllFeatures() {
		List<Features> features = new ArrayList<Features>();
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try{
			transaction = session.beginTransaction();
			
			features = session.createQuery("FROM Features").list();
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
		
	return features;
		
	}
}
