import org.junit.*;
import org.junit.rules.Timeout;
import java.util.concurrent.TimeUnit;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class LocOfMinTest_Strong {

    @Rule
    public Timeout globalTimeout= new Timeout(10, TimeUnit.SECONDS);

  /******************************************************************
   *
   * Test loc_of_min
   *
   *****************************************************************/
  @Test
  public void locOfMinMiddle() {
    Label array1 = wordData(5, 4, 3, 2, 1, 2, 3, 4, 5);
    run("loc_of_min_runner", array1, 9);
    Assert.assertEquals(4, get(v0));
  }
}
