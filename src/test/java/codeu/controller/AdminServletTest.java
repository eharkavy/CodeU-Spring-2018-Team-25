// Copyright 2017 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package codeu.controller;

import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.MessageStore;
import codeu.model.store.basic.UserStore;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

public class AdminServletTest {

  private AdminServlet adminServlet;
  private HttpServletRequest mockRequest;
  private HttpSession mockSession;
  private HttpServletResponse mockResponse;
  private RequestDispatcher mockRequestDispatcher;
  private ConversationStore mockConversationStore;
  private MessageStore mockMessageStore;
  private UserStore mockUserStore;

  @Before
  public void setup() {
    adminServlet = new AdminServlet();

    mockRequest = Mockito.mock(HttpServletRequest.class);
    mockSession = Mockito.mock(HttpSession.class);
    Mockito.when(mockRequest.getSession()).thenReturn(mockSession);

    mockResponse = Mockito.mock(HttpServletResponse.class);
    mockRequestDispatcher = Mockito.mock(RequestDispatcher.class);
    Mockito.when(mockRequest.getRequestDispatcher("/admin.jsp"))
        .thenReturn(mockRequestDispatcher);

    mockConversationStore = Mockito.mock(ConversationStore.class);
    adminServlet.setConversationStore(mockConversationStore);

    mockMessageStore = Mockito.mock(MessageStore.class);
    adminServlet.setMessageStore(mockMessageStore);

    mockUserStore = Mockito.mock(UserStore.class);
    adminServlet.setUserStore(mockUserStore);
  }

  @Test
  public void testDoGet_ExistingUsers() throws IOException, ServletException {
  	Mockito.when(mockConversationStore.getNumConversations()).thenReturn(10);
  	Mockito.when(mockUserStore.getNumUsers()).thenReturn(5);
  	Mockito.when(mockMessageStore.getNumMessages()).thenReturn(20);
  	Mockito.when(mockMessageStore.getMostActive()).thenReturn("username1");
  	Mockito.when(mockUserStore.getNewest()).thenReturn("username2");
  	
    adminServlet.doGet(mockRequest, mockResponse);

    Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
    Mockito.verify(mockSession).setAttribute("numConversations", 10);
    Mockito.verify(mockSession).setAttribute("numUsers", 5);
    Mockito.verify(mockSession).setAttribute("numMessages", 20);
    Mockito.verify(mockSession).setAttribute("mostActive", "username1");
    Mockito.verify(mockSession).setAttribute("newestUser", "username2");
  }
  
  @Test
  public void testDoGet_NoUsers() throws IOException, ServletException {
  	Mockito.when(mockConversationStore.getNumConversations()).thenReturn(0);
  	Mockito.when(mockUserStore.getNumUsers()).thenReturn(1);
  	Mockito.when(mockMessageStore.getNumMessages()).thenReturn(0);
  	Mockito.when(mockMessageStore.getMostActive()).thenReturn(null);
  	Mockito.when(mockUserStore.getNewest()).thenReturn(null);
  	
    adminServlet.doGet(mockRequest, mockResponse);

    Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
    Mockito.verify(mockSession).setAttribute("numConversations", 0);
    Mockito.verify(mockSession).setAttribute("numUsers", 1);
    Mockito.verify(mockSession).setAttribute("numMessages", 0);
    Mockito.verify(mockSession).setAttribute("mostActive", "No Messages");
    Mockito.verify(mockSession).setAttribute("newestUser", "No Users");
  }
  
  @Test
  public void testDoPost_Confirm() throws IOException, ServletException {
    Mockito.when(mockRequest.getParameter("confirm")).thenReturn("confirm");

    adminServlet.doPost(mockRequest, mockResponse);

    Mockito.verify(mockUserStore).loadTestData();
    Mockito.verify(mockConversationStore).loadTestData();
    Mockito.verify(mockMessageStore).loadTestData();
    Mockito.verify(mockResponse).sendRedirect("/");
  }

  @Test
  public void testDoPost_Cancel() throws IOException, ServletException {
    Mockito.when(mockRequest.getParameter("confirm")).thenReturn(null);
    Mockito.when(mockRequest.getParameter("cancel")).thenReturn("cancel");

    adminServlet.doPost(mockRequest, mockResponse);

    Mockito.verify(mockUserStore, Mockito.never()).loadTestData();
    Mockito.verify(mockConversationStore, Mockito.never()).loadTestData();
    Mockito.verify(mockMessageStore, Mockito.never()).loadTestData();
    Mockito.verify(mockResponse).sendRedirect("/");
  }
}
