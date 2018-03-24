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
  	 	  <link rel="stylesheet" href="/css/main.css">
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
		</body>  		
	<% } %>
<% } %>
<% if(request.getSession().getAttribute("user") == null || !(request.getSession().getAttribute("user").equals("admin"))) {%>
 	<head>
  	  <title>NICE TRY!</title>
  	  <link rel="stylesheet" href="/css/main.css">
	</head>
	<body>
	  <a id="navTitle" href="/"> NOT AN ADMIN!! </a>
	</body>
<% } %>
</html>
