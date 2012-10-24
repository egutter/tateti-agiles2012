import org.junit.Test;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

public class TatetiTest {

    @Test
    public void shouldSetAndKeepPositionIfItIsX() {
        Tateti tateti = new Tateti();

        tateti.set(2, 2, 'X');

        assertThat(tateti.getAt(2, 2), is('X'));
    }

    @Test
    public void shouldSetAndKeepPositionIfItIsY() {
        Tateti tateti = new Tateti();

        tateti.set(1, 1, 'O');

        assertThat(tateti.getAt(1, 1), is('O'));
    }

    @Test(expected = IllegalTatetiPositionException.class)
    public void shouldThrowExceptionIfSettingNegativeXPosition() {
        Tateti tateti = new Tateti();

        tateti.set(-1, 1, 'X');
    }

    @Test(expected = IllegalTatetiPositionException.class)
    public void shouldThrowExceptionIfSettingNegativeYPosition() {
        Tateti tateti = new Tateti();

        tateti.set(1, -1, 'O');
    }

    @Test(expected = IllegalTatetiPositionException.class)
    public void shouldThrowExceptionIfSetOutOfBoundXPosition() {
        Tateti tateti = new Tateti();

        tateti.set(3, 1, 'X');
    }

    @Test(expected = IllegalTatetiPositionException.class)
    public void shouldThrowExceptionIfSetOutOfBoundYPosition() {
        Tateti tateti = new Tateti();

        tateti.set(1, 3, 'O');
    }

}
