<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file = "agprs-header.jsp"%>
<html>
<body>
<a href="Logout.jsp"><input type="button" value="Logout"></a>
<%
HttpSession k=request.getSession(false);
ServletContext sc = this.getServletContext();
Class.forName(sc.getInitParameter("DB_DRIVER"));
Connection con=DriverManager.getConnection(sc.getInitParameter("DB_URL"),sc.getInitParameter("DB_USER"),sc.getInitParameter("DB_PASSWORD"));
String t=(String)k.getAttribute("id");
String u=(String)k.getAttribute("pwd");
try
{
	Statement stat=con.createStatement();
	ResultSet r=stat.executeQuery("select sname from Student where rollno ='"+t+"' and password='"+u+"';");
	out.println("<html><body>");
	out.println("</html></body>");
	out.println("<H1>STUDENT DASHBOARD</H1>");
	out.println();
	int flag=0;
	while(r.next())
	{   flag=1;
		out.println("<h2>Welcome "+r.getString("sname")+"!</h2>");
	}
	if(flag==0)
	{
		request.getRequestDispatcher("message.jsp").forward(request,response);
	}
}
catch(Exception e)
{
	
}
%>
<h2>Apply for Gate Pass:</h2>
<form action="pass.jsp" method="post">
Enter Parent Mobile Number:
<input type="text" name="pnum" value="">
<br>
Enter Reason:
<select name="res">
<option value="Sick">Sick</option>
<option value="Work">Work</option>
<option value="Emergency">Emergency</option>
</select>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="submit" value="Request">
</form>
<h2>View Requests:</h2>
<form action="view.jsp" method="post">
<input type="submit" name="submit" value="View My Requests"> 
</form>
<br>
</body>
</html>
<%@ include file="agprs-footer.jsp"%>