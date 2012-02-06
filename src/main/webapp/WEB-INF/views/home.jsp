<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<head>
	<title>Home</title>
	   <link href="style.css" rel="stylesheet" type="text/css">
		
	<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDj5NRHn6nfzfYopzd9xnoW5As1yZu6cYA&sensor=true">
    </script>
<script type="text/javascript">
      function initialize() 
      {
        var myOptions = 
        {
          center: new google.maps.LatLng(40.769069,-73.988335),
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"),
            myOptions);
        
        var marker = new google.maps.Marker(
        		{
        			map: map, 
        			position: new google.maps.LatLng(40.769069,-73.988335),
        			title:"Hello World!"
        		});
        var marker2 = new google.maps.Marker(
        		{
        			map: map, 
        			position: new google.maps.LatLng(40.769099,-73.988399),
        			title:"Hello World!"
        			
        		});
        var infowindow;
        var infowindow = new google.maps.InfoWindow(
        		{
        			content: ("hello World!"),
        			maxWidth: (4)
        		});
        
        infowindow.open(map,marker2);
        
        
        <c:forEach items="${markers}" var="marker">

        var marker<c:out value="${marker.id}" /> = new google.maps.Marker(
        		{
        			map: map,
        			position: new google.maps.LatLng(<c:out value="${marker.lat}" />,<c:out value="${marker.lon}" />),
        			title:"this is Marker <c:out value="${marker.id}" />"
        		});

        </c:forEach>
        
       
      }
      
    </script>

</head>
<body onload="initialize()">
<h1>
	Hello world!  
</h1>
<div id="css-test"></div>

<P>  The time on the server is ${serverTime}. </P>

<div id="map">

			<div id="map_canvas" style="width: 100%; height: 100%">
			</div><!-- map_canvas -->
		</div>
</body>
</html>
