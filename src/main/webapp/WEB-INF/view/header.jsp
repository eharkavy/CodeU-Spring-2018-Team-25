<!DOCTYPE html>
<a id="navTitle" href="/">CodeU Chat App: Team Optimized Primes</a>
<a href="/conversations">Conversations</a>
<% if(request.getSession().getAttribute("user") != null){ %>
  <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
<% } else{ %>
  <a href="/login">Login</a>
  <a href="/register">Register</a>
<% } %>
<% if(request.getSession().getAttribute("user") != null) {%>
	<% if(request.getSession().getAttribute("user").equals("admin")){ %>
  	<a href="/testdata">Load test data</a>
	<% } %>
<% } %>