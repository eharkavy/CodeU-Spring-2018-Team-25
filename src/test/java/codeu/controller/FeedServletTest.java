
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

import codeu.model.store.basic.ActivityStore;
import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;

public class FeedServletTest {

  private FeedServlet feedServlet;
  private HttpServletRequest mockRequest;
  private HttpSession mockSession;
  private HttpServletResponse mockResponse;
  private RequestDispatcher mockRequestDispatcher;
  private ActivityStore mockActivityStore;
  private List<String> dates;
  private List<String> events;

  @Before
  public void setup() {
    feedServlet = new FeedServlet();

    mockRequest = Mockito.mock(HttpServletRequest.class);
    mockSession = Mockito.mock(HttpSession.class);
    mockActivityStore = Mockito.mock(ActivityStore.class);
    Mockito.when(mockRequest.getSession()).thenReturn(mockSession);
    feedServlet.setActivityStore(mockActivityStore);

    mockResponse = Mockito.mock(HttpServletResponse.class);
    mockRequestDispatcher = Mockito.mock(RequestDispatcher.class);
    Mockito.when(mockRequest.getRequestDispatcher("/WEB-INF/view/feed.jsp"))
        .thenReturn(mockRequestDispatcher);
    dates = new ArrayList<>();
	events = new ArrayList<>();
    Mockito.when(mockActivityStore.getAllDates()).thenReturn(dates);
    Mockito.when(mockActivityStore.getAllEvents()).thenReturn(events);    
  }

  @Test
  public void testDoGet() throws IOException, ServletException {
    feedServlet.doGet(mockRequest, mockResponse);

    Mockito.verify(mockSession).setAttribute("dates", dates);
    Mockito.verify(mockSession).setAttribute("events", events);
    Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
  }
}