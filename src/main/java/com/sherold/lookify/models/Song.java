package com.sherold.lookify.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity // Annotation to designate class as a DB Entity
@Table(name="songs") // Annotation to set the table for the Entity object
public class Song {
	// <----- Attributes ----->
	@Id // Designates field as ID
	@GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-incriments
	private Long id;
	@Size(min = 5, message="Length of title must be longer than 5 characters") // min char size is 5
	private String title;
	@Size(min = 5, message="Length of artist must be longer than 5 characters") // min char size is 5
	private String artist;
	@Min(1) // rating must between 1-10
	@Max(10)
	private Integer rating;
	@Column(updatable=false) // DB column immutable after creation
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	// <----- Constructors ----->
	public Song() {
		
	}
	
	public Song(String title, String artist, int rating) {
		this.title = title;
		this.artist = artist;
		this.rating = rating;
	}
	
	// <----- Getters/Setters ----->
	// id
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	// title
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	// artist
	public String getArtist() {
		return artist;
	}
	
	public void setArtist(String artist) {
		this.artist = artist;
	}
	
	// rating
	public Integer getRating() {
		return rating;
	}
	
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	
	// createdAt
	public Date getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	// updatedAt
	public Date getUpdatedAt() {
		return updatedAt;
	}
	
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	// <----- Methods ----->
	@PrePersist // Annotation designates creation prior to instantiation
	protected void onCreate() {
		this.createdAt = new Date();
	}
	
	@PreUpdate // Annotation designates creation prior to update
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
}
