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
	
	//we use function getPos later on when we grab the gps coordinates
	
	function getPos(position)
	{
		//sets variable currentLocation to the current lat and lon pulled from the navigator.geolocation call we make later
		currentLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
		
	 	var request = 
	 	{
			location: currentLocation,	//current location of the user
			radius: '10'	//10 meter radius from coordinates
		};
	
	 
		 //not sure why the following line of code throws an error.
		//locationDiv = document.$("select[name=location]");
	 
		locationDiv = document.getElementById("places-div");	//sets a div for the placesService
		service = new google.maps.places.PlacesService(locationDiv);	//assigns PlacesService to variable service
		service.search(request, callback);	//calls the search method
	
	
		//function tells us what we should with the results of the search request
		function callback(results, status)  
		{
			if (status == google.maps.places.PlacesServiceStatus.OK) //did the request go through ok?
		  	{
			      
				//alert(JSON.stringify(results)); //if you want to see an alert window of results, uncomment this.
				
				var i;
				for (i in results) //for all the results
					{
						$("select[name=location]").prepend("<option value='"+results[i].name+"'>"+results[i].name+"</option>"); //for each result, prepend the following to the location select element
					}
			   
				$("select[name=location]").attr("size",results.length+1); 	//set the size of the select box based on list of results - I might put some sort of limit in here...
				
				$("select[name=location] option:eq("+results.length+")").text("None Of The Above");	//changes the "no nearby locations text" in the select box to "None of the above"
				
		  	}
		}
		
		
		$("input[name=lat]").val(position.coords.latitude); 	//put lat in the lat input
		$("input[name=lon]").val(position.coords.longitude);	//put lon in the lon input
	}
			
			
	
	
	
	//heres where the magic happens we get gps data from the browser or the cell phone. We use the getPos function. We Enable high accuracy to allow certain mobile devices to give more exact coordinates
	if (navigator.geolocation)
	{
	 	navigator.geolocation.getCurrentPosition
	 	(
				
	 		getPos,undefined,  //getPos is the big function we defined earlier. Undefined is what to do if the call fails.
			
			{
				enableHighAccuracy: true
			}
			
		);
	
	}
	
	
	
	
	
	
	
	//Credit to chris hope at www.electrictoolbox.com for the following two functions to convert javascript's date() into a database friendly format
	//we use this in the following functions when create date objects
	function pad(number, length) 
	{
		
   		var str = '' + number;
   		
    	while (str.length < length) 
    	{
        	str = '0' + str;
    	}
   
    	return str;
	}

	
	function dateToDatabase(dt)
	{
		return dt.getFullYear() + '-' + pad(dt.getMonth()+1, 2) + '-' + pad(dt.getDate(), 2) + ' ' + pad(dt.getHours(), 2) + ':' + pad(dt.getMinutes(), 2) + ':' + pad(dt.getSeconds(), 2);
	}
	
	

	
	
	
	
	
	//declaring variables for following functions
	var timeAtStart;
	var timeAtStop;
	
	//jquery for when the start button is pressed multiple times (toggle), the first function controls what happens on the first click, the second function controls the second click, the third function responds to the third click.
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


</head>





<body>


<tags:header/> 


<div id="places-div"></div> <!-- for the PlacesService -->






<div id="timer-container">

	<div id="start-stop-button">
		<button>
			<p>Start</p>
		</button>
	</div><!-- start-stop-button -->
	
	
	<form:form method="Post" modelAttribute="marker">
	
		<div id="timer-data">

			<div id="location">
				<form:label path="location">Location:</form:label>
					<form:select path="location" name="location" size="">
						<option value="none">No nearby locations found!</option>
					</form:select>
			</div><!-- location -->
			

			<div id="latitude">
				<form:label path="lat"> Latitude: </form:label>
				<form:input path="lat" />
			</div><!-- latitude -->

			<div id="longitude">
				<form:label path="lon"> Longitude: </form:label>
				<form:input path="lon" />
			</div><!-- longitude -->

			<div id="start-time"> 
				<form:label path="startTime"> Start Time: </form:label>
				<form:input path="startTime" />
			</div><!-- start-time -->

			<div id="stop-time">
				<form:label path="stopTime"> Stop Time: </form:label>
				<form:input path="stopTime" />
			</div><!-- stop-time -->
			
			<div id="total-time">
				<form:label path="totalTime">Total Time Spent (in milliseconds): </form:label>
				<form:input path="totalTime" />
			</div><!-- total-time -->
			
		</div><!-- timer-data -->
		
		<div id="timer-submit-button"><input class=timerSubmit type="submit" value= "Submit"/></div>
		
	</form:form>
	
</div><!-- timer-container -->
	

</body>
</html>