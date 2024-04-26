/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.authentication.authorization.BaseRBACController;
import dal.AssessmentDBContext;
import dal.GradeDBContext;
import dal.SubjectDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Assessment;
import model.Grade;
import model.Role;
import model.Subject;

/**
 *
 * @author VietAnh
 */
public class GradeServlet extends BaseRBACController {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sid = request.getParameter("sid");
        String raw_subid = request.getParameter("subid");

        
        SubjectDBContext subDB = new SubjectDBContext();
        ArrayList<Subject> subjects = subDB.getSubjects();
        
        GradeDBContext gDB = new GradeDBContext();
        if (raw_subid != null && !raw_subid.isEmpty()) {
            int subid = Integer.parseInt(raw_subid);
            ArrayList<Grade> listSubjectBySid = gDB.getListSubjectBySid(sid, subid);
            request.setAttribute("listSubjectBySid", listSubjectBySid);
            
            float average = gDB.getAverage(sid, subid);
            request.setAttribute("average", average);
        }
        
        

        request.setAttribute("sid", sid);
        request.setAttribute("subjects", subjects);
        request.getRequestDispatcher("grade.jsp").forward(request, response);
    }

    protected void processGet(HttpServletRequest request, HttpServletResponse response,  Account account, ArrayList<Role> roles)
            throws ServletException, IOException {

        processRequest(request, response);
    }
    // hung test
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processPost(HttpServletRequest request, HttpServletResponse response,  Account account, ArrayList<Role> roles)
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
