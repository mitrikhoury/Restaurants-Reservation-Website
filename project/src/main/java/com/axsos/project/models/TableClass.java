package com.axsos.project.models;

import java.util.Date;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name = "tables")
public class TableClass {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long tableId;

    @NotEmpty(message = "Guest name is required!")
    private String nameGuest;

    private int numberOfGuests;
    private String notes;

    @Column(updatable = false)
    private Date createdAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

	public TableClass() {
		super();
	}

	
	public TableClass(Long tableId, @NotEmpty(message = "Guest name is required!") String nameGuest, int numberOfGuests,
			String notes, Date createdAt, User user) {
		super();
		this.tableId = tableId;
		this.nameGuest = nameGuest;
		this.numberOfGuests = numberOfGuests;
		this.notes = notes;
		this.createdAt = createdAt;
		this.user = user;
	}

	public Long getTableId() {
		return tableId;
	}

	public void setTableId(Long tableId) {
		this.tableId = tableId;
	}

	public String getNameGuest() {
		return nameGuest;
	}

	public void setNameGuest(String nameGuest) {
		this.nameGuest = nameGuest;
	}

	public int getNumberOfGuests() {
		return numberOfGuests;
	}

	public void setNumberOfGuests(int numberOfGuests) {
		this.numberOfGuests = numberOfGuests;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

    
  
}
