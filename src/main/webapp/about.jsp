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
  <title>CodeU Chat App</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/about.jsp">About</a>
  </nav>

  <div id="container">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>Meet the Team</h1>
      <p>
        We are the awesome team of leet programmers brought together by Google known 		as ...Optimized Primes. We all come from different parts of the East Coast 		and are in the process of developing the greatest chat app ever.
      </p>

      <ul>
        <li><strong>Elizabeth Harkavy:</strong> I am a sophomore at MIT. I'm majoring 		in Computer Science and Physics. I rewrte gravity so that it pulls customers 		to our app.</li>
        <li><strong>Gabrielle Blom:</strong> I am a sophomore at Emory. I'm majoring 		in Computer Science and Polical Science. I lobby to the federal government 		for our app to be taught in elementary schools.</li>
        <li><strong>James Garcia-Otero:</strong> I am a sophomore at the University 		of Virginia. I major in Computer Engineering and Electrical Engineering. I 		build the machines we run on.</li>
        <li><strong>Jiachen Jiang:</strong> I am a sophomore at Dartmouth. I'm 		majoring in Computer Science and minoring in Human-Centered Design. I create 		new humans in the lab to test our app on.</li>
      </ul>

    </div>
  </div>
</body>
</html>
