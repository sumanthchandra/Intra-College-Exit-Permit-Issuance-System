<%@ include file = "agprs-header.jsp"%>
<%
out.println("<h2>Wrong Username/Password or Not Registered</h2>");
out.println("<a href=login.jsp><h2>Login</h2></a>");
out.println("<a href=SReg.jsp><h2>Register</h2></a>");
%>
<%@ include file="agprs-footer.jsp"%>