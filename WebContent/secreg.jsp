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
<form action="secreg.jsp" method="post">
SECURITY REGISTRATION FORM
<br>
Phone Number
<input type="number" name="num" value="0">
<br>
Security Name:
<input type="text" name="sname" value="">
<br>
Password:
<input type="password" name="pwd" value="">
<br>
<input type="submit" name="submit" value="Register">
</form>
<% 
if(request.getParameter("submit")!=null)
{
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("sname");
	String pass=request.getParameter("pwd");
	ServletContext sc = this.getServletContext();
	Class.forName(sc.getInitParameter("DB_DRIVER"));
	Connection con=DriverManager.getConnection(sc.getInitParameter("DB_URL"),sc.getInitParameter("DB_USER"),sc.getInitParameter("DB_PASSWORD"));
	try{
	Statement stat=con.createStatement();
	ResultSet ww=stat.executeQuery("select sname from Security where pnumber="+num+";");
    if(ww.next()==false)
    {
	int rs=stat.executeUpdate("insert into Security(pnumber,sname,password) values("+num+",'"+name+"','"+pass+"');");
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