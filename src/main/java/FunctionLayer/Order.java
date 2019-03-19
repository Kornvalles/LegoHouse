package FunctionLayer;

/**
 *
 * @author mikkel
 */
public class Order {
    
    /**
     * Ordren skal indeholde længde og bredde af lego husets vægge 
     * (angives i antal “prikker” huset skal være på hver led), 
     * samt hvor mange klodser man ønsker det skal være højt.
     * 
     * @param length
     * @param width
     * @param height 
     */
    public Order(int length, int width, int height) {
        this.length = length;
        this.width = width;
        this.height = height;
    }
    
    private int length; // length is in dots
    private int width; // width is in dots
    private int height; // height is in blocks

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }
    
}
