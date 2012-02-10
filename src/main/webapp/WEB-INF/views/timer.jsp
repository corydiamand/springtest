<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Timer</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" type ="text/css"/>

</head>
<body>
<tags:header/>
<script src=/springtest/src/main/webapp/resources/jquery.js></script>
<script type="text/javascript">
if (navigator.geolocation)
	{
	navigator.geolocation.getCurrentPosition
	(
			function	(position)
			{
				alert(position.coords.latitude);
	
			}
			
	);
	
	}
</script>	


Hello Timer
<div id="timer-container">
<div id="start-stop-button">Start</div><!-- start-stop-button -->
<div id="timer-data">
<div id="location">Location: </div>
<div id="start-time">Start Time</div>
<div id="stop-time">Stop Time</div>
<div id="total-time">Total Time Spent</div>
</div><!-- timer-data -->
<div id="timer-submit-button">Submit Button</div>
</div><!-- timer-container -->

</body>
</html>