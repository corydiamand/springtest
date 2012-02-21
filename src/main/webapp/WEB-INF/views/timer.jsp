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
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=true"></script>
<script type="text/javascript">

$(document).ready(function()
{		
	//declaring coordinate variables so I can grab them later
	
	
	function getPos(position)
	{
		//populate location field in form with potential locations. Populate lat and lon fields with ...lat and lon..
		currentLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
	 var request = {
			    location: currentLocation,
			    radius: '10'
			  };
	
	
	locationDiv = document.getElementById("places-div");
	service = new google.maps.places.PlacesService(locationDiv);
	service.search(request, callback);
	
	function callback(results, status)  
	{
		  if (status == google.maps.places.PlacesServiceStatus.OK) 
		  {
			      
				alert(results.join('\n'));
				alert(JSON.stringify(results));
				var i;
				for (i in results)
					{
					$("select[name=location]").val(results[i].name);
					}
			   
		  }
	}
		$("input[name=location]");
		$("input[name=lat]").val(position.coords.latitude);
		$("input[name=lon]").val(position.coords.longitude);
	}
			
			
	
	//gets gps data from the browser or the cell phone. Uses the getPos function. Enable high accuracy allows certain mobile devices to give more exact coordinates
	if (navigator.geolocation)
	{
	 	navigator.geolocation.getCurrentPosition(
				
	 		getPos,undefined,
			
			{
				enableHighAccuracy: true
			}
			
		);
	
	}
	
	//Credit to chris hope at www.electrictoolbox.com for this script to convert javascript's date() into a database friendly format
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
	
	

	
	
	//declaring global variables for following functions
	var timeAtStart;
	var timeAtStop;
	
	//jquery for when the start button is pressed multiple times (toggle), the first function controls what happens on the first click, the second function controls the second click, etc, etc.
	$("div#start-stop-button").toggle
	(
	    //first click 
		function()
		{
			timeAtStart=new Date();
			$("input[name=startTime]").val(dateToDatabase(timeAtStart));
			$("div#start-stop-button p").html("Stop");	
		},	
		//second click
		function()
		{
			timeAtStop=new Date();
			total = (timeAtStop-timeAtStart); 
			$("input[name=stopTime]").val(dateToDatabase(timeAtStop));
			$("input[name=totalTime]").val(total);
			$("div#start-stop-button p").html("Reset");	
		},
		//third click
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
<div id="places-div"></div>
<div id="timer-container">
<div id="start-stop-button"><button><p>Start</p></button></div><!-- start-stop-button -->
<!--<form id="timer-form"> -->
<form:form method="Post" modelAttribute="marker">
<div id="timer-data">
<div id="location">Location:
<select name=location>
<option value="volvo">Volvo</option>
<option value="volvo">Volvo</option>
<option value="volvo">Volvo</option>
<option value="volvo">Volvo</option>
</select>
</div><!-- location -->

<div id="latitude"
><form:label path="lat"> Latitude: </form:label><form:input path="lat" />
</div><!-- latitude -->

<div id="longitude">
<form:label path="lon"> Longitude: </form:label><form:input path="lon" />
</div><!-- longitude -->

<div id="start-time"> 
<form:label path="startTime"> Start Time: </form:label><form:input path="startTime" />
</div><!-- start-time -->

<div id="stop-time">
<form:label path="stopTime"> Stop Time: </form:label><form:input path="stopTime" /></div>
<!-- stop-time -->
<div id="total-time"><form:label path="totalTime">Total Time Spent (in milliseconds): </form:label><form:input path="totalTime" /></div><!-- total-time -->
</div><!-- timer-data -->
<div id="timer-submit-button"><input class=timerSubmit type="submit" value= "Submit"/></div>
</form:form>
<!-- </form><!-- timer-form -->
</div><!-- timer-container -->

</body>
</html>