<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="pack.Send1"%>
<%@ include file = "agprs-header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<a href="Home.jsp">Home</a>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration</title>
</head>
<body>
<form action="SReg.jsp" method="post">
STUDENT REGISTRATION FORM
<br>
Roll No:
<input type="text" name="rno" value="16BD1A05**">
<br>
Student Name:
<input type="text" name="sname" value="">
<br>
Email:
<input type="text" name="email" value="user@gmail.com">
<br>
Password:
<input type="password" name="pwd" value="">
<br>
Year:
<select name="year">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
</select>
<br>
Branch:
<select name="branch">
<option value="CSE">CSE</option>
<option value="ECE">ECE</option>
<option value="IT">IT</option>
<option value="EIE">EIE</option>
</select> 
<br>
<input type="submit" name="submit" value="Register">
</form>
<%
if(request.getParameter("submit")!=null)
{
	String r=request.getParameter("rno");
	String name=request.getParameter("sname");
	String email=request.getParameter("email");
	String pass=request.getParameter("pwd");
	int y=Integer.parseInt(request.getParameter("year"));
	String b=request.getParameter("branch");
	ServletContext sc = this.getServletContext();
	Class.forName(sc.getInitParameter("DB_DRIVER"));
	Connection con=DriverManager.getConnection(sc.getInitParameter("DB_URL"),sc.getInitParameter("DB_USER"),sc.getInitParameter("DB_PASSWORD"));
	try{
    Statement stat=con.createStatement();
    ResultSet ww=stat.executeQuery("select sname from Student where rollno='"+r+"';");
    if(ww.next()==false)
    {
	HttpSession ses=request.getSession(false);    
    ses.setAttribute("rn",r);
	String num="";
	Random rnd = new Random();
	int n = 100000 + rnd.nextInt(900000);
	num=num+n;
	int rs=stat.executeUpdate("insert into Student(rollno,sname,email,password,year,branch,otp,valid) values('"+r+"','"+name+"','"+email+"','"+pass+"',"+y+",'"+b+"','"+num+"','N');");
	String mes="OTP from GatePass App";
	Send1 s=new Send1(email,mes,num);
	s.setMailServerProperties();
	s.createEmailMessage();
	s.sendEmail();
	request.getRequestDispatcher("activate.jsp").forward(request,response);
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