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
            <h1 class="m-0 text-dark">Conversations</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Conversations</a></li>
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
                        <p class="card-text">  
                          <% if(request.getAttribute("error") != null){ %>
                              <h2 style="color:red"><%= request.getAttribute("error") %></h2>
                          <% } %>

                          <% if(request.getSession().getAttribute("user") != null){ %>
                            <h1>New Conversation</h1>
                            <form action="/conversations" method="POST">
                                <div class="form-group">
                                  <label class="form-control-label">Title:</label>
                                <input type="text" name="conversationTitle">
                              </div>

                              <button type="submit">Create</button>
                            </form>

                            <hr/>
                          <% } %>

                          <h1>Conversations</h1>

                          <%
                          List<Conversation> conversations =
                            (List<Conversation>) request.getAttribute("conversations");
                          if(conversations == null || conversations.isEmpty()){
                          %>
                            <p>Create a conversation to get started.</p>
                          <%
                          }
                          else{
                          %>
                            <ul class="mdl-list">
                          <%
                            for(Conversation conversation : conversations){
                          %>
                            <li><a href="/chat?title=<%= conversation.getTitle() %>">
                              <%= conversation.getTitle() %></a></li>
                          <%
                            }
                          %>
                            </ul>
                          <%
                          }
                          %>
                          <hr/>
                        </p>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  </div>
<%@ include file = "FooterForBootsrap.html" %>
</body>
</html>


  
