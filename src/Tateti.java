
public class Tateti {

    private char[][] juego;

    public Tateti() {
        juego = new char[3][3];
    }

    public void set(Coordinate coordinate, char type) {
        int x = coordinate.getX();
        int y = coordinate.getY();
        if (x < 0 || y < 0 || x >= 3 || y >= 3 ) throw new IllegalTatetiPositionException();

        juego[x][y] = type;
    }

    public char getAt(Coordinate coordinate) {
        return juego[coordinate.getX()][coordinate.getY()];
    }

    public void set(Coordinate coordinate, Type type) {
        set(coordinate, type.getType());
    }
}
