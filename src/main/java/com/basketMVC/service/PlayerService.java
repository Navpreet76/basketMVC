package com.basketMVC.service;

import java.util.List;

import com.basketMVC.model.Player;

public interface PlayerService {
	Player findById(long id);
    
    Player findByName(String name);
     
    void savePlayer(Player player);
     
    void updatePlayer(Player player);
     
    void deletePlayerById(long id);
 
    List<Player> findAllPlayers(); 
     
    void deleteAllPlayers();
     
    public boolean isPlayerExist(Player player);
}
