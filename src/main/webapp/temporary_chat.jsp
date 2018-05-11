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
<!DOCTYPE html>
<html>
<head>
  <%@ include file = "HeaderForBootstrap.html" %>
</head>
<body class="hold-transition sidebar-mini">
  <%@ include file = "bodyforbootstrap.jsp" %>
  <!-- Content Wrapper. Contains page content-->
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
    <!-- /.content-header -->
       <div class="content">
          <div class="container-fluid">
                  <div class="card text-white bg-dark mb-3 w-75">
                      <div class="card-body">
                        <%
                          Conversation conversation = (Conversation) request.getAttribute("conversation");
                          List<Message> messages = (List<Message>) request.getAttribute("messages");
                        %>
                        <h5 class="card-title"><%= conversation.getTitle() %></h5>
                        <p class="card-text">    
                            <%  for (Message message : messages) {
                              String author = UserStore.getInstance()
                              .getUser(message.getAuthorId()).getName();
                            %>
                            <li><strong><a href="/profile/<%= author %>"><%= author %>:</a></strong> <%= message.getContent() %></li>
                            <%
                            }
                            %>
                            </ul>
                            </div>
                            <hr/>
                            <% if (request.getSession().getAttribute("user") != null) { %>
                            <form action="/chat/<%= conversation.getTitle() %>" method="POST">
                            <input type="text" name="message">
                            <br/>
                            <button type="submit">Send</button>
                            </form>
                            <% } else { %>
                            <p><a href="/login">Login</a> to send a message.</p>
                            <% } %>
                            <hr/>
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
<%@ include file = "FooterForBootsrap.html" %>
</body>
</html>

 

