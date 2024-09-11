package com.axsos.project.Repositires;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.axsos.project.models.TableClass;
import com.axsos.project.models.User;


public interface TableRepository extends CrudRepository<TableClass, Long>{
   List<TableClass> findAll();
   
   List<TableClass> findByUser(User user);
}
