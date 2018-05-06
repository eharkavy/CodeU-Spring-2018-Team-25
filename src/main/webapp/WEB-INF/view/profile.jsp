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
    <link rel="stylesheet" href="/css/main.css" type="text/css">
  </head>
  <body>
    <nav>
    <%@ include file = "header.jsp" %>
    </nav>
    <h1 style= "text-align: center;"><%= user.getName() %>'s Profile Page</h1>
    <h2 style= "text-align: center;"> About User </h2>
        <p style= "text-align: center;"> <%= user.getAbout() %></p>
    <%
        if (current_user != null && current_user.equals(user.getName())) {
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
  </body>
</html>

