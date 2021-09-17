/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanvlb.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vanvlb.daos.VehicleDAO;
import vanvlb.dtos.CartDTO;

/**
 *
 * @author Mon
 */
@WebServlet(name = "UpdateCartServlet", urlPatterns = {"/UpdateCartServlet"})
public class UpdateCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = "Controller?btnAction=View Cart";
        try {
            String productID = request.getParameter("txtID");
            HttpSession session = request.getSession(false);
            HttpSession foundErr = request.getSession();
            boolean error = false;
            VehicleDAO dao = new VehicleDAO();
            if (session != null) {
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                if (cart != null) {
                    String quantity = request.getParameter("txtQuantity");
                    if (!quantity.trim().isEmpty() || quantity.trim() == null) {
                        error = true;
                    }
                    try {
                        if (quantity.trim().isEmpty()) {
                            foundErr.setAttribute("ERROR_INPUT", "quantity is required");
                        } else if (Integer.parseInt(quantity) < 0) {
                            foundErr.setAttribute("ERROR_INPUT", "quantity must be > 0");
                        } else if (dao.getQuantity(productID) - Integer.valueOf(quantity) >= 0) {
                            cart.getItems().get(productID).setQuantity(Integer.valueOf(quantity));
                            session.setAttribute("CART", cart);
                            foundErr.removeAttribute("ERROR_INPUT");
                        } else if (Integer.parseInt(quantity) > cart.getItems().get(productID).getQuantity()) {
                            foundErr.setAttribute("ERROR_INPUT", "quantity must <= quantity available in stock:(" + dao.getQuantity(productID) + ")");
                        }
                    } catch (NumberFormatException e) {
                        error = true;
                        foundErr.setAttribute("ERROR_INPUT", "Quantity must be positive number, not String");
                    }
                }
            }

        } catch (NamingException ex) {
            log("Update_NamingException:" + ex.getMessage());
        } catch (SQLException ex) {
            log("Update_NamingException:" + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            log("Update_ClassNotFoundException:" + ex.getMessage());
        } finally {
            response.sendRedirect(url);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
