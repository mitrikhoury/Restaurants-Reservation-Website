package com.axsos.project.Services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.axsos.project.Repositires.TableRepository;
import com.axsos.project.models.TableClass;
import com.axsos.project.models.User;

@Service
public class TableService {

	private final TableRepository tableRepository;

	public TableService(TableRepository tableRepository) {
		super();
		this.tableRepository = tableRepository;
	}

	public List<TableClass> findAllTables() {
		return tableRepository.findAll();
	}

	public TableClass createTable(TableClass table) {
		return tableRepository.save(table);

	}

	public TableClass findTable(Long id) {
		Optional<TableClass> opTable = tableRepository.findById(id);
		if (opTable.isPresent()) {
			return opTable.get();
		}
		return null;
	}

	public void deleteById(Long id) {
		tableRepository.deleteById(id);
	}

	public void deleteTable(TableClass table) {
		tableRepository.delete(table);
	}

	public List<TableClass> findTablesByUser(User user) {
		return tableRepository.findByUser(user);
	}

	public List<TableClass> tablesMoc(User user) {
		List<TableClass> tables = new ArrayList<>();

		tables.add(new TableClass((long) 1, "John Doe", 4, "Birthday party", new Date(), user));
		tables.add(new TableClass((long) 2, "Jane Smith", 2, "Anniversary dinner", new Date(), user));
		tables.add(new TableClass((long) 3, "Alice Johnson", 3, "Business meeting", new Date(), user));
		return tables;
	}

	public TableClass updateTable(TableClass table) {
		return tableRepository.save(table);
	}
	
	  public List<TableClass> getTablesWithoutUserId() {
	        return tableRepository.findTablesWithoutUserId();
	    }
	  
	  public List<TableClass> getTablesWithUserId() {
	        return tableRepository.findTablesWithUserId();
	    }
	  
	  public void giveUpTable(Long id) {
	        // Find the table by its ID
	        TableClass table = tableRepository.findById(id).orElse(null);
	        
	        if (table != null) {
	            // Set the user field to null
	            table.setUser(null);
	            // Save the updated table back to the database
	            tableRepository.save(table);
	        }
	    }
	  
	  public void pickUpTable(Long table_id , User user) {
		  TableClass table = tableRepository.findById(table_id).orElse(null);
		  
		  if(table != null) {
			  
			  table.setUser(user);
			  
			  tableRepository.save(table);
		  }
	  }

}
