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
import java.time.Instant;
import codeu.model.store.persistence.PersistentStorageAgent;
import codeu.model.store.persistence.PersistentDataStoreException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;


/**
 * Store class that uses in-memory data structures to hold values and automatically loads from and
 * saves to PersistentStorageAgent. It's a singleton so all servlet classes can access the same
 * instance.
 */
public class UserStore {

  /** Singleton instance of UserStore. */
  private static UserStore instance;


  /**
   * Returns the singleton instance of UserStore that should be shared between all servlet classes.
   * Do not call this function from a test; use getTestInstance() instead.
   */
  public static UserStore getInstance() {
    if (instance == null) {
      instance = new UserStore(PersistentStorageAgent.getInstance());
    }
    return instance;
  }

  /**
   * Instance getter function used for testing. Supply a mock for PersistentStorageAgent.
   *
   * @param persistentStorageAgent a mock used for testing
   */
  public static UserStore getTestInstance(PersistentStorageAgent persistentStorageAgent) {
    return new UserStore(persistentStorageAgent);
  }

  /**
   * The PersistentStorageAgent responsible for loading Users from and saving Users to Datastore.
   */
  private PersistentStorageAgent persistentStorageAgent;

  /** The in-memory HashMap of usernames to User. */
  private HashMap<String, User> users;
  
  /** The in-memory HashMap from user IDs to usernames. */
  private HashMap<UUID, String> mapIdToUsername;

  /** Newest user. */
  private String newestUser = null;
  
  /** Time of creation of newest User */
  private Instant newestUserCreationTime = Instant.MIN;
  
  /** ActivityStore is responsible for recording when new users are added. */
  private ActivityStore activityStore;
  
  /** This class is a singleton, so its constructor is private. Call getInstance() instead. */
  private UserStore(PersistentStorageAgent persistentStorageAgent) {
    this.persistentStorageAgent = persistentStorageAgent;
    users = new HashMap<String, User>();
    mapIdToUsername = new HashMap<UUID, String>();
    activityStore = ActivityStore.getInstance();
  }

  /** Load a set of randomly-generated Message objects. */
  public void loadTestData() {
  	List<User> temp = DefaultDataStore.getInstance().getAllUsers();
  	for(User user: temp){
  		mapIdToUsername.put(user.getId(), user.getName());
  		users.put(user.getName(), user);
  		activityStore.add(user);
  		// Update newestUser
  		if(user.getCreationTime().isAfter(newestUserCreationTime)){
  			newestUser = user.getName();
  			newestUserCreationTime = user.getCreationTime();
  		}
  	}
  }

  /**
   * Access the User object with the given name.
   *
   * @return null if username does not match any existing User.
   */
  public User getUser(String username) {
	User user = users.get(username);
    return user;
  }

  /**
   * Access the User object with the given UUID.
   *
   * @return null if the UUID does not match any existing User.
   */
  public User getUser(UUID id) {
    if(mapIdToUsername.containsKey(id)){
    	return users.get(mapIdToUsername.get(id));
    }
    return null;
  }

  /** Add a new user to the current set of users known to the application. */
  public void addUser(User user) {
  	if(!users.containsKey(user.getName())){
  		persistentStorageAgent.writeThrough(user);
  	  	users.put(user.getName(), user);
  	  	activityStore.add(user);
		mapIdToUsername.put(user.getId(), user.getName());
		// Update newestUser
  		if(user.getCreationTime().isAfter(newestUserCreationTime)){
  			newestUser = user.getName();
  			newestUserCreationTime = user.getCreationTime();
  		}
  	}
  }

  /** Return true if the given username is known to the application. */
  public boolean isUserRegistered(String username) {
    return users.containsKey(username);
  }

  /**
   * Sets the HashMaps stored by this UserStore. This should only be called once, when the data
   * is loaded from Datastore.
   */
  public void setUsers(List<User> users) {
    for(User user : users){
    	this.users.put(user.getName(), user);
    	mapIdToUsername.put(user.getId(), user.getName());
		// Update newestUser
  		if(user.getCreationTime().isAfter(newestUserCreationTime)){
  			newestUser = user.getName();
  			newestUserCreationTime = user.getCreationTime();
  		}
    }
  }
  
  /**
   * Returns the number of users
   */
  public int getNumUsers(){
  	return users.size();
  }
  
  
  /** Access the username of the newest User 
  * 
  * @return null if no users or if admin is the only user
  */
  public String getNewest(){
  	return newestUser;
  }
  
  /**
   * Returns the username of user with given UUID.
   * 
   * @return null if no users with this UUID.
   */
  public String getUsername(UUID id){
  	if(id != null && mapIdToUsername.containsKey(id)){
  		return mapIdToUsername.get(id);
  	}
  	else return null;
  }
}