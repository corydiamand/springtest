package com.project.springtest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// handles request for the timer page 

@Controller
public class TimerController {
	
	private static final Logger logger = LoggerFactory.getLogger(TimerController.class);


	@RequestMapping(value = "/timer", method = RequestMethod.GET)
	
	public String timer()
	{
	logger.info("Welcome to the Timer Page! ");
	
	
	
	
	

	return "timer";
	}
}
