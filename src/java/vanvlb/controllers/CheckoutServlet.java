/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanvlb.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vanvlb.daos.VehicleDAO;
import vanvlb.dtos.CartDTO;
import vanvlb.dtos.VehicleDTO;

/**
 *
 * @author Mon
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/CheckoutServlet"})
public class CheckoutServlet extends HttpServlet {
    private static final String SUCCESS ="shopping.jsp";

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
        HttpSession foundErr = request.getSession();
        try {
            String total = request.getParameter("txtTotal");
            String userID = request.getParameter("userID");
            String date = java.time.LocalDateTime.now().toString();
            HttpSession session = request.getSession(false);
            if (session != null) {
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                if (cart != null) {
                    VehicleDAO dao = new VehicleDAO();
                    boolean rs = dao.insertOrder(userID, date, Float.valueOf(total));
                    boolean flag = false;
                    if (rs) {
                        int orderID = dao.getOrderID();
                        if (orderID != -1) {
                            //System.out.println(orderID);
                            for (Map.Entry<String, VehicleDTO> entry : cart.getItems().entrySet()) {
                                flag = dao.insertOrderDetail(orderID, entry.getKey(), entry.getValue().getPrice(), entry.getValue().getQuantity());
                            }
                            if (flag) {
                                session.removeAttribute("CART");
                                foundErr.removeAttribute("ERROR_CHECKOUT");
                                url = SUCCESS;
                            }
                        }
                    }
                }
            }
        } catch (NamingException ex) {
            log("Checkout_NamingException:" + ex.getMessage());
        } catch (SQLException ex) {
            foundErr.setAttribute("ERROR_CHECKOUT", "Checkout fail, please try again!");
            log("Checkout_SQLException:" + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            foundErr.setAttribute("ERROR_CHECKOUT", "Checkout fail, please try again!");
            log("Checkout_ClassNotFoundException:" + ex.getMessage());
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
