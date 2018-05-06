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
<<<<<<< HEAD
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
=======
  <link rel="stylesheet" href="/css/main.css" type="text/css">
>>>>>>> f2290f42c9b8296c0234754605d57655f110401b

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
<<<<<<< HEAD
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
=======

>>>>>>> f2290f42c9b8296c0234754605d57655f110401b
</body>
</html>
