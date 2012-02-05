package com.project.springtest;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.project.springtest.Marker;

@Service("markerService")
@Transactional
public class MarkerService 
{

	private JdbcTemplate jdbcTemplate;
	
	@Resource(name="dataSource")
	public void setDataSource(DataSource dataSource)
	{
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//retrieve markers
	public List<Marker> getAll()
	{
		//Sql
		String sql = "SELECT id,lat,lon FROM locationdata";
		
		//map result to rows
		RowMapper<Marker> mapper = new RowMapper<Marker>() 
		{
			public Marker mapRow(ResultSet rs, int rowNum) throws SQLException
			{
				Marker marker = new Marker();
				marker.setId(rs.getInt("id"));
				marker.setLat(rs.getFloat("lat"));
				marker.setLon(rs.getFloat("lon"));
					return marker;
			}
		};
		
			//Retrieve All
			return jdbcTemplate.query(sql, mapper);
	}

}


