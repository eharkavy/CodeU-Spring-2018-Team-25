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

package codeu.model.data;

import java.time.Instant;
import java.util.UUID;
import org.mindrot.jbcrypt.*;

/** Class representing a registered user. */
public class User {
  private final UUID id;
  private final String name;
  private final String hashedpassword;
  private final Instant creation;
  private final boolean admin;
  private String about;

  /**shed
   * Constructs a new User.
   *
   * @param id the ID of this User
   * @param name the username of this User
   * @param password the password of this User
   * @param creation the creation time of this User
   * @param admin whether or not this account has admin priviliges
   * @param about the aboutme information of the user
   */
  public User(UUID id, String name, String hashedpassword, Instant creation, boolean admin, String about) {
    this.id = id;
    this.name = name;
    this.hashedpassword = hashedpassword;
    this.creation = creation;
    this.admin = admin;
    this.about = about;
  }

  /** Returns the ID of this User. */
  public UUID getId() {
    return id;
  }

  /** Returns the about me of this User. */
  public String getAbout() {
    return about;
  }

  /** Returns the username of this User. */
  public String getName() {
    return name;
  }
  
  /**Updates the about of this User. */
  
  public void setAbout(String about){
  	this.about = about;
  }
  
	

  /** Returns the password of this User */
 public String getPassword() {
 	return hashedpassword;
 }

  /** Returns the creation time of this User. */
  public Instant getCreationTime() {
    return creation;
  }

  /** Returns whether or not this account has admin priviliges **/
  public boolean getAdmin() {
  	return admin;
  }
}
