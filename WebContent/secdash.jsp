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
	ResultSet r=stat.executeQuery("select sname from Security where pnumber ='"+t+"' and password='"+u+"';");
	out.println("<h1>SECURITY DASHBOARD</h1>");
	out.println();
	int flag=0;
	while(r.next())
	{    flag=1;
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
<h2>Check Today's Requests:</h2>
<form action="check.jsp" method="post">
<input type="submit" name="submit" value="Check"> 
</form>
<br>
</body>
</html>
<%@ include file="agprs-footer.jsp"%>