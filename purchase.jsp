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
		  
    <h2>You have purchased the product: 
    <%= request.getParameter( "item_code" ) %> and price
    <%= request.getParameter( "item_price" ) %> and discount code
	<%= request.getParameter( "discount" )%></h2>
	
        <p> You can now return to the main page by clicking on the home button at the top of the page. </p>
	<%
		if(request.getParameter( "discount" ) == null || request.getParameter( "discount" ) == "")
		{
			%>
			<sql:update>
				update inventory set item_stock_count = item_stock_count - 1 where item_code="<%=request.getParameter( "item_code" )%>";
			</sql:update>
			
			<sql:update>
				insert into customer_order values (null,now(),false,now() + interval 3 day, <%=session.getAttribute("username")%>);
			</sql:update>
			
			<sql:update>
				insert into order_item values ("<%= request.getParameter( "item_code" ) %>", <%= request.getParameter( "item_price" ) %>, (select max(order_number) from customer_order),1);
			</sql:update>
			
			<%
		}
		else
		{
			String dcCode = request.getParameter("discount");
			pageContext.setAttribute("dc", dcCode);
			
			%>
			<sql:query var="dcResult">
				select * from promotion_code where code = "${dc}";
			</sql:query>
			<c:forEach var = "row" items = "${dcResult.rows}">
				<c:set var = "dcAmount" scope="page" value = "${row.discount}"/>
			</c:forEach>
			<%
			
			if (pageContext.getAttribute("dcAmount") == null)
			{
				%>
				<p>Invalid code<p>
				<%
			}
			else
			{
				String oldP = request.getParameter( "item_price" );
				Double newP = Double.parseDouble(oldP);
				Object oldDC = pageContext.getAttribute("dcAmount");
				int newDC = (Integer) oldDC;
				newP = ((100-newDC) * newP) / 100;
				out.print(newP);
				
				%>
				<sql:update>
					update inventory set item_stock_count = item_stock_count - 1 where item_code="<%=request.getParameter( "item_code" )%>";
				</sql:update>
			
				<sql:update>
					insert into customer_order values (null,now(),false,now() + interval 3 day, <%=session.getAttribute("username")%>);
				</sql:update>
				
				<sql:update>
					insert into order_item values ("<%= request.getParameter( "item_code" ) %>", <%=newP%>, (select max(order_number) from customer_order),1);
				</sql:update>
				<%
			}
		}
	%>
	

		
      </div>
      <jsp:include page="footer.jsp" />
    </div>
  </body>
</html>
