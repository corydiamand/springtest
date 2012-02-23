<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ page session="false" %>


<html>
	<head>
		<title>Home</title>
		
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" type ="text/css"/>
		
		<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDj5NRHn6nfzfYopzd9xnoW5As1yZu6cYA&sensor=true"></script>
    	<script src="<%=request.getContextPath()%>/resources/infobox.js" type="text/javascript"></script>
		<script type="text/javascript">
    		function initialize() 
   			{
    			var myOptions = 
    			{
    				center: new google.maps.LatLng(40.769069,-73.988335),
    				zoom: 15,
    				mapTypeId: google.maps.MapTypeId.ROADMAP
    			};
    			
    			var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
        
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
    		/*	
    			var infowindow;
    			var infowindow = new google.maps.InfoWindow(
    			{
    				content: ("hello World!"),
    				maxWidth: (200)
    			});
        		
    			//initialize infowindow
    			infowindow.open(map,marker2);
        	*/
        	
        	//I'm glad google has provided the following "infobox". I was finding the standard infowindow somewhat unmalleable. 
        	
        	 var boxText = document.createElement("div");
            boxText.style.cssText = "border: 1px solid black; margin-top: 8px; background: lightgreen; padding: 5px;";
            boxText.innerHTML = "Hello World!";
                    
            var myOptions = 
            {
                     content: boxText
                    ,disableAutoPan: false
                    ,maxWidth: 0
                    ,pixelOffset: new google.maps.Size(-140, 0)
                    ,zIndex: null
                    
                    ,boxStyle: 
                    { 
                    	background: "url('http://google-maps-utility-library-v3.googlecode.com/svn/tags/infobox/1.1.5/examples/tipbox.gif') no-repeat"
                      	,opacity: 0.75
                      	,width: "280px"
                    }
            
                    ,closeBoxMargin: "10px 2px 2px 2px"
                    ,closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif"
                    ,infoBoxClearance: new google.maps.Size(1, 1)
                    ,isHidden: false
                    ,pane: "floatPane"
                    ,enableEventPropagation: false
            };

            var ib = new InfoBox(myOptions);
            ib.open(map, marker2);
        	
        	
        
    			//loop through list<Markers>
    			<c:forEach items="${markers}" var="marker">

    			var marker<c:out value="${marker.id}" /> = new google.maps.Marker(
    			{
    				map: map,
    				position: new google.maps.LatLng(<c:out value="${marker.lat}" />,<c:out value="${marker.lon}" />),
    				title:"this is Marker <c:out value="${marker.id}" />"
    			});
    			
    			
    			
    			//I'm glad google has provided the following "infobox". I was finding the standard infowindow somewhat unmalleable. This pulls from resources/infobox.js .
            	
           	 var boxText = document.createElement("div");
               boxText.style.cssText = "border: 1px solid black; margin-top: 8px; background: lightgreen; padding: 5px;";
               boxText.innerHTML = "Hello I am Marker #"+<c:out value="${marker.id}"/>+"!<br> The recorded time spent here is:"+<c:out value="${marker.totalTime}"/>/1000+"seconds";
                       
               var myOptions = 
               {
                        content: boxText
                       ,disableAutoPan: false
                       ,maxWidth: 0
                       ,pixelOffset: new google.maps.Size(-140, 0)
                       ,zIndex: null
                       
                       ,boxStyle: 
                       { 
                       	background: "url('http://google-maps-utility-library-v3.googlecode.com/svn/tags/infobox/1.1.5/examples/tipbox.gif') no-repeat"
                         	,opacity: 0.75
                         	,width: "280px"
                       }
               
                       ,closeBoxMargin: "10px 2px 2px 2px"
                       ,closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif"
                       ,infoBoxClearance: new google.maps.Size(1, 1)
                       ,isHidden: false
                       ,pane: "floatPane"
                       ,enableEventPropagation: false
               };

               var ib = new InfoBox(myOptions);
               ib.open(map, marker<c:out value="${marker.id}"/>);

    			
               </c:forEach>
        
       
    		}
      
    	</script>

	</head>
	
	<body onload="initialize()">
	
	 	<tags:header/> 
		

	<P>  The time on the server is ${serverTime}. </P>
		<div id="main">
			<div id="left-column">
			</div><!-- left-column -->
			<div id="map">
				<div id="map_canvas" style="width: 100%; height: 100%">
				</div><!-- map_canvas -->
			</div><!-- map -->
		</div><!-- main -->
	</body>
</html>
