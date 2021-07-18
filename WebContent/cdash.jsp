<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file = "agprs-header.jsp"%>
<html>
<body>
<a href="Logout.jsp"><input type="button" value="Logout"></a>
<br>
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
	ResultSet r=stat.executeQuery("select cname,year,branch from Coordinator where email ='"+t+"' and password='"+u+"';");
	out.println("<h1>COORDINATOR DASHBOARD</h1>");
	out.println();
	int flag=0;
	while(r.next())
	{   flag=1;
		out.println("<h2>Welcome "+r.getString("cname")+"!</h2>");
		 HttpSession kk=request.getSession(false);
		 //out.println("Year is "+r.getInt("year"));
		 kk.setAttribute("year",new Integer(r.getInt("year")));
		 kk.setAttribute("branch",r.getString("branch"));
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
<h2>View Requests:</h2>
<form action="cview.jsp" method="post">
<input type="submit" name="submit" value="View Requests"> 
</form>
<br>
</body>
</html>
<%@ include file="agprs-footer.jsp"%>