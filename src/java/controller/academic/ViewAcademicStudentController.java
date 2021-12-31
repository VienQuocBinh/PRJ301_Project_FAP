/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.academic;

import dao.AcademicStudentDAO;
import dao.CampusDAO;
import dao.ParentDAO;
import dao.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import obj.AcademicStudent;
import obj.Parent;
import obj.Student;

/**
 *
 * @author LucasBV
 */
public class ViewAcademicStudentController extends HttpServlet {

    private static final String SUCCESS = "/academic/academicInfo.jsp";
    private static final String ERROR = "/public/error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            StudentDAO studentDao = new StudentDAO();
            Student student = studentDao.getStudentByID(studentID);
            session.setAttribute("STUDENT", student);

            AcademicStudentDAO acaStuDao = new AcademicStudentDAO();
            AcademicStudent acaStudent = acaStuDao.getAcademicStudentByID(studentID);
            session.setAttribute("ACADEMIC_STUDENT", acaStudent);

            CampusDAO campusDao = new CampusDAO();
            String campusName = campusDao.getCampusName(student.getCampusID());
            session.setAttribute("CAMPUS_NAME", campusName);
            
            ParentDAO parentDao = new ParentDAO();
            Parent parent= parentDao.getParent(studentID);
            session.setAttribute("PARENT", parent);

            url = SUCCESS;
        } catch (Exception e) {
            log("Error at ViewAcademicStudentController " + e.toString());
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
