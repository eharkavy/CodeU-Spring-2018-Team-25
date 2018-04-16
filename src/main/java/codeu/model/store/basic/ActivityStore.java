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

package codeu.model.store.basic;

import codeu.model.data.User;
import codeu.model.data.Conversation;
import codeu.model.data.Message;
import java.time.Instant;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;


/**
 * Store class that uses in-memory data structures to hold values. 
 * It's a singleton so all servlet classes can access the same instance.
 */
public class ActivityStore {

  /** Singleton instance of ActivityStore. */
  private static ActivityStore instance;

  /**
   * Returns the singleton instance of ActivityStore that should be shared between all servlet
   * classes. Do not call this function from a test; use getTestInstance() instead.
   */
  public static ActivityStore getInstance() {
    if (instance == null) {
      instance = new ActivityStore();
    }
    return instance;
  }

  /**
   * Instance getter function used for testing.
   *
   */
  public static ActivityStore getTestInstance() {
    return new ActivityStore();
  }

  /** The in-memory list of dates and events. */
  private List<String> dates;
  private List<String> events;

  /** This class is a singleton, so its constructor is private. Call getInstance() instead. */
  private ActivityStore() {
    dates = new ArrayList<>();
    events = new ArrayList<>();
  }

  /** Access the current set of dates known to the application. */
  public List<String> getAllDates() {
    return dates;
  }
  
  /** Access the current set of events known to the application. */
  public List<String> getAllEvents() {
    return events;
  }
  
  /** Converts Instant to string the correct format */
  private String convertInstant(Instant instant){
  	Date myDate = Date.from(instant);
  	SimpleDateFormat formatter = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss z");
	String formattedDate = formatter.format(myDate);
  	return formattedDate;
  }
  
  /** New user. */
  public void add(User user) {
  	dates.add(convertInstant(user.getCreationTime()) + ": ");
  	events.add(user.getName() + " joined!");
  }
  
  /** New Conversation. */
  public void add(Conversation converation) {
  	//TODO
  }
  
  /** New Message. */
  public void add(Message message) {
  	//TODO
  }
  
  /** Returns the number of dates. **/
  public int getNumDates(){
  	return dates.size();
  }
  
  /** Returns the number of events. **/
  public int getNumEvents(){
  	return events.size();
  }
}
