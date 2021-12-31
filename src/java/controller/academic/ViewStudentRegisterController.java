/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.academic;

import dao.CampusDAO;
import dao.ParentDAO;
import dao.SpecializedDAO;
import dao.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import obj.Parent;
import obj.Student;

/**
 *
 * @author LucasBV
 */
public class ViewStudentRegisterController extends HttpServlet {

    private static final String SUCCESS = "/academic/registerInfo.jsp";
    private static final String ERROR = "/public/error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();

            int id = Integer.parseInt(request.getParameter("studentID"));

            StudentDAO sDao = new StudentDAO();
            Student student = sDao.getStudentByID(id);
            session.setAttribute("STUDENT", student);

            CampusDAO campusDao = new CampusDAO();
            int campusID = student.getCampusID();
            String campusName = campusDao.getCampusName(campusID);
            session.setAttribute("CAMPUS_NAME", campusName);

            SpecializedDAO speDao = new SpecializedDAO();
            int speID = student.getSpecializedID();
            String speCode = speDao.getSpecializedCode(speID);
            session.setAttribute("SPECIALIZED_CODE", speCode);

            String nameFPT = sDao.getNameFPT(id);
            session.setAttribute("NAME_FPT", nameFPT);

            ParentDAO parentDao = new ParentDAO();
            Parent parent = parentDao.getParent(id);
            session.setAttribute("PARENT", parent);

            url = SUCCESS;
        } catch (Exception e) {
            log("Error at ViewStudentRegisterController " + e.toString());
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
