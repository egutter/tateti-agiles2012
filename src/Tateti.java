
public class Tateti {

    private char[][] juego;

    public Tateti() {
        juego = new char[3][3];
    }

    public void set(int x, int y, char type) {
        if (x < 0 || y < 0 || x >= 3 || y >= 3 ) throw new IllegalTatetiPositionException();

        juego[x][y] = type;
    }

    public char getAt(int x, int y) {
        return juego[x][y];
    }

    public void set(Coordinate coordinate, char type) {
        set(coordinate.getX(), coordinate.getY(), type);
    }

    public char getAt(Coordinate coordinate) {
        return getAt(coordinate.getX(), coordinate.getY());
    }
}
