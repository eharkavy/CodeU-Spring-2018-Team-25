<!DOCTYPE html>
<html>
<head>
 <title>Login</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>
