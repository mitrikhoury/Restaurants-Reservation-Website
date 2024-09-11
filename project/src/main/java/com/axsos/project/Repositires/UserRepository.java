package com.axsos.project.Repositires;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.axsos.project.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
   User findByUserName(String userName);
 
    List<User> findAll();
    User findByEmail(String email);
}
