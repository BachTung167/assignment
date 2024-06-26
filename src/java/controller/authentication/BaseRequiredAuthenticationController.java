/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.authentication;

import dal.AccountDBContext;
import model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

/**
 *
 * @author sonnt
 */
public abstract class BaseRequiredAuthenticationController extends HttpServlet {
    
    private Account getAuthentication(HttpServletRequest req)
    {
        HttpSession session = req.getSession();// truy xuat doi tuong dc lien ket vơi yeu cau
        Account account = (Account)session.getAttribute("account");
        
        if(account==null)
        {
            Cookie[] cookies = req.getCookies();
            if(cookies!=null)
            {
                String username = null;
                String password = null;
                for (Cookie cooky : cookies) {
                    if(cooky.getName().equals("username"))
                        username = cooky.getValue();
                    
                    if(cooky.getName().equals("password"))
                        password = cooky.getValue();
                    
                    if(username != null && password !=null)
                        break;
                }
                if(username == null || password == null)
                    return null;
                else
                {
                    AccountDBContext db = new AccountDBContext();
                    Account test = db.getAccount(username, password);
                    if(test!=null)
                        session.setAttribute("account", test);
                    return test;
                }
            }
        }
        return account ;
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account account = getAuthentication(request);
        if(account!=null)
        {
            processPost(request, response, account);
        }
        else
        {
            response.getWriter().println("access denied!");
        }
    }
    
    
    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response,Account account) 
            throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    Account account = getAuthentication(req);
        if(account!=null)
        {
            processGet(req, resp, account);
        }
        else
        {
            resp.getWriter().println("access denied!");
        }
    
    }
    
    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response,Account account) 
            throws ServletException, IOException;
    
}
