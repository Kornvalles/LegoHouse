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
    
    public static void createOrder( Order order ) throws SQLException {
        try {
            Connection con = Connector.connection();
            String SQL = "INSERT INTO Orders (idusers, length, width, heigth) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement( SQL, Statement.RETURN_GENERATED_KEYS );
            ps.setInt( 1, order.getIdUser() );
            ps.setInt( 2, order.getLength() );
            ps.setInt( 3, order.getWidth()  );
            ps.setInt( 4, order.getHeight() );
            ps.executeUpdate();
        } catch ( SQLException | ClassNotFoundException ex ) {
            throw new SQLException(ex.getMessage());
        }
    }
    
    public static List<Order> getOrders( User user ) throws SQLException {
        List<Order> orders = new ArrayList<>();
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT * FROM Orders WHERE idusers=?";
            PreparedStatement ps = con.prepareStatement( SQL );
            ps.setInt( 1, user.getId() );
            ResultSet rs = ps.executeQuery();
            while ( rs.next() ) {
                int length = rs.getInt( "length" );
                int width = rs.getInt( "width" );
                int heigth = rs.getInt( "height" );
                Order order = new Order(user.getId(), length, width, heigth);
                orders.add(order);
            }
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new SQLException(ex.getMessage());
        }
        return orders;
    }
    
}
