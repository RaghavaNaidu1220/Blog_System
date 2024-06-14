package com.blog.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.blog.entity.CreateBlog;

@Repository
public interface CreateBlogRepo extends JpaRepository<CreateBlog, Integer> {
	List<CreateBlog> findByUidIdOrderByUidId(int uid);
	
	List<CreateBlog> findByAuthorOrderByAuthor(String author);

}
