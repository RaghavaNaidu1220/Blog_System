package com.blog.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.entity.Contact;
import com.blog.repository.ContactRepo;


@Service
public class ContactManager  implements ContactService{
	
	@Autowired
	ContactRepo cr;

	@Override
	public String AddContact(Contact c) {
		cr.save(c);
		return "Successfully Added";
	}
}
