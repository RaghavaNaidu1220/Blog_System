package com.blog.model;

import com.blog.entity.User;


public interface UserService {

	public String AddUser(User u);
	public User checklogin(String email,String pass);
	public User viewuserbyid(int id);
	public String updateUser(User u);
	public User getUserByUsername(String username);
    byte[] getUserImageByUsername(String username);
    public String deleteprofileimage(int id);
    public User getUserById(int id);
	
}
