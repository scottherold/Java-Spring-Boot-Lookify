package com.sherold.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.sherold.lookify.models.Song;
import com.sherold.lookify.repositories.SongRepository;

@Service // Designates class as a service
public class SongService {
	// <----- Attributes ----->
	// Dependency Injection
	private final SongRepository songRepo;
	
	// <----- Constructors ----->
	public SongService(SongRepository songRepo) {
		this.songRepo = songRepo;
	}
	
	// <----- Methods ----->
	// Query methods to be used within controller
	// SELECT * songs
	public List<Song> allSongs() {
		return songRepo.findAll();
	}
	
	// SELECT * FROM songs WHERE artist %=
	public List<Song> allSongsByArtist(String artist) {
		return songRepo.findByArtistContaining(artist);
		
	}
	
	// SELECT * FROM songs SORTBY rating DESC LIMIT 10
	public List<Song> topSongs() {
		return songRepo.findTop10ByOrderByRatingDesc();
	}
	
	// SELECT * FROM songs WHERE id =
	public Song findSong(Long id) {
		// Check to see if object is present, if not return null
		Optional<Song> optionalSong = songRepo.findById(id);
		if (optionalSong.isPresent()) {
			return optionalSong.get();
		} else {
			return null;
		}
	}
	
	// ADD
	public Song createSong(Song song) {
		return songRepo.save(song);
	}
	
	// DELETE * FROM songs WHERE id =
	public void deleteSong(Long id) {
		// Check to see if object is present, if not return null
		Optional<Song> optionalSong = songRepo.findById(id);
		if (optionalSong.isPresent()) {
			songRepo.deleteById(id);
		}
	}
}
