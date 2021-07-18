<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file = "agprs-header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="container col-md-6 form-group" style="justify-content:center">
<h2><a href="Home.jsp" style="text-align:center;">Home</a></h2>
<form action="login.jsp" method="post">
<br>
<label for="actor">Actor:</label>
<select name="actor" id="actor" class="form-control">
<option value="Coordinator">Coordinator</option>
<option value="Student">Student</option>
<option value="Security">Security</option>
</select>
<br>
<label for="user">Roll No/Email/P.No:</label>
<input type="text" name="user" value="" id="user"  class="form-control">
<br>
<label for="pwd">Password:</label>
<input type="password" id="pwd" name="pwd" value=""  class="form-control">
<br>
<div class="container" style="justify-content:center">
<input type="submit" class="btn btn-primary" name="submit" value="Login">
</div>
</form>
</div>
<%
if(request.getParameter("submit")!=null)
{
	String actor=request.getParameter("actor");
	String user=request.getParameter("user");
	String pass=request.getParameter("pwd");
	HttpSession k=request.getSession(false);
	ServletContext sc = this.getServletContext();
	Class.forName(sc.getInitParameter("DB_DRIVER"));
	Connection con=DriverManager.getConnection(sc.getInitParameter("DB_URL"),sc.getInitParameter("DB_USER"),sc.getInitParameter("DB_PASSWORD"));
	try{
		Statement stat=con.createStatement();
		if(actor.equals("Student"))
		{   
	    k.setAttribute("id",user);
	    k.setAttribute("pwd",pass);
		request.getRequestDispatcher("sdash.jsp").forward(request,response);
		}
		else if(actor.equals("Coordinator"))
		{
			 k.setAttribute("id",user);
			 k.setAttribute("pwd",pass);
			request.getRequestDispatcher("cdash.jsp").forward(request,response);
		}
		else
		{
			k.setAttribute("id",user);
			k.setAttribute("pwd",pass);
			request.getRequestDispatcher("secdash.jsp").forward(request,response);
		}
		
	}
	catch(Exception e)
	{
		
	}
}
%>
</body>
<br>
<%@ include file="agprs-footer.jsp"%>
</html>