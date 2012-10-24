
public enum Type {

    X('X'),
    O('O');

    private final char type;

    private Type(char type) {
        this.type = type;
    }

    public char getType() {
        return type;
    }
}
