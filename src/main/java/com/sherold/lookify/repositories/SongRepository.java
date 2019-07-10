package com.sherold.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sherold.lookify.models.Song;

@Repository // Sets class as repo
// Sets interface to extend CRUD repo using the Song model with the 'id' type
public interface SongRepository extends CrudRepository<Song, Long>{
	// <----- Methods Overrides ----->
	// Overrides findAll90 to return a list of Songs
	List<Song> findAll();
	
	// Method to find songs based on artist containing a certain substring
	List<Song> findByArtistContaining(String search);
	
	// Method to query top 10 songs, sort by rating
	List<Song> findTop10ByOrderByRatingDesc();
}
