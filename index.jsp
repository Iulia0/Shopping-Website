<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Welcome Page</title>
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
        	
			<sql:query var = "result">
			select * from inventory where item_description like "%<%=request.getParameter( "search" )%>%";
			</sql:query>	
			
			<c:forEach var = "row" items = "${result.rows}">
		<div class="item">
			<img src="${row.item_image_loc}" height = '200' width = '200'/>
			<div class = "inf_item">
			<p><c:out value = "${row.item_code}"/></p>
			<p><c:out value = "${row.item_name}"/></p>
			<p><c:out value = "${row.item_description}"/></p>
			<p><c:out value = "${row.item_price}"/></p>
			<p><c:out value = "${row.item_stock_count}"/></p>
			</div>
	        </div>
           </c:forEach>

      </div>
      <jsp:include page="footer.jsp" />
    </div>
  </body>
</html>
