<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file = "agprs-header.jsp"%>
<%
if(request.getParameter("submit")!=null)
{
HttpSession w=request.getSession();  
String t=(String)w.getAttribute("id");
ServletContext sc = this.getServletContext();
Class.forName(sc.getInitParameter("DB_DRIVER"));
Connection con=DriverManager.getConnection(sc.getInitParameter("DB_URL"),sc.getInitParameter("DB_USER"),sc.getInitParameter("DB_PASSWORD"));
try
{
Statement stat=con.createStatement();
ResultSet r=stat.executeQuery("select* from pass where rollno='"+t+"' order by gid desc;");
int flag=0;
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
out.println("<th>Reason</th>");
out.println("<th>Date</th>");
out.println("<th>Status</th>");
out.println("</tr>");
while(r.next())
{   out.println("<tr>");
	flag=1;
	out.println("<td>"+r.getInt("gid")+"</td><td>"+r.getString("rollno")+"</td><td>"+r.getString("reason")+"</td><td>"+r.getDate("d")+"</td><td>"+r.getString("stat")+"</td>");
    out.println("</tr>");
}
out.println("</table>");
out.println("</html></body>");
if(flag==0)
{
	out.println("No requests yet");
}
}
catch(Exception e)
{
	
}
}
%>
<%@ include file="agprs-footer.jsp"%>