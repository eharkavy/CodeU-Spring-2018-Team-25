<%--
  Copyright 2017 Google Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<!DOCTYPE html>
<html>
<% if(request.getSession().getAttribute("user") != null) {%>
	<% if(request.getSession().getAttribute("user").equals("admin")){ %>
		<head>
  		  <title>Admin</title>
  	 	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		</head>
		<body>

  		  <nav>
    		<%@ include file = "header.jsp" %>
  		  </nav>
  		  <div id="container">
  		  	<h1>Site Statistics</h1>
  		  	<p>Users: <%=request.getSession().getAttribute("numUsers")%></p>
  		  	<p>Conversations: <%=request.getSession().getAttribute("numConversations")%></p>
  		  	<p>Messages: <%=request.getSession().getAttribute("numMessages")%></p>
  		  	<p>Most Active User: <%=request.getSession().getAttribute("mostActive")%></p>
  		  	<p>Newest User: <%=request.getSession().getAttribute("newestUser")%></p>
    	    <h2>Load Test Data</h2>
            <p>This will load a number of users, conversations, and messages for testing
        		purposes.</p>
    		<form action="/admin" method="POST">
      		  <button type="submit" value="confirm" name="confirm">Confirm</button>
      		  <button type="submit" value="cancel" name="cancel">Do Nothing</button>
    		</form>
  		  </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
		</body>  		
	<% } %>
<% } %>
<% if(request.getSession().getAttribute("user") == null || !(request.getSession().getAttribute("user").equals("admin"))) {%>
 	<head>
  	  <title>NICE TRY!</title>
  	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	</head>
	<body>
	  <a id="navTitle" href="/"> NOT AN ADMIN!! </a>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	</body>
<% } %>
</html>
