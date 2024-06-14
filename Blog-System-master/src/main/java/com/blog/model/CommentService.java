package com.blog.model;

import java.util.List;


import com.blog.entity.comment;

public interface CommentService {
	
	public comment AddComment(int id,comment comment);
	public List<comment> allcomment(int id); 
	public comment viewallcomment(int id);
	//public comment viewallcommentbyid(int id);
	public List<comment> viewallcommentbyid(int id);
	//public int getBlogIdByCommentId(int id);
}
