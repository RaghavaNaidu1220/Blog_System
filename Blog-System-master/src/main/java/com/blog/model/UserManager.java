package com.blog.model;

import java.sql.SQLException;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;


import com.blog.entity.User;
import com.blog.repository.UserRepo;

import jakarta.transaction.Transactional;

@Service
public class UserManager implements UserService {

	@Autowired
	UserRepo ur;
	
	public String AddUser(User u) {
		 ur.save(u);
		 return "Successfully Register";
	}
	
	public User checklogin(String email,String pass) {
		return ur.checklogin(email, pass);
	}
	
	@Override
	public User viewuserbyid(int id) {
		Optional<User> obj = ur.findById(id);    
		    
	    if(obj.isPresent())
	    {
	    	User emp = obj.get();
		    return emp;
		    }
		    else
		    {
		      return null;
		    }
		    
	}
	
	 @Override
	    public User getUserByUsername(String username) {
	        // Use the repository to find the user by username
	        return ur.findByUsername(username);
	               // .orElseThrow(() -> new UsernameNotFoundException("User not found with username: " + username));
	    }
	
	 
	   @Override
	    public byte[] getUserImageByUsername(String username) {
	        User user = ur.findByUsername(username);

	        if (user != null && user.getImage() != null) {
	            try {
	                return user.getImage().getBytes(1, (int) user.getImage().length());
	            } catch (SQLException e) {
	                e.printStackTrace(); // Handle exception appropriately
	            }
	        }

	        return null;
	    }
	 
	public String updateUser(User u) {
		ur.save(u);
		return "Employee Updated";
	}
	
	
	 public User getUserById(int id) {
	        // Assuming userRepository.findById returns an Optional<User>
	        return ur.getById(id);
	    }
	
	@Override
	@Transactional
	public String deleteprofileimage(int id) {
	    try {
	        ur.deleteImageById(id);
	        return "Profile Image Deleted Successfully";
	    } catch (Exception e) {
	        // Handle exceptions appropriately (e.g., log them)
	        e.printStackTrace();
	        throw new RuntimeException("Failed to delete profile image", e);
	    }
	}



}

