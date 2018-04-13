<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.lang.*" %>

	<a href="index.jsp">
	<img src="home.png" 
	alt="Logo" />
	</a>

	<%
	if(session.getAttribute("username")==null)
	{
	%>

	<a href = "login(c).jsp">
	<img src="cl.png" 
	alt="Logo" /> 
	</a>	

	<a href = "login(m).jsp">
	<img src="ml.png" 
	alt="Logo" />
	</a>	 
		
	<%
	}
	else
	{	
	%>	

	<a href= "logout.jsp" >
	<img src="logout.png" 
	alt="Logo" />
	</a>
	<%	
	}
	%>
	<a href= "reset.jsp" >
	<img src="reset.png" 
	alt="Logo" />
	</a>	 
	
				<div class= "class">
 <form action="index.jsp" method="GET">
        <input type="text" name="search" value="" />
        <input type="submit" value="Search" />
      </form> 	
		</div>







