import org.junit.Before;
import org.junit.Test;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

public class TatetiTest {
    private Tateti tateti;

    @Before
    public void setUp() {
        tateti = new Tateti();
    }
    @Test
    public void shouldSetAndKeepPositionIfItIsX() {
        Coordinate coordinate = new Coordinate(2, 2);

        tateti.set(coordinate, Type.X);

        assertThat(tateti.getAt(coordinate), is(Type.X));
    }

    @Test
    public void shouldSetAndKeepPositionIfItIsY() {
        Coordinate coordinate = new Coordinate(1, 1);

        tateti.set(coordinate, Type.O);

        assertThat(tateti.getAt(coordinate), is(Type.O));
    }

    @Test(expected = IllegalTatetiPositionException.class)
    public void shouldThrowExceptionIfSettingNegativeXPosition() {
        Coordinate coordinate = new Coordinate(-1, 1);

        tateti.set(coordinate, Type.X);
    }

    @Test(expected = IllegalTatetiPositionException.class)
    public void shouldThrowExceptionIfSettingNegativeYPosition() {
        Coordinate coordinate = new Coordinate(1, -1);

        tateti.set(coordinate, Type.O);
    }

    @Test(expected = IllegalTatetiPositionException.class)
    public void shouldThrowExceptionIfSetOutOfBoundXPosition() {
        Coordinate coordinate = new Coordinate(3, 1);

        tateti.set(coordinate, Type.X);
    }

    @Test(expected = IllegalTatetiPositionException.class)
    public void shouldThrowExceptionIfSetOutOfBoundYPosition() {
        Coordinate coordinate = new Coordinate(1, 3);

        tateti.set(coordinate, Type.O);
    }
}
