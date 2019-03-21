/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PresentationLayer;

import FunctionLayer.LogicFacade;
import FunctionLayer.LoginSampleException;
import FunctionLayer.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mikkel
 */
public class OrderControl extends Command {

    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {
        
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            String reqHeight = request.getParameter("height");
            String reqWidth = request.getParameter("width");
            String reqLength = request.getParameter("length");
            int height = Integer.parseInt(reqHeight);
            int width = Integer.parseInt(reqWidth);
            int length = Integer.parseInt(reqLength);
            LogicFacade.createOrder(user.getId(), length, width, height);
            return user.getRole() + "page";
            
    }
}
