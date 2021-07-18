<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file = "agprs-header.jsp"%>
<html>
<body>
<%
if(request.getParameter("submit")!=null && request.getParameter("pnum")!=null )
{
HttpSession k=request.getSession(false);
ServletContext sc = this.getServletContext();
Class.forName(sc.getInitParameter("DB_DRIVER"));
Connection con=DriverManager.getConnection(sc.getInitParameter("DB_URL"),sc.getInitParameter("DB_USER"),sc.getInitParameter("DB_PASSWORD"));
String t=(String)k.getAttribute("id");
String pnum=request.getParameter("pnum");
String res=request.getParameter("res");
long millis=System.currentTimeMillis();  
java.sql.Date date=new java.sql.Date(millis); 
String q="In_Process";
try
{
	Statement stat=con.createStatement();
	int rs=stat.executeUpdate("insert into pass (rollno,pnumber,reason,d,stat) values('"+t+"','"+pnum+"','"+res+"','"+date+"','"+q+"');");
	if(rs>0)
	{
		out.println("Request Sent");
	}
	else
	{
		out.println("There was a problem.");
	}
}
catch(Exception e)
{
	
}
}
%>
</body>
</html>