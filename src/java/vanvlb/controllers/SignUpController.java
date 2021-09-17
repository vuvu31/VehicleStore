/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanvlb.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vanvlb.daos.UserDAO;
import vanvlb.dtos.UserDTO;
import vanvlb.dtos.UserErrorDTO;

/**
 *
 * @author Mon
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/SignUpController"})
public class SignUpController extends HttpServlet {

    private static final String ERROR = "signUp.jsp";
    private static final String SUCCESS = "login.html";
    private static final String US = "US";

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
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String role = US;
            String confirm = request.getParameter("confirm");
            boolean check = false;
            UserErrorDTO Err = new UserErrorDTO("", "", "", "", "", "", "");
            if (userID.length() < 3 || userID.length() > 16) {
                check = true;
                Err.setUserIDErr("User ID must be > 3 and < 16 ! ! !");
            }
            if (fullName.length() < 5 || fullName.length() > 64) {
                check = true;
                Err.setFullNameErr("User FullName must be > 5 and < 64 ! ! !");
            }
            if (!phone.matches("\\d{10}")) {
                check = true;
                Err.setPhoneErr("Phone must have 10 numbers");
            }
            if (address.length() < 5 || address.length() > 64) {
                check = true;
                Err.setAddressErr("Address must be must be in [5,64] ! ! !");
            }
            if (password.length() < 8 || password.length() > 16) {
                check = true;
                Err.setPasswordErr("Pasword must be in [8,16] ! ! !");
            }
            if (!confirm.equals(password)) {
                check = true;
                Err.setConfirmErr("WARNING: password not same ! ! !");
            }
            if (check) {
                request.setAttribute("ERROR_USER", Err);
            } else {
                UserDAO dao = new UserDAO();
                boolean checkDuplicate = dao.checkDuplicate(userID);
                if (checkDuplicate) {
                    Err.setUserIDErr("Username:" + userID + " is already existed, try another");
                    request.setAttribute("ERROR_USER", Err);
                } else {
                    UserDTO user = new UserDTO(userID, fullName, phone, address, role, password);
                    dao.insert(user);
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
