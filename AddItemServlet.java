package com.sims;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddItemServlet extends HttpServlet {
    private final ItemDAO itemDAO = new ItemDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String quantityStr = request.getParameter("quantity");
        String thresholdStr = request.getParameter("threshold");

        if (name == null || quantityStr == null || thresholdStr == null ||
            name.trim().isEmpty() || quantityStr.trim().isEmpty() || thresholdStr.trim().isEmpty()) {
            response.sendRedirect("error.jsp?msg=Missing+input+data");
            return;
        }

        try {
            int quantity = Integer.parseInt(quantityStr.trim());
            int threshold = Integer.parseInt(thresholdStr.trim());

            if (quantity < 0 || threshold < 0) {
                response.sendRedirect("error.jsp?msg=Quantity+and+threshold+must+be+non-negative");
                return;
            }

            itemDAO.addItem(name.trim(), quantity, threshold);
            response.sendRedirect(request.getContextPath() + "/inventory.jsp");

        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp?msg=Invalid+input+format");
        } catch (Exception e) {
            response.sendRedirect("error.jsp?msg=Database+error");
        }
    }
}
