package com.sherold.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sherold.lookify.models.Song;
import com.sherold.lookify.services.SongService;

@Controller // Assigns class as controller
@RequestMapping("/") // Catch-all route
public class HomeController {
	// <----- Attributes ----->
	// Dependency injection
	private final SongService songService;
	
	// <----- Constructors ----->
	public HomeController(SongService songService) {
		this.songService = songService;
	}
	
	// <----- Methods ----->
	// Routes
	
	// GET routes
	
	// GET route for root path
	@RequestMapping(value="", method=RequestMethod.GET)
	public String index() {
		return "/lookify/index.jsp";
	}
	
	// GET route for dashboard
	@RequestMapping(value="dashboard", method=RequestMethod.GET)
	// Model for data binding to View
	public String dashboard(Model model) {
		// Queries all songs and binds to View model
		List<Song> songs = songService.allSongs();
		model.addAttribute("songs", songs);
		
		return "/lookify/dashboard.jsp";
	}
	
	// GET route for topSongs
	@RequestMapping(value="search/topTen", method=RequestMethod.GET)
	// Model for data binding to View
	public String searchTopTen(Model model) {
		// Queries top ten songs binds to View model
		List<Song> songs = songService.topSongs();
		model.addAttribute("songs", songs);
		
		return "/lookify/topSongs.jsp";
	}
	
	// GET Route for show individual song
	@RequestMapping(value="songs/{id}", method=RequestMethod.GET)
	// PathVariable for query, model for data binding to View
	public String show(@PathVariable("id") Long id, Model model) {
		// Queries the DB for the song and binds to the view model
		Song song = songService.findSong(id);
		model.addAttribute("song", song);
		
		return "/lookify/show.jsp";
	}
	
	// GET route for new song form
	@RequestMapping(value="songs/new", method=RequestMethod.GET)
	// @ModelAttribute binds a blank model to the form
	public String newSong(@ModelAttribute("song") Song song) {
		return "/lookify/new.jsp";
	}
	
	// GET route to search song by artist
	@RequestMapping(value="search", method=RequestMethod.GET)
	// Model for data binding to View
	public String search(Model model, @RequestParam(value="search") String search) {
		// Queries the DB for the searched artist
		List<Song> songs = songService.allSongsByArtist(search);
		model.addAttribute("search", search);
		model.addAttribute("songs", songs);
		
		return "/lookify/searchResults.jsp";
	}
	
	// POST routes 
	
	// POST route to add a new song
	@RequestMapping(value="songs/new", method=RequestMethod.POST)
	// The @Valid annotation checks to see if the submitted object passed validation
	// @BindingResult must come immediately after the @Valid annotation parameter. This tells the application to check for errors!
	public String addNewSong(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		// Event handler for error checking
		if (result.hasErrors()) {
			return "/lookify/new.jsp"; 
		} else {
			songService.createSong(song);
			return "redirect:/dashboard";
		}
	}
	
	// DELETE Route for song by id
	@RequestMapping(value="songs/{id}", method=RequestMethod.DELETE)
	public String destory(@PathVariable("id") Long id) {
		// Queries and deletes song from PathVariable
		songService.deleteSong(id);
		return "redirect:/dashboard";
	}	
}
