package com.basketMVC.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Service;

import com.basketMVC.model.Player;


@Service("playerService")
public class PlayerServiceImpl  implements PlayerService {
	
	private static final AtomicLong count = new AtomicLong();
	private static List <Player> players;
	
	static {
		players = populatePlayers();
	}
	public List <Player> findAllPlayers() {
		return players;
	}

	public Player findById(long id) {
		for(Player player: players) {
			if(player.getId() == id) {
				return player;
			}
		}
		return null;
	}

	public Player findByName(String name) {
		for(Player player : players){
            if(player.getName().equalsIgnoreCase(name)){
                return player;
            }
        }
        return null;
	}

	public void savePlayer(Player player) {
		player.setId(count.incrementAndGet());
        players.add(player);
		
	}

	public void updatePlayer(Player player) {
		int index = players.indexOf(player);
		players.set(index, player);
		
	}

	public void deletePlayerById(long id) {
		 for (Iterator<Player> iterator = players.iterator(); iterator.hasNext(); ) {
	            Player player = iterator.next();
	            if (player.getId() == id) {
	                iterator.remove();
	            }
	        }
	}
	
	public boolean isPlayerExist(Player player) {
		return findByName(player.getName()) != null;
	}
	private static List<Player> populatePlayers() {
		List <Player> players = new ArrayList<Player>();
		players.add(new Player(count.incrementAndGet(), "Michael Jordan", "Shooting Guard", "GOAT", 30.0));
		players.add(new Player(count.incrementAndGet(), "Vince Carter", "Shooting Guard", "Pretty good", 24.0));
		return players;
	}

	public void deleteAllPlayers() {
		// TODO Auto-generated method stub
		
	}

}
