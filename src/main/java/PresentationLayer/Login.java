package PresentationLayer;

import FunctionLayer.LogicFacade;
import FunctionLayer.LoginSampleException;
import FunctionLayer.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 The purpose of Login is to...

 @author kasper
 */
public class Login extends Command {

    @Override
    String execute( HttpServletRequest request, HttpServletResponse response ) throws LoginSampleException {
        String origin = (String) request.getParameter("origin");
        String view = "";
        switch (origin) {
            case "login": {
                view = login(request);
                break;
            }
            case "logout": {
                view = logout(request);
                break;
            }
        }
        return view;
    }

    private String login(HttpServletRequest request ) throws LoginSampleException {
        String email = request.getParameter( "email" );
        String password = request.getParameter( "password" );
        User user = LogicFacade.login( email, password );
        HttpSession session = request.getSession();
        session.setAttribute( "user", user );
        session.setAttribute( "role", user.getRole() );
        return user.getRole() + "page";
    }
    
    private String logout(HttpServletRequest request ) throws LoginSampleException {
        /* Reset Session */
        request.getSession().invalidate();
        /* Send back to main page */
        return "index";
    }

}
