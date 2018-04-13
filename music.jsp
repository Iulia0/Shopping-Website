<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Music</title>
    <link rel="stylesheet"    
          href="stylesheet.css" 
          type="text/css" />
  </head>
  <body>
    <div class="container">
      <jsp:include page="header.jsp" />
      <jsp:include page="left.jsp" />
	  <jsp:include page="top_menu.jsp" />
      <div class="content">



	<sql:query var="result">
	  select * from inventory where item_group = 1002 ;
	</sql:query>

      <c:forEach var = "row" items = "${result.rows}">
		<div class="it">
			<img src="${row.item_image_loc}" alt= "" height = '230' width = '180'/>
			<div class = "it1">
			<p><c:out value = "${row.item_code}"/></p>
			<p><c:out value = "${row.item_name}"/></p>
			<p><c:out value = "${row.item_description}"/></p>
			<p><c:out value = "${row.item_price}"/></p>
			<p><c:out value = "${row.item_stock_count}"/></p>
			
		<%
	     if(session.getAttribute("username")==null)
	       { 
	   %>
		<p> You must be logged in to buy a product</p>
	<%
	}
	else
	{
		
		pageContext.setAttribute("previous","games.jsp");
	%>	
	
		<sql:query var="result1">
		select * from review where customer_number = <%=session.getAttribute("username")%> and item_code = "${row.item_code}";
	</sql:query>
	
	<c:forEach var = "row2" items = "${result1.rows}">
		<c:set var="rating" scope="page" value="${row2.rating}"/>
	</c:forEach>
			<%
		if (pageContext.getAttribute("rating") == null || pageContext.getAttribute("rating") == "")
		{
	%>
	
		<form action="review.jsp" method="GET">
        <input type="radio" name="rating" value="1" />1
        <input type="radio" name="rating" value="2" />2
        <input type="radio" name="rating" value="3" checked/>3
		<input type="radio" name="rating" value="4" />4
		<input type="radio" name="rating" value="5" />5
		<input type = "hidden" name = "item_code" value = "${row.item_code}" />
		<input type ="submit" value="Submit" />
	    </form>
        <br />
	
			<form action="prePurchase.jsp" method="GET">
				<input type="hidden" name="previousP" value="${previous}"/>
				<input type = "hidden" name = "item_code" 
					value = "${row.item_code}" /> 
					<input type = "hidden" name = "item_price" 
					value = "${row.item_price}" /> 
					<input type = "hidden" name = "item_stock_count" 
					value = "${row.item_stock_count}" />
					<input type = "submit" value = "Buy" />
			</form>

						
		<% 
		}
		else
		{
			%>
			<p>Rated <%=pageContext.getAttribute("rating")%>*</p>
			<%
			pageContext.setAttribute("rating","");
		}
	} 
		%>
			</div>
			</div>
			</c:forEach>	
      </div>
      <jsp:include page="footer.jsp" />
    </div>
  </body>
</html>