package com.basketMVC.model;


public class Player {

	private long id;
	private String name;
	private String position;
	private String description;
	private double ppg;
	
	public Player() {
		id=0;
	}

	public Player(long id, String name, String position, String description, double ppg) {
		super();
		this.id = id;
		this.name = name;
		this.position = position;
		this.description = description;
		this.ppg = ppg;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPpg() {
		return ppg;
	}

	public void setPpg(double ppg) {
		this.ppg = ppg;
	}
	 @Override
	    public int hashCode() {
	        final int prime = 31;
	        int result = 1;
	        result = prime * result + (int) (id ^ (id >>> 32));
	        return result;
	    }
	 
	    @Override
	    public boolean equals(Object obj) {
	        if (this == obj)
	            return true;
	        if (obj == null)
	            return false;
	        if (getClass() != obj.getClass())
	            return false;
	        Player other = (Player) obj;
	        if (id != other.id)
	            return false;
	        return true;
	    }

		@Override
		public String toString() {
			return "Player [id=" + id + ", name=" + name + ", position=" + position + ", description=" + description
					+ ", ppg=" + ppg + "]";
		}
	    
}
