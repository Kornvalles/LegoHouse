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
     * @param idUser
     * @param length
     * @param width
     * @param height 
     */
    public Order(int idUser, int length, int width, int height) {
        this.idUser = idUser;
        this.length = length;
        this.width = width;
        this.height = height;
    }
    
    private int idUser; // id on the customer who created the order
    private int length; // length is in dots
    private int width; // width is in dots
    private int height; // height is in blocks
    private boolean shipped;
    
    public int getIdUser() {
        return idUser;
    }

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

    public boolean isShipped() {
        return shipped;
    }

    public void setShipped(boolean isSent) {
        this.shipped = isSent;
    }
    
}
