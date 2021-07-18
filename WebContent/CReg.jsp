<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file = "agprs-header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<a href="Home.jsp">Home</a>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Coordinator Registration</title>
</head>
<body>
<form action="CReg.jsp" method="post">
COORDINATOR REGISTRATION FORM
<br>
Email:
<input type="text" name="email" value="user@gmail.com">
<br>
Coordinator Name:
<input type="text" name="cname" value="">
<br>
Password:
<input type="password" name="pwd" value="">
<br>
Year:
<select name="year">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
</select>
<br>
Branch:
<select name="branch">
<option value="CSE">CSE</option>
<option value="ECE">ECE</option>
<option value="IT">IT</option>
<option value="EIE">EIE</option>
</select> 
<br>
<input type="submit" name="submit" value="Register">
</form>
<% 
if(request.getParameter("submit")!=null)
{
	String email=request.getParameter("email");
	String name=request.getParameter("cname");
	String pass=request.getParameter("pwd");
	int y=Integer.parseInt(request.getParameter("year"));
	String b=request.getParameter("branch");
	ServletContext sc = this.getServletContext();
	Class.forName(sc.getInitParameter("DB_DRIVER"));
	Connection con=DriverManager.getConnection(sc.getInitParameter("DB_URL"),sc.getInitParameter("DB_USER"),sc.getInitParameter("DB_PASSWORD"));
	try{
	Statement stat=con.createStatement();
	ResultSet ww=stat.executeQuery("select cname from Coordinator where email='"+email+"';");
    if(ww.next()==false)
    {
	int rs=stat.executeUpdate("insert into Coordinator(email,cname,password,year,branch) values('"+email+"','"+name+"','"+pass+"',"+y+",'"+b+"');");
    if(rs>0)
    {
    out.println("<h2>Successfully Registered</h2>");
    out.println("<a href=login.jsp><h2>Login</h2></a>");
    }
	else
	{
		out.println("<h2>Try Again</h2>");
	}
    }
    else
	{
		  out.println("<h2>Already Registered</h2>");
		   out.println("<a href=login.jsp>Login</a>");
	}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
}
%>
</body>
<br>
<%@ include file="agprs-footer.jsp"%>
</html>