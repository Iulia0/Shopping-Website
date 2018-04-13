<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Books</title>
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
	      
<h2>You have given a  
    <%= request.getParameter( "rating" ) %>  star review to product
	 <%= request.getParameter( "item_code" ) %> </h2>

				<sql:update>
					insert into review values (null,  <%= session.getAttribute( "username" ) %>, "<%= request.getParameter( "item_code" ) %>", <%= request.getParameter( "rating" ) %>);
				</sql:update>
				

			
      </div>
      <jsp:include page="footer.jsp" />
    </div>
  </body>
</html>