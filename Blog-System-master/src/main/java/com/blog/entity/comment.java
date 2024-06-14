package com.blog.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="comment_table")
public class comment {
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Column(name = "id")
	 int id;

	 @Column(name = "name", length = 50)
	 String name;

	 @Column(name = "comment", length = 500)
	 String comment;

	 @ManyToOne
	 @JoinColumn(name = "blog_id")
	 CreateBlog blog;
	 
	 
	 @Column(name="user_id")
	 Integer uid;


	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
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

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public CreateBlog getBlog() {
		return blog;
	}

	public void setBlog(CreateBlog blog) {
		this.blog = blog;
	}
	
	public String toString(){
		return "comment[id= " + id +  ", name= " + name +",  comment=" + comment + ", blog=" + blog+ ", uid="+ uid+"]";
	}
	

	 
}
