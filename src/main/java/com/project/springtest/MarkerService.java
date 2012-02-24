package com.project.springtest;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.project.springtest.Marker;

@Service("markerService")
@Transactional
public class MarkerService 
{

	private static JdbcTemplate jdbcTemplate;
	
	@Resource(name="dataSource")
	public void setDataSource(DataSource dataSource)
	{
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//retrieve markers
	public List<Marker> getAll()
	{
		//Sql
		String sql = "SELECT id,location,lat,lon,totaltime FROM locationdata";
		
		//map result to rows
		RowMapper<Marker> mapper = new RowMapper<Marker>() 
		{
			public Marker mapRow(ResultSet rs, int rowNum) throws SQLException
			{
				Marker marker = new Marker();
				marker.setId(rs.getInt("id"));
				marker.setLocation(rs.getString("location"));
				marker.setLat(rs.getFloat("lat"));
				marker.setLon(rs.getFloat("lon"));
				marker.setTotalTime(rs.getInt("totaltime"));
					return marker;
			}
		}; 
		
			//Retrieve All
			return jdbcTemplate.query(sql, mapper);
	}
	
	
	
	//timer.jsp data interface and method
	
	
	//creates an interface for the timer form data
	public interface dataAccess{
		void addMarker(String location, float lat, float lon, String startTime, String stopTime, int totalTime);
	}
	
	//updates the database with information from the timer

	public static void addMarker(Marker marker) 
	{
		jdbcTemplate.update("INSERT INTO locationdata (location,lat,lon,starttime,stoptime,totaltime) VALUES (?,?,?,?,?,?)",
		new Object[] {marker.getLocation(),marker.getLat(),marker.getLon(),marker.getStartTime(),marker.getStopTime(),marker.getTotalTime()});
	}
	
	
	

}


