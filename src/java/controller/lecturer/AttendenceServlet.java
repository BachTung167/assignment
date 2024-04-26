/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.AttendenceDBContext;
import dal.LessionDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Attendence;
import model.Lession;
import model.Student;
import controller.authentication.authorization.BaseRBACController;
import model.Role;


/**
 *
 * @author VietAnh
 */
public class AttendenceServlet extends BaseRBACController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> roles)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        AttendenceDBContext attDB = new AttendenceDBContext();
        ArrayList<Attendence> attendenceByLession = attDB.getAttendenceByLession(id);
        request.setAttribute("attendenceByLession", attendenceByLession);
        request.getRequestDispatcher("../view/lecturer/attendence.jsp").forward(request, response);
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> roles)
            throws ServletException, IOException {
        int leid = Integer.parseInt(request.getParameter("id"));
        String raw_presen = request.getParameter("present");

        StudentDBContext stuDB = new StudentDBContext();
        ArrayList<Student> studentByLessionID = stuDB.getStudentByLessionID(leid);
        Lession lession = new Lession();
        lession.setId(leid);
        ArrayList<Attendence> atts = new ArrayList<>();
        for (Student stu : studentByLessionID) {
            Attendence att = new Attendence();
            att.setStudent(stu);
            att.setLession(lession);
            att.setDescription(request.getParameter("description" + stu.getId()));
            att.setPresent("yes".equals(request.getParameter("present" + stu.getId())));
            atts.add(att);
        }
        AttendenceDBContext attDB = new AttendenceDBContext();
        attDB.takeAttendance(leid, atts);
        response.sendRedirect("attendence?id=" + leid);
        
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
