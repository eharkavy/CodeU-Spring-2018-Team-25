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
<head>
  <%@ include file = "HeaderForBootstrap.html" %>
</head>
<body class="hold-transition sidebar-mini">
  <%@ include file = "bodyforbootstrap.html" %>
  <!-- Content Wrapper. Contains page content-->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Login</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Login</a></li>
              <li class="breadcrumb-item active">CodeU Chat App</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
       <div class="content">
          <div class="container-fluid">
            <div class="card border-dark mb-3 w-75">
                    <div class="card-body">
                    <% if(request.getAttribute("error") != null){ %>
                    <h2 style="color:red"><%= request.getAttribute("error") %></h2>
                    <% } %>
                    <% if(request.getSession().getAttribute("user") == null) {%>
                    <form action="/login" method="POST">
                    <label for="username">Username: </label>
                    <input type="text" name="username" id="username">
                    <br/>
                    <label for="password">Password: </label>
                    <input type="password" name="password" id="password">
                    <br/><br/>
                    <button type="submit" value="login" name="login">Login</button>
                    </form>
                    <% } else {%>
                    <form action="/login" method="POST">
                    <button type="submit" value="logout" name="logout">Logout</button>
                    </form>
                    <% } %>
                  </div>
                </div>
              </div>
<%@ include file = "FooterForBootsrap.html" %>
</body>
</html>