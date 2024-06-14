package com.blog.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
//import java.util.Optional;
import com.blog.entity.User;

@Repository
public interface UserRepo extends JpaRepository<User, Integer> {

    @Query("select u from User u where email=?1 and pass=?2")
    public User checklogin(String email, String pass);

    User findByUsername(String username);

   /* Optional<User> findByIdAndImage(int id, byte[] image);

    Optional<User> deleteByIdAndImage(int id, byte[] image);*/
    @Modifying
    @Query("update User u set u.image = null where u.id = ?1")
    void deleteImageById(int id);

	public User getById(int id);
}
