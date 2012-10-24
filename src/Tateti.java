
public class Tateti {

    private char[][] juego;

    public Tateti() {
        juego = new char[3][3];
    }

    public void set(int x, int y, char type) {
        if (x < 0) throw new IllegalTatetiPositionException();

        juego[x][y] = type;
    }

    public char getAt(int x, int y) {
        return juego[x][y];
    }
}
