package com.blog.entity;

import java.sql.Blob;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="BlogDetails")
public class CreateBlog {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	 int id;
	@Column(name = "title",unique = true)
	 String title;
	@Column(name="author")
	 String author;
	@Column(name="content",length = 10000)
	 String content;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	User uid;
	
	public User getUid() {
		return uid;
	}
	public void setUid(User uid) {
		this.uid = uid;
	}

	@Column(name="image")
	 private Blob image;
	
	@OneToMany(mappedBy = "blog", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	List<comment> comments;

	 
	public List<comment> getComments() {
		return comments;
	}
	public void setComments(List<comment> comments) {
		this.comments = comments;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Blob  getImage() {
		return image;
	}
	public void setImage(Blob image) {
        this.image = image;
    }
	
	@Override
	public String toString() {
	    return "CreateBlog[id=" + id + ", title=" + title + ", author=" + author + ", content=" + content + ", uid=" + uid +"]";
	}

	
}
