package com.axsos.project.Repositires;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.axsos.project.models.TableClass;
import com.axsos.project.models.User;


public interface TableRepository extends CrudRepository<TableClass, Long>{
   List<TableClass> findAll();
   
   List<TableClass> findByUser(User user);
   
   @Query("SELECT t FROM TableClass t WHERE t.user IS NULL")
   List<TableClass> findTablesWithoutUserId();
   
   @Query("SELECT t FROM TableClass t WHERE t.user IS NOT NULL")
   List<TableClass> findTablesWithUserId();
}
