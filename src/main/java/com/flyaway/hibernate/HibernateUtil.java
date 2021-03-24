package com.flyaway.hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil{
	private static final SessionFactory sessionFactory;
	
	static {
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch(Exception ex) {
			System.out.println("Session Factory could not be created" + ex.getMessage());
			throw new ExceptionInInitializerError();
		}
		
	}

	public static SessionFactory getSessionFactory() {
		// TODO Auto-generated method stub
		return sessionFactory;
	}
}