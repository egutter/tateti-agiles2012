
public class Tateti {

    private char[][] juego;

    public Tateti() {
        juego = new char[3][3];
    }

    public Type getAt(Coordinate coordinate) {
        return Enum.valueOf(Type.class, String.valueOf(juego[coordinate.getX()][coordinate.getY()]));
    }

    public void set(Coordinate coordinate, Type type) {
        int x = coordinate.getX();
        int y = coordinate.getY();
        if (x < 0 || y < 0 || x >= 3 || y >= 3 ) throw new IllegalTatetiPositionException();

        juego[x][y] = type.getType();
    }
}
