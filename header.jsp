      <div class="header">
	<%
	if(session.getAttribute("username")!=null)
	{
	%>
		<h1>Now logged in as: <%= session.getAttribute( "username" ) %></h1>
		<%
	}
	%>

      </div>
	  
