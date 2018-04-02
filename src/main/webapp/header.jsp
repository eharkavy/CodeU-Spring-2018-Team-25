<!DOCTYPE html>
<a id="navTitle" href="/">CodeU Chat App: Team Optimized Primes</a>
<a href="/conversations">Conversations</a>
<% if(request.getSession().getAttribute("user") != null){ %>
  <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
<% } else{ %>
  <a href="/register">Register</a>
<% } %>
<a href="/login">Login</a>
<a href="/about.jsp">About</a>
<% if(request.getSession().getAttribute("user") != null) {%>
	<% if(request.getSession().getAttribute("user").equals("admin")){ %>
  	<a href="/admin">Admin</a>
	<% } %>
<% } %>