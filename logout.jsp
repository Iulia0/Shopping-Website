<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.lang.*" %>
<!DOCTYPE html>

<%
	session.invalidate();
	
%>
<jsp:forward page="index.jsp" />