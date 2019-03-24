package DataLayer;

import FunctionLayer.LoginSampleException;
import FunctionLayer.Order;
import FunctionLayer.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mikkel
 */
public class OrderMapper {
    
    public static void createOrder( Order order ) throws LoginSampleException {
        try {
            Connection con = Connector.connection();
            String SQL = "INSERT INTO Orders (idusers, length, width, height) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement( SQL, Statement.RETURN_GENERATED_KEYS );
            ps.setInt( 1, order.getIdUser() );
            ps.setInt( 2, order.getLength() );
            ps.setInt( 3, order.getWidth()  );
            ps.setInt( 4, order.getHeight() );
            ps.executeUpdate();
        } catch ( SQLException | ClassNotFoundException ex ) {
            throw new LoginSampleException( ex.getMessage() );
        }
    }
    
    public static List<Order> getOrders( int id ) throws LoginSampleException    {
        List<Order> orders = new ArrayList<>();
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT * FROM Orders WHERE idusers=?";
            PreparedStatement ps = con.prepareStatement( SQL );
            ps.setInt( 1, id );
            ResultSet rs = ps.executeQuery();
            while ( rs.next() ) {
                int length = rs.getInt( "length" );
                int width = rs.getInt( "width" );
                int heigth = rs.getInt( "height" );
                Order order = new Order(id, length, width, heigth);
                orders.add(order);
            }
        } catch ( SQLException | ClassNotFoundException ex ) {
            throw new LoginSampleException( ex.getMessage() );
        }
        return orders;
    }
    
    public static boolean shipOrder( Order order ) throws LoginSampleException {
        try {
            Connection con = Connector.connection();
            String SQL = "UPDATE `LegoHouse`.`orders` SET `isSent` = '1' WHERE (`id` = '?')";
            PreparedStatement ps = con.prepareStatement( SQL );
            ps.setInt( 1, order.getId() );
            ps.executeQuery();
        } catch ( SQLException | ClassNotFoundException ex ) {
            throw new LoginSampleException( ex.getMessage() );
        }
        return order.isShipped();
    }
    
}
