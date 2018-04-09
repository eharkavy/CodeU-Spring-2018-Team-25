package codeu.model.store.basic;

import codeu.model.data.User;
import java.util.HashSet;
import codeu.model.store.persistence.PersistentStorageAgent;
import codeu.model.store.persistence.PersistentDataStoreException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.mindrot.jbcrypt.*;

public class UserStoreTest {

  private UserStore userStore;
  private PersistentStorageAgent mockPersistentStorageAgent;

  private final User USER_ONE =
      new User(UUID.randomUUID(), "test_username_one", BCrypt.hashpw("password", BCrypt.gensalt()), Instant.ofEpochMilli(1000), false);
  private final User USER_TWO =
      new User(UUID.randomUUID(), "test_username_two", BCrypt.hashpw("password", BCrypt.gensalt()), Instant.ofEpochMilli(2000), false);
  private final User USER_THREE =
      new User(UUID.randomUUID(), "test_username_three", BCrypt.hashpw("password", BCrypt.gensalt()), Instant.ofEpochMilli(3000), false);

  @Before
  public void setup() {
    mockPersistentStorageAgent = Mockito.mock(PersistentStorageAgent.class);
    userStore = UserStore.getTestInstance(mockPersistentStorageAgent);
    try {
		Mockito.when(mockPersistentStorageAgent.retrieveUserByUsername("test_username_one")).thenReturn(USER_ONE);
		Mockito.when(mockPersistentStorageAgent.retrieveUserByUsername("test_username_two")).thenReturn(USER_TWO);
		Mockito.when(mockPersistentStorageAgent.retrieveUserByUsername("test_username_three")).thenReturn(USER_THREE);
    } catch (PersistentDataStoreException e) {
	    System.err.println("Server didn't start correctly. An error occurred during Datastore load!");
    	System.err.println("This is usually caused by loading data that's in an invalid format.");
    	System.err.println("Check the stack trace to see exactly what went wrong.");
    }
	userStore.addUser(USER_ONE);
	userStore.addUser(USER_TWO);
	userStore.addUser(USER_THREE);
	
    final HashSet<String> userList = new HashSet<String>();
    userList.add(USER_ONE.getName());
    userList.add(USER_TWO.getName());
    userList.add(USER_THREE.getName());
    userStore.setUsers(userList);
  }

  @Test
  public void testGetUser_byUsername_found() {
    User resultUser = userStore.getUser(USER_ONE.getName());
    assertEquals(USER_ONE, resultUser);
  }

  @Test
  public void testGetUser_byId_found() {
    User resultUser = userStore.getUser(USER_ONE.getId());
    assertEquals(USER_ONE, resultUser);
  }

  @Test
  public void testGetUser_byUsername_notFound() {
    User resultUser = userStore.getUser("fake username");

    Assert.assertNull(resultUser);
  }

  @Test
  public void testGetUser_byId_notFound() {
    User resultUser = userStore.getUser(UUID.randomUUID());

    Assert.assertNull(resultUser);
  }

  @Test
  public void testAddUser() {
    User inputUser = new User(UUID.randomUUID(), "test_username", "password four", Instant.now(), false);

    userStore.addUser(inputUser);
    try {
	    Mockito.when(mockPersistentStorageAgent.retrieveUserByUsername("test_username")).thenReturn(inputUser);
    } catch (PersistentDataStoreException e) {
	    System.err.println("Server didn't start correctly. An error occurred during Datastore load!");
    	System.err.println("This is usually caused by loading data that's in an invalid format.");
    	System.err.println("Check the stack trace to see exactly what went wrong.");
    }
    User resultUser = userStore.getUser("test_username");
    
    assertEquals(inputUser, resultUser);
    Mockito.verify(mockPersistentStorageAgent).writeThrough(inputUser);
  }

  @Test
  public void testIsUserRegistered_true() {
    Assert.assertTrue(userStore.isUserRegistered(USER_ONE.getName()));
  }

  @Test
  public void testIsUserRegistered_false() {
    Assert.assertFalse(userStore.isUserRegistered("fake username"));
  }

  private void assertEquals(User expectedUser, User actualUser) {
    Assert.assertEquals(expectedUser.getId(), actualUser.getId());
    Assert.assertEquals(expectedUser.getName(), actualUser.getName());
    Assert.assertEquals(expectedUser.getPassword(), actualUser.getPassword());
    Assert.assertEquals(expectedUser.getCreationTime(), actualUser.getCreationTime());
    Assert.assertEquals(expectedUser.getAdmin(), actualUser.getAdmin());
  }
}
