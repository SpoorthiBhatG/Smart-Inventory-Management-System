package com.sims;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateItemServlet extends HttpServlet {
    private final ItemDAO itemDAO = new ItemDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String idStr = request.getParameter("id");
        String quantityStr = request.getParameter("quantity");

        if (idStr == null || quantityStr == null || idStr.trim().isEmpty() || quantityStr.trim().isEmpty()) {
            response.sendRedirect("error.jsp?msg=Missing+input+data");
            return;
        }

        try {
            int id = Integer.parseInt(idStr.trim());
            int quantity = Integer.parseInt(quantityStr.trim());

            if (id <= 0) {
                response.sendRedirect("error.jsp?msg=ID+must+be+positive");
                return;
            }
            if (quantity < 0) {
                response.sendRedirect("error.jsp?msg=Quantity+must+be+non-negative");
                return;
            }

            itemDAO.updateItemQuantity(id, quantity);
            response.sendRedirect(request.getContextPath() + "/inventory.jsp");

        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp?msg=Invalid+input+format");
        } catch (Exception e) {
            response.sendRedirect("error.jsp?msg=Database+error");
        }
    }
}
