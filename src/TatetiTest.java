import org.junit.Test;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

public class TatetiTest {

    @Test
    public void shouldSetAndKeepPositionIfItIsX() {
        Tateti tateti = new Tateti();

        Coordinate coordinate = new Coordinate(2, 2);

        tateti.set(coordinate, 'X');

        assertThat(tateti.getAt(coordinate), is('X'));
    }

    @Test
    public void shouldSetAndKeepPositionIfItIsY() {
        Tateti tateti = new Tateti();

        Coordinate coordinate = new Coordinate(1, 1);

        tateti.set(coordinate, 'O');

        assertThat(tateti.getAt(coordinate), is('O'));
    }

    @Test(expected = IllegalTatetiPositionException.class)
    public void shouldThrowExceptionIfSettingNegativeXPosition() {
        Tateti tateti = new Tateti();

        Coordinate coordinate = new Coordinate(-1, 1);

        tateti.set(coordinate, 'X');
    }

    @Test(expected = IllegalTatetiPositionException.class)
    public void shouldThrowExceptionIfSettingNegativeYPosition() {
        Tateti tateti = new Tateti();

        Coordinate coordinate = new Coordinate(1, -1);

        tateti.set(coordinate, 'O');
    }

    @Test(expected = IllegalTatetiPositionException.class)
    public void shouldThrowExceptionIfSetOutOfBoundXPosition() {
        Tateti tateti = new Tateti();

        Coordinate coordinate = new Coordinate(3, 1);

        tateti.set(coordinate, 'X');
    }

    @Test(expected = IllegalTatetiPositionException.class)
    public void shouldThrowExceptionIfSetOutOfBoundYPosition() {
        Tateti tateti = new Tateti();

        Coordinate coordinate = new Coordinate(1, 3);

        tateti.set(coordinate, 'O');
    }

}
