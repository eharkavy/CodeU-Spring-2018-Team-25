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
  <!-- <script>
    // scroll the chat div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('chat');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    }; onload="scrollChat()""
  </script> -->
</head>
<!-- Construct the box with style you want. Here we are using box-danger -->
      <!-- Then add the class direct-chat and choose the direct-chat-* contexual class -->
      <!-- The contextual class should match the box, so we are using direct-chat-danger -->
<body class="hold-transition sidebar-mini">
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
              <li class="breadcrumb-item"><a href="#">Chattt</a></li>
              <li class="breadcrumb-item active">CodeU Chat App</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
      <div class="box box-danger direct-chat direct-chat-danger">
        <div class="box-header with-border">
          <h3 class="box-title"><%= conversation.getTitle() %></h3>
          <div class="box-tools pull-right">
            <span data-toggle="tooltip" title="3 New Messages" class="badge bg-red">3</span>
            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
          </div>
        </div><!-- /.box-header -->
        <div class="box-body">
          <!-- Conversations are loaded here -->
          <div class="direct-chat-messages">
            <%
                    for (Message message : messages) {
                    String author = UserStore.getInstance()
                    .getUser(message.getAuthorId()).getName();
              %>
            <!-- Message. Default to the left -->
            <div class="direct-chat-msg">
              <% if(request.getSession().getAttribute("user") == author){ %>
                <div class="direct-chat-info clearfix">
                  <!-- get your name -->
                  <span class="direct-chat-name pull-left"><strong><a href="/profile/<%= author %>"><%= author %></a></strong></span>
                </div><!-- /.direct-chat-info -->
                <div class="direct-chat-text">
                  <!-- Message content -->
                  <%= message.getContent() %>
                </div><!-- /.direct-chat-text -->
              </div><!-- /.direct-chat-msg -->
            <% } else{ %>
            <!-- Message to the right -->
              <div class="direct-chat-msg right">
                <div class="direct-chat-info clearfix">
                  <span class="direct-chat-name pull-right"><strong><a href="/profile/<%= author %>"><%= author %></a></strong></span>
                </div> <!-- /.direct-chat-info -->
                <div class="direct-chat-text">
                   <%= message.getContent() %>
                </div><!-- /.direct-chat-text -->
              </div><!-- /.direct-chat-msg -->
            </div>
            <% } %>
          </div><!--/.direct-chat-messages-->
        </div>
      </div>
      <%@ include file = "FooterForBootsrap.html" %>
</body>
</html>




 <!-- <script>
    // scroll the chat div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('chat');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    }; onload="scrollChat()""
  </script> -->
<!--  <%
                            <%= conversation.getTitle() %>
                              for (Message message : messages) {
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
                          </p> -->
