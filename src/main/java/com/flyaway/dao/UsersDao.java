package com.flyaway.dao;

import com.flyaway.model.Users;

public interface UsersDao {
	public void updateUser(Users user);
	public Users getUserById(String userName, String password); 
	

}
