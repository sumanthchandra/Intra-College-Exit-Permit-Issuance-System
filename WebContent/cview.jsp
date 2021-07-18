<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file = "agprs-header.jsp"%>
<html><body>
Approve/Reject Request: (in order to see changes,click on view requests in dashboard)
<br>
<form action="change.jsp" method="post">
Enter Request ID:
<input type="number" name="id" value="">
<br>
Approve/Reject:
<select name="status">
<option value="Approve">Approve</option>
<option value="Reject">Reject</option>
</select>
<br>
<input type="submit" name="submit" value="submit"> 
</form>
<br>
<%
if(request.getParameter("submit")!=null)
{
HttpSession w=request.getSession(true);  
Integer t=(Integer)w.getAttribute("year");
String u=(String)w.getAttribute("branch");
ServletContext sc = this.getServletContext();
Class.forName(sc.getInitParameter("DB_DRIVER"));
Connection con=DriverManager.getConnection(sc.getInitParameter("DB_URL"),sc.getInitParameter("DB_USER"),sc.getInitParameter("DB_PASSWORD"));
try
{
Statement stat=con.createStatement();
ResultSet r=stat.executeQuery("select* from pass p inner join Student s on s.rollno=p.rollno where s.year="+t+" and s.branch='"+u+"' order by gid desc;");
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
out.println("<th>Parent Number</th>");
out.println("<th>Reason</th>");
out.println("<th>Date</th>");
out.println("<th>Status</th>");
out.println("</tr>");
while(r.next())
{   out.println("<tr>");
	flag=1;
	out.println("<td>"+r.getInt("gid")+"</td><td>"+r.getString("rollno")+"</td><td>"+r.getString("pnumber")+"</td><td>"+r.getString("reason")+"</td><td>"+r.getDate("d")+"</td><td>"+r.getString("stat")+"</td>");
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
<br>
</body>
<%@ include file="agprs-footer.jsp"%>
</html>