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
        <%@ include file = "HeaderForBootstrap.html" %>
    </head>
    <body class = "hold-transition sidebar-mini">
    	<%@ include file = "bodyforbootstrap.jsp" %>
    	 <!-- Content Wrapper. Contains page content-->
  		<div class="content-wrapper">
  		<!--Content Header (Page header) -->
        <div class="content-header">
          <div class= "container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h1 class = "m-0 text-dark">Site Statistics</h1>
              </div> <!-- /.col -->
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="#">Admin</a></li>
                  <li class="breadcrumb-item active">CodeU Chat App</li>
                </ol>
                </div><!-- /.col -->
          </div> <!--/.row -->
          </div> <!--closes container fluid-->
        </div> <!--closes content header -->
        
          
          <div class ="content">
          	<div class="container-fluid">
          	<div class="card text-white bg-dark mb-3 w-75">
            <div class="card-body">
          	<p class = "card-text">Users: <%=request.getSession().getAttribute("numUsers")%></p>
          	<p class = "card-text">Conversations: <%=request.getSession().getAttribute("numConversations")%></p>
          	<p class = "card-text">Messages: <%=request.getSession().getAttribute("numMessages")%></p>
          	<p class = "card-text">Most Active User: <%=request.getSession().getAttribute("mostActive")%></p>
          	<p class = "card-text">Newest User: <%=request.getSession().getAttribute("newestUser")%></p>
          	
        </div> <!-- card body -->
        </div> <!--card text -->
        </div> <!-- container-fluid -->
        
        <div class="content-header">
        <div class= "container-fluid">
        <div class="row mb-2">
        <div class="col-sm-6">
        	 <h2>Load Test Data</h2>
           	 <p>This will load a number of users, conversations, and messages for testing
           	 purposes.</p>
        	<form action="/admin" method="POST">
            	<button type="submit" value="confirm" name="confirm">Confirm</button>
            	<button type="submit" value="cancel" name="cancel">Do Nothing</button>
        	</form>
        </div>
        </div>
        </div>
        <div> 
        
        </div> <!-- content -->
        </div> <!-- /.content-wrapper -->
        <%@ include file = "FooterForBootsrap.html" %>
    </body>     
  <% } %>
<% } %>
<% if(request.getSession().getAttribute("user") == null || !(request.getSession().getAttribute("user").equals("admin"))) {%>
  <head>
      <title>NICE TRY!</title>
      <%@ include file = "HeaderForBootstrap.html" %>
  </head>
  <body class = "hold-transition sidebar-mini">
  <%@ include file = "bodyforbootstrap.jsp" %>
    <div class="content-wrapper">
  		<!--Content Header (Page header) -->
        <div class="content-header">
          <div class= "container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h1 class = "m-0 text-dark">NOT AN ADMIN!!</h1>
              </div>
            </div>
         </div>
     </div>
    </div>
    
    <%@ include file = "FooterForBootsrap.html" %>
  </body>
<% } %>
</html>