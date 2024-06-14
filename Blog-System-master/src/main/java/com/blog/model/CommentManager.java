package com.blog.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.entity.CreateBlog;
import com.blog.entity.comment;
import com.blog.repository.CommentRepo;
import com.blog.repository.CreateBlogRepo;

@Service
public class CommentManager implements CommentService{

	@Autowired
	CreateBlogRepo cbr;
	
	@Autowired
	CommentRepo cr;
	
	@Override
	 public comment AddComment(int id, comment comment) {
        CreateBlog post = cbr.findById(id).orElse(null);
        if (post != null) {
            comment.setBlog(post);
            return cr.save(comment);
        }
        return null;
    }

	@Override
	public List<comment> allcomment(int id) {
		return cr.findByblogId(id);
	}

	@Override
	public List<comment> viewallcommentbyid(int id) {
		List<comment> comments = cr.findByblogId(id);
	    return comments;
	}
	
	@Override
	public comment viewallcomment(int id) {
		Optional<comment> obj = cr.findById(id);
		
		if(obj.isPresent())
		{
			comment blog = obj.get();
			return blog;
		}
		else
		return null;
	}

	/*public int getBlogIdByCommentId(int id) {
        comment comment = cr.findById(id).orElse(null);
        if (comment != null) {
            // Assuming that Comment has a reference to the associated blog
            return comment.getBlog().getId();
        } else {
            return -1; // Handle not found scenario
        }
    }*/
}
