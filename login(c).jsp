<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.lang.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Customer Log in</title>
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
      NB You must enter a <em>customer number</em> and valid
      password for it.
    </p>
    <%
      if ( session.isNew() )
      {
        out.println( "<h3>NB: New session starting</h3>" );
      }
      else
      {
        session.invalidate();
    %>
        <jsp:forward page="login(c).jsp" />
    <%
      }
    %>

    <% 
      if ( request.getParameter( "username" ) == null )
      {
        out.println( "<h3>Please login:</h3>" );
      }
      else
      {
        pageContext.setAttribute(
          "customerNumberString",
          request.getParameter( "username" ) );
        pageContext.setAttribute(
          "customerPasswordString",
          request.getParameter( "password" ) );
    %>

        <sql:query var="result">
          select * from customer where 
            customer_number = "${customerNumberString}" and 
            passwd = MD5("${customerPasswordString}");
        </sql:query>

        <c:set var = "numResults" scope="page" value = "${result.rowCount}"/>

    <%
        Object o = pageContext.getAttribute( "numResults" );
        /* Above line not used. */
        Integer obj = new Integer( 1 );
        int i = obj.intValue();

        if ( pageContext.getAttribute( "numResults" ).equals( obj ) )
        {
          String usernameID = new String( "username" );
          String usernameVAL =
             new String( request.getParameter( "username" ) );
          session.setAttribute(
            "username", usernameVAL );
    %>
		  <jsp:forward page="index.jsp" />
		 
    <%
        }
        else
        {
          out.println( "<h3>Login failed, please try again:</h3>" );
        }
      }
    %>

    <form action="login(c).jsp" method="POST">
      Customer Number: <input type="text" name="username">
      <br />
      Password: <input type="password" name="password" />
      <br />
      <input type="submit" value="Login" />
    </form>
	


      </div>
      <jsp:include page="footer.jsp" />
    </div>
  </body>
</html>
