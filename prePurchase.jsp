<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.lang.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Purchase</title>
    <link rel="stylesheet"    
          href="stylesheet.css" 
          type="text/css" />	
  </head>
  <body>
    <div class="container">
      <jsp:include page="header.jsp" />
      <jsp:include page="left.jsp" />
      <div class="content">
	    <jsp:include page="top_menu.jsp" />	  
	
	<h2>You are about to purchase a product with item code
    <%= request.getParameter( "item_code" ) %> and price
    <%= request.getParameter( "item_price" ) %> and upon purchase you will be redirected to <%=request.getParameter("previousP")%> </h2>
  
  <sql:query var="item_stock_count">
	 select * from inventory where item_code="${param.item_code}"; 
	</sql:query>
	
	<c:set var="stockCount" value="${item_stock_count.rows[0]['item_stock_count']}" scope="page" />
	
	<% if ((int)pageContext.getAttribute("stockCount") == 0)
	{
		%>
	<p> Sold out <p>
	<% }
	else
		{ 
	%>
		
	  <form action="purchase.jsp" method="get">
		Discount code:<input type="text" name="discount">
		<br />
		<input type="hidden" name="item_code" value="<%=request.getParameter( "item_code" )%>" />
		<input type="hidden" name="item_price" value="<%=request.getParameter( "item_price" )%>" />
		<input type="submit" value="Complete purchase" />
  	  </form>
	  
	  <form action="<%=request.getParameter("previousP")%>">
		<input type="submit" value="Cancel purchase"/>
	  </form>
	  <%
		}
		%>
	  
	</div>
	</div>  
  </body>
</html>
