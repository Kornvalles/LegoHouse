package FunctionLayer;

import DataLayer.OrderMapper;
import DataLayer.UserMapper;
import java.sql.SQLException;
import java.util.List;

/**
 * The purpose of LogicFacade is to...
 * @author kasper
 */
public class LogicFacade {

    public static User login( String email, String password ) throws LoginSampleException {
        return UserMapper.login( email, password );
    } 

    public static User createUser( String email, String password ) throws LoginSampleException {
        User user = new User(email, password, "customer");
        UserMapper.createUser( user );
        return user;
    }
    
    public static Order createOrder(int id, int length, int width, int height ) throws SQLException {
        Order order = new Order(id, length, width, height);
        OrderMapper.createOrder( order );
        return order;
    }

    public static List<Order> getOrders( int id ) throws SQLException {
        return OrderMapper.getOrders(id);
    }
    
}
