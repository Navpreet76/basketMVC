package com.basketMVC.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.basketMVC.model.Player;
import com.basketMVC.service.PlayerService;

@RestController
public class PlayerRestController {

		@Autowired
		PlayerService playerService; //main service for data retrieval
		
		 //-------------------Retrieve All Players--------------------------------------------------------
	     
	    @RequestMapping(value = "/player/", method = RequestMethod.GET)
	    public ResponseEntity<List<Player>> listAllPlayers() {
	        List<Player> players = playerService.findAllPlayers();
	        if(players.isEmpty()){
	            return new ResponseEntity<List<Player>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
	        }
	        return new ResponseEntity<List<Player>>(players, HttpStatus.OK);
	    }
	    
	  //-------------------Retrieve Single Player--------------------------------------------------------
	     
	    @RequestMapping(value = "/player/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	    public ResponseEntity<Player> getPlayer(@PathVariable("id") long id) {
	        System.out.println("Fetching User with id " + id);
	        Player player = playerService.findById(id);
	        if (player == null) {
	            System.out.println("Player with id " + id + " not found");
	            return new ResponseEntity<Player>(HttpStatus.NOT_FOUND);
	        }
	        return new ResponseEntity<Player>(player, HttpStatus.OK);
	    }
	    
	    //-------------------Create a Player--------------------------------------------------------
	     
	    @RequestMapping(value = "/player/", method = RequestMethod.POST)
	    public ResponseEntity<Void> createPlayer(@RequestBody Player player,    UriComponentsBuilder ucBuilder) {
	        System.out.println("Creating Player " + player.getName());
	 
	        if (playerService.isPlayerExist(player)) {
	            System.out.println("A Player with name " + player.getName() + " already exist");
	            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	        }
	 
	        playerService.savePlayer(player);
	 
	        HttpHeaders headers = new HttpHeaders();
	        headers.setLocation(ucBuilder.path("/player/{id}").buildAndExpand(player.getId()).toUri());
	        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	    }
	    
	    //------------------- Update a Player --------------------------------------------------------
	     
	    @RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
	    public ResponseEntity<Player> updatePlayer(@PathVariable("id") long id, @RequestBody Player player) {
	        System.out.println("Updating Player" + id);
	         
	        Player currentPlayer = playerService.findById(id);
	         
	        if (currentPlayer==null) {
	            System.out.println("Player with id " + id + " not found");
	            return new ResponseEntity<Player>(HttpStatus.NOT_FOUND);
	        }
	 
	        currentPlayer.setName(player.getName());
	        currentPlayer.setPosition(player.getPosition());
	        currentPlayer.setDescription(player.getDescription());
	        currentPlayer.setPpg(player.getPpg());
	        playerService.updatePlayer(currentPlayer);
	        return new ResponseEntity<Player>(currentPlayer, HttpStatus.OK);
	    }
	    
	  //------------------- Delete a Player --------------------------------------------------------
	     
	    @RequestMapping(value = "/player/{id}", method = RequestMethod.DELETE)
	    public ResponseEntity<Player> deletePlayer(@PathVariable("id") long id) {
	        System.out.println("Fetching & Deleting Player with id " + id);
	 
	        Player player = playerService.findById(id);
	        if (player == null) {
	            System.out.println("Unable to delete. Player with id " + id + " not found");
	            return new ResponseEntity<Player>(HttpStatus.NOT_FOUND);
	        }
	 
	        playerService.deletePlayerById(id);
	        return new ResponseEntity<Player>(HttpStatus.NO_CONTENT);
	    }
	    
	  //------------------- Delete All Players --------------------------------------------------------
	     
	    @RequestMapping(value = "/player/", method = RequestMethod.DELETE)
	    public ResponseEntity<Player> deleteAllPlayers() {
	        System.out.println("Deleting All Players..........................");
	 
	        playerService.deleteAllPlayers();
	        return new ResponseEntity<Player>(HttpStatus.NO_CONTENT);
	    }
	 
	 
}
