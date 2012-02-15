package com.project.springtest;

public class Marker {
	
	private int id;
	private float lat;
	private float lon;
	private int startTime;
	private int stopTime;
	private int totalTime;
	
	public int getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id=id;
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

	public int getStartTime() {
		return startTime;
	}

	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}

	public int getStopTime() {
		return stopTime;
	}

	public void setStopTime(int stopTime) {
		this.stopTime = stopTime;
	}

	public int getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}
	
	
}
