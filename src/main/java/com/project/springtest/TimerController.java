package com.project.springtest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.springtest.*;

// handles request for the timer page 

@Controller
public class TimerController {
	
	private static final Logger logger = LoggerFactory.getLogger(TimerController.class);


	@RequestMapping(value = "/timer", method = RequestMethod.GET)
	
	public String timer(ModelMap model)
	{
	logger.info("Welcome to the Timer Page!");
	
	return "timer";
	}
//	
//	 @RequestMapping(method=RequestMethod.GET)
//	 public String processForm(@ModelAttribute(value="MARKER") Marker marker,BindingResult result)
//	 {
//		 return "success";
//	 }
}
