<%@page language="java" contentType="text/html"%>
<%@page import="java.util.*"%>
<html><head><title>Request Headers</title>

<%
Enumeration<String> headers = request.getHeaderNames();
int kh = 0;
while (headers.hasMoreElements()) {
String hName = (String)headers.nextElement();
out.println("------- " + hName);
Enumeration<String> hValues = request.getHeaders(hName);
while (hValues.hasMoreElements()) {
out.println("<br/>&nbsp;&nbsp;&nbsp;" + hValues.nextElement());
}
out.println("<br/>");
}
%>
</body></html>