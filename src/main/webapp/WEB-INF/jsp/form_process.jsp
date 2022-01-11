<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Thank you for Submitting the form!</h1>
<p><b>Welcome User:</b><%= request.getParameter("playername") %></p>
<p>Here is the info you entered </p>
<pre>
<p><b>Player Name:</b><%= request.getParameter("playername") %></p>
<p><b>Position:</b><%= request.getParameter("position") %></p>
<p><b>Description:</b><%= request.getParameter("description") %></p>
<p><b>Player points per game:</b><%= request.getParameter("ppg") %></p>
</pre>
<a href="index.jsp">Add More Players...</a>
</body>
</html>