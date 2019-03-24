/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PresentationLayer;

import FunctionLayer.LogicFacade;
import FunctionLayer.LoginSampleException;
import FunctionLayer.Order;
import FunctionLayer.User;
import java.util.List;
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
        String origin = (String) request.getParameter("origin");
        String view = "";
        switch (origin) {
            case "create": {
                view = createOrder(request);
                break;
            }
            case "ship": {
                view = shipOrder(request);
                break;
            }
        }
        return view;
    }

    private String createOrder(HttpServletRequest request) throws LoginSampleException, NumberFormatException {
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

    private String shipOrder(HttpServletRequest request) throws LoginSampleException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String reqUserId = request.getParameter("idUser");
        String reqId = request.getParameter("id");
        int id = Integer.parseInt(reqId);
        int idUser = Integer.parseInt(reqUserId);
        List<Order> orders = LogicFacade.getOrders(idUser);
        for (Order o : orders) {
            if (o.getId() == id) {
                LogicFacade.shipOrder(o);
            }
        }
        return user.getRole() + "page";
    }
}
