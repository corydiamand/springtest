<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Timer</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" type ="text/css"/>

<!-- javascript here -->

<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
<script type="text/javascript">

$(document).ready(function()
{		
	function getPos(position)
	{
		//put geolocation coordinates into location input in form
		$("input[name=location]").val(position.coords.latitude + ' ' + position.coords.longitude);
	}
			
			
	if (navigator.geolocation)
	{
	 	navigator.geolocation.getCurrentPosition(
				
	 		getPos,undefined,
			
			{
				enableHighAccuracy: true
			}
			
		);
	
	}
	
	//props to chris hope at www.electrictoolbox.com for this script to convert javascript's date()	into a database friendly format
	function pad(number, length) 
	{
	   
    var str = '' + number;
    while (str.length < length) {
        str = '0' + str;
    }
   
    return str;
	}

	
	function dateToDatabase(dt)
	{
		return dt.getFullYear() + '-' + pad(dt.getMonth()+1, 2) + '-' + pad(dt.getDate(), 2) + ' ' + pad(dt.getHours(), 2) + ':' + pad(dt.getMinutes(), 2) + ':' + pad(dt.getSeconds(), 2);
	}
	
	
	var timeAtStart;
	var timeAtStop;
	$("div#start-stop-button").toggle
	(
		function()
		{
			timeAtStart=new Date();
			$("input[name=start-time]").val(dateToDatabase(timeAtStart));
			$("div#start-stop-button p").html("Stop");	
		},	
	
		function()
		{
			timeAtStop=new Date();
			total = (timeAtStop-timeAtStart);
			$("input[name=stop-time]").val(dateToDatabase(timeAtStop));
			$("input[name=total-time]").val(total);
			$("div#start-stop-button p").html("Reset");	
		},
		
		function()
		{
			$("div#start-stop-button p").html("Start");
		}
	);
	

	
});
</script>	

<script type=text/javascript>

</script>

</head>
<body>
 <tags:header/> 

<p>Hello Timer</p>
<div id="timer-container">
<div id="start-stop-button"><button><p>Start</p></button></div><!-- start-stop-button -->
<form id="timer-form">
<form:form method="Post">
<div id="timer-data">
<div id="location">Location: <input type="text" name="location" value="calculating your location!" /></div><!-- location -->
<div id="start-time">Start Time: <input type="text" name="start-time" /></div><!-- start-time -->
<div id="stop-time">Stop Time: <input type="text" name="stop-time" /></div><!-- stop-time -->
<div id="total-time">Total Time Spent (in milliseconds): <input type="text" name="total-time" /></div><!-- total-time -->
</div><!-- timer-data -->
<div id="timer-submit-button"><input class=timerSubmit type="submit" value= "Submit"/></div>
</form:form>
</form><!-- timer-form -->
</div><!-- timer-container -->

</body>
</html>