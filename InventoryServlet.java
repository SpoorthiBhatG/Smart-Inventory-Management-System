package com.sims;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class InventoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get all items from InventoryStorage
            InventoryStorage storage = InventoryStorage.getInstance();
            List<InventoryStorage.Item> items = new ArrayList<>(storage.getAllItems().values());
            request.setAttribute("items", items);
            RequestDispatcher dispatcher = request.getRequestDispatcher("inventory.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=Storage+error");
        }
    }
}
