<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8" />
	<title>Example 85</title>
	</head>
	<body>
		<a href= "logout.jsp" >
		<img src="button(logout).png" 
			 alt="Logo" />
		</a>
		
		<sql:query var="result">
		select * from inventory_group;
		</sql:query>

	<table border="1" width="100%">
	  <tr>
		<th>Group Code</th>
		<th>Group Name</th>

	  </tr>

	  <c:forEach var = "row" items = "${result.rows}">
		<tr>
		  <td><c:out value = "${row.group_code }"/></td>
		  <td><c:out value = "${row.group_name}"/></td>

		</tr>
	  </c:forEach>
	</table>
	
	</br>

		<sql:query var="result1">
		select * from inventory;
		</sql:query>

	<table border="1" width="100%">
	  <tr>
		<th>Group</th>
		<th>Code</th>
		 <th>Name</th>
		 <th>Author</th>
		 <th>Description</th>
		 <th>Price</th>
		 <th>Stock Location</th>
		 <th>Stock</th>
		 <th>Order</th>
		 <th>Image</th>
	  </tr>

	  <c:forEach var = "row" items = "${result1.rows}">
		<tr>
		  <td><c:out value = "${row.item_group }"/></td>
		  <td><c:out value = "${row.item_code }"/></td>
		  <td><c:out value = "${row.item_name}"/></td>
		  <td><c:out value = "${row.item_author }"/></td>
		  <td><c:out value = "${row.item_description }"/></td>
		  <td><c:out value = "${row.item_price}"/></td>
		  <td><c:out value = "${row.item_stock_location}"/></td>
		  <td><c:out value = "${row.item_stock_count }"/></td>
		  <td><c:out value = "${item_order_count }"/></td>
		  <td><c:out value = "${row.item_image_loc  }"/></td>
		  
		</tr>
	  </c:forEach>
	</table>	
	
	</br>
	
	
		<sql:query var="result2">
		select * from customer;
		</sql:query>

	<table border="1" width="100%">
	  <tr>
		<th>Customer Number</th>
		<th>Surname</th>
		 <th>Initials</th>
		 <th>First Name</th>
		 <th>Title</th>
		 <th>Address1</th>
		 <th>Address2</th>
		 <th>City</th>
		 <th>County</th>
		 <th>Post code</th>
		 <th>Password</th>
		 <th>Passphrase</th>
	  </tr>

	  <c:forEach var = "row" items = "${result2.rows}">
		<tr>
		  <td><c:out value = "${row.customer_number }"/></td>
		  <td><c:out value = "${row.surname }"/></td>
		  <td><c:out value = "${row.initials}"/></td>
		  <td><c:out value = "${row.firstname }"/></td>
		  <td><c:out value = "${row.title }"/></td>
		  <td><c:out value = "${row.address1}"/></td>
		  <td><c:out value = "${row.address2}"/></td>
		  <td><c:out value = "${row.city }"/></td>
		  <td><c:out value = "${row.county }"/></td>
		  <td><c:out value = "${row.postcode  }"/></td>
		  <td><c:out value = "${row.passwd }"/></td>
		  <td><c:out value = "${row.passphrase}"/></td>
		  
		</tr>
	  </c:forEach>
	</table>
	
		</br>

		<sql:query var="result3">
		select * from customer_order;
		</sql:query>

	<table border="1" width="100%">
	  <tr>
		<th>Order Number</th>
		<th>Order Date</th>
		 <th>Delivered</th>
		 <th>Shipping Date</th>

	  </tr>

	  <c:forEach var = "row" items = "${result3.rows}">
		<tr>
		  <td><c:out value = "${row.order_number}"/></td>
		  <td><c:out value = "${row. order_date}"/></td>
		  <td><c:out value = "${row.delivered}"/></td>
		  <td><c:out value = "${row.shipping_date}"/></td>
		  <td><c:out value = "${row.customer_number}"/></td>

		  
		</tr>
	  </c:forEach>
	</table>	
	
			</br>

		<sql:query var="result4">
		select * from order_item;
		</sql:query>

	<table border="1" width="100%">
	  <tr>
		<th>Item Code</th>
		<th>Order Number</th>
		 <th>Quantity</th>


	  </tr>

	  <c:forEach var = "row" items = "${result4.rows}">
		<tr>
		  <td><c:out value = "${row.item_code}"/></td>
		  <td><c:out value = "${row.order_number}"/></td>
		  <td><c:out value = "${row.quantity }"/></td>


		  
		</tr>
	  </c:forEach>
	</table>	
	
				</br>

		<sql:query var="result5">
		select * from manager;
		</sql:query>

	<table border="1" width="100%">
	  <tr>
		<th>Manager number</th>
		<th>Surname</th>
		 <th>Initials</th>
		 <th>First Name</th>
		 <th>Password</th>
		 <th>Passphrase</th>


	  </tr>

	  <c:forEach var = "row" items = "${result5.rows}">
		<tr>
		  <td><c:out value = "${row. manager_number}"/></td>
		  <td><c:out value = "${row.surname}"/></td>
		  <td><c:out value = "${row.initials}"/></td>
		  <td><c:out value = "${row.firstname}"/></td>
		  <td><c:out value = "${row.passwd}"/></td>
		  <td><c:out value = "${row.passphrase}"/></td>


		  
		</tr>
	  </c:forEach>
	</table>	
	
		
				</br>

		<sql:query var="result6">
		select * from review;
		</sql:query>

	<table border="1" width="100%">
	  <tr>
		<th>Review No</th>
		<th>Customer No</th>
		 <th>Item Cdoe</th>
		 <th>Rating</th>



	  </tr>

	  <c:forEach var = "row" items = "${result6.rows}">
		<tr>
		  <td><c:out value = "${row.review_number}"/></td>
		  <td><c:out value = "${row.customer_number}"/></td>
		  <td><c:out value = "${row.item_code}"/></td>
		  <td><c:out value = "${row.rating}"/></td>



		  
		</tr>
	  </c:forEach>
	</table>
	
					</br>

		<sql:query var="result7">
		select * from promotion_code;
		</sql:query>

	<table border="1" width="100%">
	  <tr>
		<th>Cdoe</th>
		<th>Discount</th>




	  </tr>

	  <c:forEach var = "row" items = "${result7.rows}">
		<tr>
		  <td><c:out value = "${row.code}"/></td>
		  <td><c:out value = "${row.discount}"/></td>




		  
		</tr>
	  </c:forEach>
	</table>
	
	</body>
	</html>
