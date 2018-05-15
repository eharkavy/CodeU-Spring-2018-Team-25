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
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%
Conversation conversation = (Conversation) request.getAttribute("conversation");
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>

<!DOCTYPE html>
<html>
<head>
    <%@ include file = "HeaderForBootstrap.html" %>
  <script>
    // scroll the chat div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('chat');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    };
  </script>
</head>
<body class="hold-transition sidebar-mini" onload="scrollChat()">
  <%@ include file = "bodyforbootstrap.jsp" %>
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Chat</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Chat</a></li>
              <li class="breadcrumb-item active">CodeU Chat App</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>

  <div class="content">
      <div class="container-fluid">
        <div class="card card-danger direct-chat direct-chat-danger mb-3 h-75 w-100 ">
        <div class="card-header with-border">
          <h3 class="card-title"><%= conversation.getTitle() %></h3>
        </div><!-- /.box-header -->
        <div class="card-body">
          <!-- Conversations are loaded here -->
          <div id = "chat" class="direct-chat-messages">
            <%
                    for (Message message : messages) {
                    String author = UserStore.getInstance()
                    .getUser(message.getAuthorId()).getName();
              %>
            <!-- Message. Default to the left -->
              <% if(request.getSession().getAttribute("user") == author){ %>
              <div class="direct-chat-msg left">
                <div class="direct-chat-info clearfix">
                  <!-- get your name -->
                  <span class="direct-chat-name pull-left"><strong><a href="/profile/<%= author %>"><%= author %></a></strong></span>
                </div><!-- /.direct-chat-info -->
                <div class="direct-chat-text">
                  <!-- Message content -->
                  <%= message.getContent() %>
                </div><!-- /.direct-chat-text -->
              </div><!-- /.direct-chat-msg -->
            <% } else { %>
            <!-- Message to the right -->
              <div class="direct-chat-msg right">
                <div class="direct-chat-info clearfix">
                  <span class="direct-chat-name pull-right"><strong><a href="/profile/<%= author %>"><%= author %></a></strong></span>
                </div> <!-- /.direct-chat-info -->
                <div class="direct-chat-text">
                   <%= message.getContent() %>
                </div><!-- /.direct-chat-text -->
              </div><!-- /.direct-chat-msg -->
            <% } %>
            <% } %>  
        </div><!-- /.direct-chat-pane -->
        </div><!-- /.box-body -->
        <div class="card-footer">
                <% if (request.getSession().getAttribute("user") != null) { %>
                        <form action="/chat?title=<%= conversation.getTitle() %>" method="POST">
                        <div class="input-group">
                        <input type="text" name="message" placeholder="Type Message ..." class="form-control">
                        <span class="input-group-btn">
                          <button type="submit" class="btn btn-danger btn-flat">Send</button>
                        </span>
                      </div>
                      </form>
                    <% } else { %>
                      <p><a href="/login">Login</a> to send a message.</p>
                    <% } %>  
        </div>
            </div>
          </div>
          </div><!--/.direct-chat -->
      </div>
  <%@ include file = "FooterForBootsrap.html" %>
</body>
</html>



