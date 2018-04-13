<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.lang.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Manager Log in</title>
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
           NB You must enter a <em>manager number</em> and valid
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
        <jsp:forward page="login(m).jsp" />
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
          "managerNumberString",
          request.getParameter( "username" ) );
        pageContext.setAttribute(
          "managerPasswordString",
          request.getParameter( "password" ) );
    %>

        <sql:query var="result">
          select * from manager where 
            manager_number = "${managerNumberString}" and 
            passwd = MD5("${managerPasswordString}");
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
            usernameID, usernameVAL );
    %>
          <jsp:forward page="data.jsp" />
    <%
        }
        else
        {
          out.println( "<h3>Login failed, please try again:</h3>" );
        }
      }
    %>

    <form action="login(m).jsp" method="POST">
      Manager Number: <input type="text" name="username">
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
