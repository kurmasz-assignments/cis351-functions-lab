import org.junit.*;
import org.junit.rules.Timeout;
import java.util.concurrent.TimeUnit;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class SelectionSortTest_Strong {

    @Rule
    public Timeout globalTimeout= new Timeout(10, TimeUnit.SECONDS);

  /******************************************************************
   *
   * Test selection_sort
   *
   *****************************************************************/
  @Test
  public void basicSort() {
    Label array1 = wordData(5, 4, 3, 2, 1, 2, 3, 4, 5, -15, 100, 100);
    int[] expected = {1, 2, 2, 3, 3, 4, 4, 5, 5};
    run("selection_sort", array1, 9);
    Assert.assertArrayEquals(expected, getWords(array1, 0, 9));
    Assert.assertTrue(noOtherStaticDataModifications()); 
  }
}
