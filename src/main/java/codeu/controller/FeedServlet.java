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

import java.io.IOException;
import codeu.model.store.basic.ActivityStore;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/** Servlet class responsible for displaying activity feed. */
public class FeedServlet extends HttpServlet {

  /** Store class that gives access to Events and Dates. */
  private ActivityStore activityStore;

  /** Set up state for handling the Activity Feed display */
  @Override
  public void init() throws ServletException {
    super.init();
    setActivityStore(ActivityStore.getInstance());
  }
  
  /**
   * Sets the ActivityStore used by this servlet. This function provides a common setup method
   * for use by the test framework or the servlet's init() function.
   */
  void setActivityStore(ActivityStore activityStore) {
    this.activityStore = activityStore;
  }
  
  
  //Private variables which hold dates and events to be given to .jsp
  List<String> dates;
  List<String> events;
    
  /**
   * This function fires when a user requests the /feed URL. It sets useful statistics to be displayed and then forwards the request to
   * feed.jsp.
   */
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    HttpSession session = request.getSession();
    dates = activityStore.getAllDates();
    events = activityStore.getAllEvents();
    session.setAttribute("dates", dates);
    session.setAttribute("events", events);
    request.getRequestDispatcher("/WEB-INF/view/feed.jsp").forward(request, response);
  }

}
