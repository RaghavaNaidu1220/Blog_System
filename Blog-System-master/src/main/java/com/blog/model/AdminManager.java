package com.blog.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.entity.Admin;
import com.blog.entity.Contact;
import com.blog.entity.CreateBlog;
import com.blog.entity.User;
import com.blog.entity.comment;
import com.blog.repository.AdminRepo;
import com.blog.repository.CommentRepo;
import com.blog.repository.ContactRepo;
import com.blog.repository.CreateBlogRepo;
import com.blog.repository.UserRepo;

@Service
public class AdminManager implements AdminService{

	@Autowired
	AdminRepo ar;
	
	@Autowired
	UserRepo ur;
	
	@Autowired
	CreateBlogRepo cbr;
	
	@Autowired
	CommentRepo cr;
	
	@Autowired
	ContactRepo cor;
	
	@Override
	public Admin checkadminlogin(String email, String pass) {
		return ar.checklogin(email, pass);
	}
	
	@Override
	public List<User> viewalluser() {
		return ur.findAll();
	}
	
	@Override
	public User viewallbyid(int id) {
		Optional<User> obj = ur.findById(id);
		
		if(obj.isPresent())
		{
			User emp = obj.get();
			return emp;
		}
		else
		return null;
	}

	@Override
	public List<CreateBlog> viewallblogs() {
		return cbr.findAll();
	}

	@Override
	public CreateBlog viewallbyblogid(int id) {
		Optional<CreateBlog> obj = cbr.findById(id);
		
		if(obj.isPresent())
		{
			CreateBlog blog = obj.get();
			return blog;
		}
		else
		return null;
	}
	
	
	@Override
	public comment viewallcommentbyid(int id) {
		Optional<comment> obj = cr.findById(id);
		
		if(obj.isPresent())
		{
			comment blog = obj.get();
			return blog;
		}
		else
		return null;
	}
	
	@Override 
	public List<comment> viewallcommentwithid(int id){
		return cr.findByblogId(id);
	}
	
	@Override
	public List<comment> ViewallComments() {
		return cr.findAll();
	}
	
	@Override
	public List<Contact> viewallmsg() {
		return cor.findAll();
	}

	@Override
	public String deleteuser(int id) {
		Optional<User> obj = ur.findById(id);
        String msg = null;

        if (obj.isPresent()) {
            User user = obj.get();
            ur.delete(user);
            msg = "Blogger Deleted Successfully";
        } else {
            msg = "Blogger Not Found";
        }

        return msg;
	}

	@Override
	public String deletepost(int id) {
		 Optional<CreateBlog> obj = cbr.findById(id);
	        String msg = null;

	        if (obj.isPresent()) {
	            CreateBlog blog = obj.get();
	            cbr.delete(blog);
	            msg = "Post Deleted Successfully";
	        } else {
	            msg = "Post Not Found";
	        }

	        return msg;
	}

	

	@Override
	public String deletecomment(int id) {
		Optional<comment> obj = cr.findById(id);
        String msg = null;

        if (obj.isPresent()) {
            comment blog = obj.get();
            cr.delete(blog);
            msg = "Post Deleted Successfully";
        } else {
            msg = "Post Not Found";
        }

        return msg;
	}

	@Override
	public String deletecommentadmin(int id) {
		Optional<comment> obj = cr.findById(id);
        String msg = null;

        if (obj.isPresent()) {
            comment blog = obj.get();
            cr.delete(blog);
            msg = "Post Deleted Successfully";
        } else {
            msg = "Post Not Found";
        }

        return msg;
	}

	@Override
	public long  countuser() {
		long count= ar.countalluser();
		System.out.println(count);
		return count;
	}

	

	
	
	
}
