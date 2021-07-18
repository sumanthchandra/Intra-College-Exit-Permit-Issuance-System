<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="pack.Send1"%>
<%@ include file = "agprs-header.jsp"%>
<% if(request.getParameter("submit")!=null)
{
String otp=request.getParameter("otp");
ServletContext sc = this.getServletContext();
Class.forName(sc.getInitParameter("DB_DRIVER"));
Connection con=DriverManager.getConnection(sc.getInitParameter("DB_URL"),sc.getInitParameter("DB_USER"),sc.getInitParameter("DB_PASSWORD"));
try{
	HttpSession ses=request.getSession(false);    
    String g=(String)ses.getAttribute("rn");
	Statement stat=con.createStatement();
	ResultSet r=stat.executeQuery("select otp from Student where rollno = '"+g+"';");
	r.beforeFirst();
	while(r.next()){
		if(r.getString("otp").equals(otp))
		{   String j="Y";
		    Statement stat1=con.createStatement();
		    int r1=stat1.executeUpdate("update Student set valid='"+j+"' where rollno ='"+g+"';");
			out.println("<h1>Sucessfully Registered<h1>");
			out.println("<a href=login.jsp><h2>Login</h2></a>");
			
		}
		else
		{   Statement stat2=con.createStatement();
			int r2=stat2.executeUpdate("delete from Student where rollno ='"+g+"';");
			out.println("<h1>Invalid OTP. Try Again<h1>");
			out.println("<a href=SReg.jsp><h2>Register</h2></a>");
		}
	}
   }
catch(Exception e)
	{
		System.out.println(e);
	}
}
%>
<br>
<%@ include file="agprs-footer.jsp"%>