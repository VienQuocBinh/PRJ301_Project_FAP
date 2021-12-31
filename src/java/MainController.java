/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LucasBV
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "/public/error.jsp";
    private static final String RETURN_LOGIN = "/academic/login.jsp";
    private static final String CHOOSE_CAMPUS_CONTROLLER = "ChooseCampusController";
    private static final String REGISTER_CONTROLLER = "RegisterController";
    private static final String LOGIN_CONTROLLER = "AcademicLoginController";
    private static final String SHOW_REGISTER_INFO_CONTROLLER = "ViewStudentRegisterController";
    private static final String ACCEPT_STUDENT_CONTROLLER = "AcceptStudentController";
    private static final String REJECT_STUDENT_CONTROLLER = "RejectStudentController";
    private static final String SHOW_ACADEMIC_INFO_CONTROLLER = "ViewAcademicStudentController";

    @SuppressWarnings("fallthrough")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();

            switch (action) {
                case "ChooseCampus":
                    url = CHOOSE_CAMPUS_CONTROLLER;
                    break;
                case "Register":
                    url = REGISTER_CONTROLLER;
                    break;
                case "ReturnLogin":
                    url = RETURN_LOGIN;
                    break;
                case "Submit":
                    url = LOGIN_CONTROLLER;
                    break;
                case "CheckRegisterInfo":
                    url = SHOW_REGISTER_INFO_CONTROLLER;
                    break;
                case "Accept":
                    url = ACCEPT_STUDENT_CONTROLLER;
                    break;
                case "Reject":
                    url = REJECT_STUDENT_CONTROLLER;
                    break;
                case "CheckInformation":
                    url = SHOW_ACADEMIC_INFO_CONTROLLER;
                    break;
                default:
                    session.setAttribute("ERROR_MESSAGE", "Function is not available");
                    break;
            }
        } catch (Exception e) {
            log("Error at MainController " + e.toString());
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
