<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>CDs</title>
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

		

		
    <sql:query var="result">
      select * from inventory where item_group = 1002 ;
    </sql:query>


      <c:forEach var = "row" items = "${result.rows}">
          <p><c:out value = "${row.item_code}"/></p>
          <p><c:out value = "${row.item_name}"/></p>
          <p><c:out value = "${row.item_description}"/></p>
		  <p><c:out value = "${row.item_price}"/></p>

            <form action="example100.jsp" method="GET">
              <input type = "hidden" name = "item_code" 
                     value = "${row.item_code}" /> 
              <input type = "hidden" name = "item_price" 
                     value = "${row.item_price}" /> 
              <input type = "submit" value = "Buy" />
            </form>
 

      </c:forEach>

		
      </div>
      <jsp:include page="footer.jsp" />
    </div>
  </body>
</html>
