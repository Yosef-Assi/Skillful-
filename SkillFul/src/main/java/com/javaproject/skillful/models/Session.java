package com.javaproject.skillful.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "sessions")
public class Session {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message = "Start time is neccessery")
	@DateTimeFormat(pattern = "dd.MM.yyyy HH:mm")
	private Date startDate;
	@NotEmpty(message = "End time is neccessery")
	@DateTimeFormat(pattern = "dd.MM.yyyy HH:mm")
	private Date endDate;
	
	private Location location;
	
	private Boolean online;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tutor_id")
	private Tutor tutor;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	
    
    //constructors
    public Session() {
    	
	}
	public Session(Date startDate, Date endDate, Location location, Boolean online, User user) {
		this.startDate = startDate;
		this.endDate = endDate;
		this.location = location;
		this.online = online;
		this.user = user;
	}
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
	public Location getLocation() {
		return location;
	}
	public void setLocation(Location location) {
		this.location = location;
	}
	
	
	public Boolean getOnline() {
		return online;
	}
	public void setOnline(Boolean online) {
		this.online = online;
	}
	
	
	public Date getCreatedAt() {
		return createdAt;
	}

	
	public Date getUpdatedAt() {
		return updatedAt;
	}
    
    
	
	  
}
