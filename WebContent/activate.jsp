<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="pack.Send1"%>
<%@ include file = "agprs-header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validation</title>
</head>
<body>
<form action="validate.jsp" method="post">
	<br>
	<br>
	Enter OTP sent to your mail:
	<input type="text" name="otp" value="">
	<br>
	<input type="submit" name="submit" value="Submit">
	</form>
</body>
<%@ include file="agprs-footer.jsp"%>
</html>