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
  <link rel="stylesheet" href="/css/main.css">
  <style>
    #chat {
      background-color: white;
      height: 500px;
      overflow-y: scroll
    }
  </style>

  <script>
    // scroll the chat div to the bottom
    function scrollFeed() {
      var feedDiv = document.getElementById('feed');
      feedDiv.scrollTop = feedDiv.scrollHeight;
    };
  </script>
</head>
<body onload="scrollFeed()">

  <nav>
    <%@ include file = "header.jsp" %>
  </nav>

  <div id="container">

    <h1>Activity
      <a href="" style="float: right">&#8635;</a></h1>
    <p>Here's everything that's happened on the site so far!</p>

    <hr/>

    <div id="chat">
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

      
    </div>

    <hr/>

    <hr/>

  </div>
</body>
</html>
