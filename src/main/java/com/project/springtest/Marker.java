package com.project.springtest;

public class Marker {
	
	private int id;
	private String location;
	private float lat;
	private float lon;
	private String startTime;
	private String stopTime;
	private int totalTime;
	
	public int getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id=id;
	}
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	public float getLat()
	{
		return lat;
	}
	
	public void setLat(float lat)
	{
		this.lat=lat;
	}
	
	public float getLon()
	{
		return lon;
	}
	
	public void setLon(float lon)
	{
		this.lon=lon;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getStopTime() {
		return stopTime;
	}

	public void setStopTime(String stopTime) {
		this.stopTime = stopTime;
	}

	public int getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}
	
	
}
