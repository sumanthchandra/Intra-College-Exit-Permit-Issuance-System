<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file = "agprs-header.jsp"%>
<html><body>
<%
if(request.getParameter("submit")!=null)
{   //int id=Integer.parseInt(request.getParameter("id"));
	ServletContext sc = this.getServletContext();
	Class.forName(sc.getInitParameter("DB_DRIVER"));
	Connection con=DriverManager.getConnection(sc.getInitParameter("DB_URL"),sc.getInitParameter("DB_USER"),sc.getInitParameter("DB_PASSWORD"));
	try
	{
	Statement stat=con.createStatement();
	long millis=System.currentTimeMillis();  
    java.sql.Date date=new java.sql.Date(millis);
	ResultSet r=stat.executeQuery("select gid,s.sname,p.rollno,stat,d from pass p inner join Student s on p.rollno=s.rollno where d='"+date+"';");
	out.println("<html><body>");
	out.println("<style>");
	out.println("table, th, td {");
	out.println("border: 1px solid black;");
	out.println("border-collapse: collapse;");
	out.println("}");
	out.println("</style>");
	out.println("<table>");
	out.println("<tr>");
	out.println("<th>Request ID</th>");
	out.println("<th>Roll No</th>");
	out.println("<th>Name</th>");
	out.println("<th>Date</th>");
	out.println("<th>Status</th>");
	out.println("</tr>");
	int flag=0;
	String nn="";
	while(r.next())
	{   out.println("<tr>");
		flag=1;
		nn=nn+r.getString("stat");
		out.println("<td>"+r.getInt("gid")+"</td><td>"+r.getString("rollno")+"</td><td>"+r.getString("sname")+"</td><td>"+r.getDate("d")+"</td><td>"+nn+"</td>");
	    out.println("</tr>");
	}
	out.println("</table>");
	out.println("</html></body>");
	if(flag==0)
	{
		out.println("<H1>No Requests yet.....");
	}
	}
	catch(Exception e)
	{
		
	}
}
%>
</body>
<%@ include file="agprs-footer.jsp"%>
</html>