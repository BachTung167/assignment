/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.authentication;

import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author VietAnh
 */
public class LoginController extends HttpServlet {
   
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        
        AccountDBContext db = new AccountDBContext();
        Account account = db.getAccount(username, password);
        if(account != null)
        {
            HttpSession session = request.getSession();
            
            //implement remember me!
            Cookie c_username = new Cookie("username", username);
            // Dòng này tạo một đối tượng Cookie mới với tên là "username" và giá trị là username, tức là giá trị của biến username được chuyển vào cookie.
            c_username.setMaxAge(3600*24*7);
            //Điều này đặt tuổi thọ của cookie là 7 ngày (3600 giây * 24 giờ * 7 ngày). Điều này có nghĩa là cookie "username" sẽ tồn tại trong 7 ngày kể từ khi nó được gửi từ máy chủ đến trình duyệt của người dùng
            
            
            Cookie c_password = new Cookie("password", password);
            c_password.setMaxAge(3600*24*7);
            
            response.addCookie(c_username);
            response.addCookie(c_password);
            
            
            session.setAttribute("account", account);
            
            
            //response.getWriter().println("login successful! welcome " + account.getDisplayname());
            response.sendRedirect("view/authentication/home.jsp");

        }
        else
        {
            HttpSession session = request.getSession();
            session.setAttribute("account", null);
            response.getWriter().println("login failed!");
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
