<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>DVDs</title>
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

        </br>    
        <p>

		
    <sql:query var="result">
      select item_code, item_description, item_price, item_stock_count
	  from inventory where item_group = 1001
    </sql:query>
      <c:forEach var = "row" items = "${result.rows}">
          <c:out value = "${row.item_code}"/></
		  <c:out value = "${row.item_decription}"/></
		  <c:out value = "${row.item_price}"/></
		  <c:out value = "${row.item_stock_count}"/></

		  
            <form action="example100.jsp" method="GET">
              <input type = "hidden" name = "item_code" 
                     value = "${row.item_code}" /> 
              <input type = "hidden" name = "item_price" 
                     value = "${row.item_price}" /> 
              <input type = "submit" value = "Buy" />
            </form>

      </c:forEach>
	</p>
	

		
      </div>
      <jsp:include page="footer.jsp" />
    </div>
  </body>
</html>
