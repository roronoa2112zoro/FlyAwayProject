package com.flyaway.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.flyaway.dao.UsersDao;
import com.flyaway.hibernate.HibernateUtil;
import com.flyaway.model.Users;

public class UsersDaoImpl implements UsersDao {
	
	public void updateUser(Users user) {
		Transaction transaction = null;
		
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			session.update(user);
			transaction.commit();
		}
		
		catch(Exception e) {
			if(transaction != null)
				transaction.rollback();
			e.getStackTrace();
		}
	}
	public Users getUserById(String userName, String password) {
		Transaction transaction = null;
		Users user = new Users();
		Session session = HibernateUtil.getSessionFactory().openSession();
		try{
			transaction = session.beginTransaction();
			
			
					Query query = session.createQuery("FROM Users where email= :email and password= :password");
					query.setParameter("email", userName);
					query.setParameter("password", password);
					user = (Users) query.uniqueResult();
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
		return user;
	}
}
