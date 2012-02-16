package com.project.springtest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("timerService")
@Transactional
public class TimerService 
{

	private JdbcTemplate jdbcTemplate;
	
	@Resource("name=dataSource");
	public void setDataSource(DataSource datasource)
	{
		this.jdbcTemplate = new Jdbctemplate(dataSource);
	}
	
}
