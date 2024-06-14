package com.blog.model;

import java.util.List;

import com.blog.entity.CreateBlog;
import com.blog.entity.comment;

import jakarta.servlet.http.HttpServletRequest;

public interface CreateBlogService {

	public String Addblog(CreateBlog cb);
	public List<CreateBlog> viewAllBlog();
	public CreateBlog viewallblogsbyid(int id);
	void addCommentToPost(int Id, comment comment);
	public String updateblog(CreateBlog cb);
	public CreateBlog getBlogWithComments(int id);
	public List<CreateBlog> viewallblogbyuidSortedByUid(int uid);
	public List<CreateBlog> viewallblogbyauthor(String author);
	public String deleteuserpost(int id);
}
