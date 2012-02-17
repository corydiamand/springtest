package com.project.springtest;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.springtest.*;

// handles request for the timer page 

@Controller
@RequestMapping(value = "/timer")
public class TimerController {
	
	private static final Logger logger = LoggerFactory.getLogger(TimerController.class);

	@Resource(name="markerService")
	private MarkerService markerService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String timerForm(ModelMap model)
	{
	logger.info("Welcome to the Timer Page!");
	
	return "timer";
	}
	
	@ModelAttribute("marker")
	public Marker setupMarker()
	{
		Marker marker = new Marker();
		return marker;
	}
	
	
	
	@RequestMapping(method = RequestMethod.POST)
	String addMarker(@ModelAttribute("marker") Marker marker)
	{
		MarkerService.addMarker(marker);
		return "timersuccess";
	}
//	@Autowired
//	MarkerService markerService;


}
