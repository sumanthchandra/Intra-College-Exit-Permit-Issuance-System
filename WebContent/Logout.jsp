<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
HttpSession w=request.getSession();  
w.invalidate();    
request.getRequestDispatcher("login.jsp").include(request, response);    
%>
