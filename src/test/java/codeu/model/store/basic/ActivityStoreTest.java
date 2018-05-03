package codeu.model.store.basic;

import codeu.model.data.User;
import java.time.Instant;
import java.util.UUID;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mindrot.jbcrypt.*;


public class ActivityStoreTest {

  private ActivityStore activityStore;
  private final User USER_ONE =
      new User(UUID.randomUUID(), "test_username_one", BCrypt.hashpw("password", BCrypt.gensalt()), Instant.ofEpochMilli(1000), false, "to be edited");

  @Before
  public void setup() {
    activityStore = ActivityStore.getTestInstance();

  }

  @Test
  public void addNewUser() {
    activityStore.add(USER_ONE);

    Assert.assertEquals(activityStore.getAllDates().get(0), "Wed, 31 Dec 1969 19:00:01 EST: ");
    Assert.assertEquals(activityStore.getAllEvents().get(0), "test_username_one joined!");
    Assert.assertEquals(activityStore.getNumDates(), 1);
    Assert.assertEquals(activityStore.getNumEvents(), 1);
  }

}
