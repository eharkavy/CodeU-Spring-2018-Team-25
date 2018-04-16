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
import java.util.HashSet;
import java.util.Hashtable;
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

  /** The in-memory HashSet of usernames. */
  private HashSet<String> users;
  
  /** The in-memory HashTable from user IDs to usernames. */
  private Hashtable<UUID, String> mapIdToUsername;

  /** Newest user. */
  private String newestUser = null;
  
  /** Time of creation of newest User */
  private Instant newestUserCreationTime = Instant.MIN;
  
  /** ActivityStore is responsible for recording when new users are added. */
  private ActivityStore activityStore;
  
  /** This class is a singleton, so its constructor is private. Call getInstance() instead. */
  private UserStore(PersistentStorageAgent persistentStorageAgent) {
    this.persistentStorageAgent = persistentStorageAgent;
    users = new HashSet<String>();
    mapIdToUsername = new Hashtable<UUID, String>();
    activityStore = ActivityStore.getInstance();
  }

  /** Load a set of randomly-generated Message objects. */
  public void loadTestData() {
  	List<User> temp = DefaultDataStore.getInstance().getAllUsers();
  	for(User user: temp){
  		mapIdToUsername.put(user.getId(), user.getName());
  		users.add(user.getName());
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
    if(users.contains(username)){
    	try {
			return persistentStorageAgent.retrieveUserByUsername(username);
    	} catch (PersistentDataStoreException e) {
		    System.err.println("Server didn't start correctly. An error occurred during Datastore load!");
      		System.err.println("This is usually caused by loading data that's in an invalid format.");
      		System.err.println("Check the stack trace to see exactly what went wrong.");
    	}
    }
    return null;
  }

  /**
   * Access the User object with the given UUID.
   *
   * @return null if the UUID does not match any existing User.
   */
  public User getUser(UUID id) {
    if(mapIdToUsername.containsKey(id)){
    	return getUser(mapIdToUsername.get(id));
    }
    return null;
  }

  /** Add a new user to the current set of users known to the application. */
  public void addUser(User user) {
  	if(!users.contains(user.getName())){
  		persistentStorageAgent.writeThrough(user);
  	  	users.add(user.getName());
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
    return users.contains(username);
  }

  /**
   * Sets the HashSet of usernames stored by this UserStore. This should only be called once, when the data
   * is loaded from Datastore.
   */
  public void setUsers(HashSet<String> users) {
    this.users = users;
    instantiateHashTable();
  }
  
  /**
   * Uses Hashset of usernames and getUser to instantiate HashTable of UUID to username.
   * 
   */
  public void instantiateHashTable(){
  	for(String username: users){
  		User user = getUser(username);
  		mapIdToUsername.put(user.getId(), username);
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
}