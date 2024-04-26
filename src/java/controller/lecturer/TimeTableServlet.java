/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecturer;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.LessionDBContext;
import dal.TimeSlotDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.*;
import model.Account;
import model.Lession;
import model.TimeSlot;
import util.DateTimeHelper;
import controller.authentication.authorization.BaseRBACController;
import model.Role;

/**
 *
 * @author VietAnh
 */
public class TimeTableServlet extends BaseRBACController{
   
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processGet(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> roles)
    throws ServletException, IOException {
        int leid = Integer.parseInt(request.getParameter("id"));
        TimeSlotDBContext timeDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = timeDB.list();
        
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        
        Date from = null;
        Date to = null;
        
        java.util.Date today = new java.util.Date();
        if(raw_from ==null)
        {
           from = DateTimeHelper.convertUtilToSql(DateTimeHelper.getBeginningOfWeek(today));
        }
        else
        {
           from = Date.valueOf(raw_from);
        }
        
        if(raw_to == null)
        {
           java.util.Date beginWeek = DateTimeHelper.getBeginningOfWeek(today);
           to= DateTimeHelper.convertUtilToSql(DateTimeHelper.addDaysToDate(beginWeek, 6));
        }
        else
        {
            to = Date.valueOf(raw_to);
        }
        
        LessionDBContext leDB = new LessionDBContext();
        ArrayList<Lession> lessionBy = leDB.getLessionBy(leid, from, to);
        
        
        request.setAttribute("dates", DateTimeHelper.toList(from, to));
        request.setAttribute("lessionBy", lessionBy);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("slots", slots);
        
        request.getRequestDispatcher("../view/lecturer/timetable.jsp").forward(request, response);
        
        
    } 


    
    protected void processPost(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> roles)
    throws ServletException, IOException {
    }


    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>







}
