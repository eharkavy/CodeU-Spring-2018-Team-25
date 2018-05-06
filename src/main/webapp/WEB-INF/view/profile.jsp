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
<%@ page import="codeu.model.data.User" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%
User user = (User) request.getAttribute("user");
String about = (String) request.getAttribute("aboutme");
String current_user = (String) request.getSession().getAttribute("user");
%>

<!DOCTYPE html>
<html>
  <head>
    <title><%= user.getName() %></title>
<<<<<<< HEAD
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
=======
    <link rel="stylesheet" href="/css/main.css" type="text/css">
>>>>>>> f2290f42c9b8296c0234754605d57655f110401b
  </head>
  <body>
    <nav>
    <%@ include file = "header.jsp" %>
    </nav>
    <h1 style= "text-align: center;"><%= user.getName() %>'s Profile Page</h1>
    <h2 style= "text-align: center;"> About User </h2>
        <p style= "text-align: center;"> <%= user.getAbout() %></p>
    <%
<<<<<<< HEAD
        if (current_user.equals(user.getName())) {
=======
        if (current_user != null && current_user.equals(user.getName())) {
>>>>>>> f2290f42c9b8296c0234754605d57655f110401b
    %>
      <h3 style= "text-align: center;"> Edit your About Me (only you can see this) </h3>
      
      <form action="/profile/<%= user.getName() %>" method="POST">
        <input type="text" name="aboutme">
        <br/>
        <button type="submit">Edit</button>
      </form>

    <%
        }
        else {
    %>
        Unfortunately, you do not have the authorization to edit this.  Please login or switch ac
    <%
        }
    %>

    <hr style= "text-align: center;">
    <h2 style= "text-align: center;"><%= user.getName() %>'s Sent Messages</h2>
    <form style= "text-align: center;">
      <textarea name="message" style="width:400px; height:400px;">Past Convos Displayed here.</textarea>
      <br>
    </form>
    <hr style= "text-align: center;">
<<<<<<< HEAD
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
=======
>>>>>>> f2290f42c9b8296c0234754605d57655f110401b
  </body>
</html>

