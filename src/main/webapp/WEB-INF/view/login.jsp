<!DOCTYPE html>
<html>
<head>
 <title>Login</title>
 <link rel="stylesheet" href="/css/main.css">
 <style>
   label {
     display: inline-block;
     width: 100px;
   }
 </style>
</head>
<body>

 <nav>
  <%@ include file = "header.jsp" %>
 </nav>

 <div id="container">
   <h1>Login</h1>

   <% if(request.getAttribute("error") != null){ %>
       <h2 style="color:red"><%= request.getAttribute("error") %></h2>
   <% } %>
   <% if(request.getSession().getAttribute("user") == null) {%>
   	   <form action="/login" method="POST">
     	<label for="username">Username: </label>
     	<input type="text" name="username" id="username">
     	<br/>
     	<label for="password">Password: </label>
     	<input type="password" name="password" id="password">
     	<br/><br/>
     	<button type="submit" value="login" name="login">Login</button>
   	   </form>
   <% } else {%>
   	   <form action="/login" method="POST">
     	<button type="submit" value="logout" name="logout">Logout</button>
   	   </form>
   <% } %>
 </div>
</body>
</html>
