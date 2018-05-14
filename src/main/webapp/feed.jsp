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
<%@ page import="java.util.List" %>

<%
List<String> dates = (List<String>) request.getSession().getAttribute("dates");
List<String> events = (List<String>) request.getSession().getAttribute("events");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Activity</title>
   <%@ include file = "HeaderForBootstrap.html" %>
  <script>
    // scroll the chat div to the bottom
    function scrollFeed() {
      var feedDiv = document.getElementById('feed');
      feedDiv.scrollTop = feedDiv.scrollHeight;
    };
  </script>
</head>

<!--may need to return deleted content here (body class of hold trnasition sidebar) -->

  <body onload="scrollFeed()">
    <%@ include file = "bodyforbootstrap.jsp" %>
      <div class = "content-wrapper">
        <!--Content Header (Page header) -->
        <div class="content-header">
          <div class= "container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h1 class = "m-0 text-dark">Activity</h1>
              </div> <!-- /.col -->
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="#">Feed</a></li>
                  <li class="breadcrumb-item active">CodeU Chat App</li>
                </ol>
                </div><!-- /.col -->
                <p class = "card-text">Here's everything that's happened on the site so far!</p>
            
          </div> <!--/.row -->
          </div> <!--closes container fluid-->
        </div> <!--closes content header -->
      

    <div class="content"> 
      <div class = "container-fluid">
        <div class="card text-white bg-dark mb-3 w-75">
          <div class= "card-body">
      <ul>
    <%
      if(dates != null)
        for (int i = dates.size()-1; i >= 0; i--) {
    %>
        <li><strong><%= dates.get(i) %></strong> <%= events.get(i) %></li>
    <%
        }
    %>
    <%
      if (dates == null || dates.size() == 0){
    %>
     <li><strong>Ahh. Nothing has happened yet:(</strong></li>
      </ul>
     <%
      }
     %>
          </div> <!-- card-body -->
        </div> <!-- card text-white -->
      </div> <!-- /.container-fluid -->
    </div> <!--closes content-->
      </div> <!--closes content-wrapper-->
  <%@ include file = "FooterForBootsrap.html" %>
</body>
</html>
