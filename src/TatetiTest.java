import org.junit.Test;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

public class TatetiTest {

    @Test
    public void shouldSetAndKeepPosition() {
        Tateti tateti = new Tateti();

        tateti.set(2, 2, 'X');

        assertThat(tateti.getAt(2, 2), is('X'));
    }
}
