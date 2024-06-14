package com.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.blog.entity.Admin;

@Repository
public interface AdminRepo extends JpaRepository<Admin, Integer> {
	
	@Query("select a from Admin a where email=?1 and pass=?2")
	public Admin checklogin(String email,String pass);
	
	@Query("select COUNT(u) from User u")
	long countalluser();
	
}
