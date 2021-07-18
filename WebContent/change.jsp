<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
if(request.getParameter("submit")!=null)
{
	ServletContext sc = this.getServletContext();
	Class.forName(sc.getInitParameter("DB_DRIVER"));
	Connection con=DriverManager.getConnection(sc.getInitParameter("DB_URL"),sc.getInitParameter("DB_USER"),sc.getInitParameter("DB_PASSWORD"));
	int id=Integer.parseInt(request.getParameter("id"));
	String status=request.getParameter("status");
	if(status.equals("Approve"))
	{
		try
		{   System.out.println(id+" "+status);
			String a="Approved";
		    Statement stat=con.createStatement();
		    int r=stat.executeUpdate("update pass set stat='"+a+"' where gid = "+id+";");
		if(r>0)
		{
			out.println("<h1>Approved</h1>");
		}
		else
			out.println("<h1>Some Problem Occured. Try Again</h1>");			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		}
		else if(status.equals("Reject"))
		{
			try{
			String a="Rejected";
			Statement stat=con.createStatement();
			int r=stat.executeUpdate("update pass set stat='"+a+"' where gid ="+id+";");
			if(r>0)
			{
				out.println("<h1>Rejected</h1>");
			}
			else
				out.println("<h1>Some Problem Occured. Try Again</h1>");
			}
			catch(Exception e)
			{
				
			}
		}
	
}
%>