package com.blog.entity;

import java.sql.Blob;
import java.sql.SQLException;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_data")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    int id;
    @Column(name = "name")
    String name;
    @Column(name = "username", unique = true)
    String username;
    @Column(name = "contact", unique = true)
    String contactno;
    @Column(name = "email", unique = true)
    String email;
    @Column(name = "password")
    String pass;
    @Lob
    @Column(name = "image", columnDefinition = "LONGBLOB", length = 10485760)
    private Blob image;


    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }

	public void setContactno(String contactno) {
		// TODO Auto-generated method stub
		this.contactno=contactno;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getContactno() {
		return contactno;
	}
	 public String toString() {
	        return "User[id= " + id + ", name= " + name + ", username=" + username + ", contactno=" + contactno + ", email="
	                + email + ", pass=" + pass + "]";
	    }
	
}
