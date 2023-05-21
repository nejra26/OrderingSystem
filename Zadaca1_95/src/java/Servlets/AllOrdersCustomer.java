/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Orders;
import Beans.Product;
import Beans.User;
import Utils.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ajnaa
 */
@WebServlet(name = "AllOrdersCustomer", urlPatterns = {"/AllOrdersCustomer"})
public class AllOrdersCustomer extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
           Object userObject = request.getSession().getAttribute("user");
            User user = (User) userObject;
            
            HttpSession session = request.getSession(true);
                    
            String query = "Select * From orders Where username = '" + user.getUsername() + "'";
            
            String nextAddress = "allOrders.jsp";
            
            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;
            
            List<Orders> orderList = new ArrayList<Orders>();
            
            try 
            {
                con = DB.getInstance().getConnection();
                statement = con.createStatement();
                resultSet = statement.executeQuery(query);
                
                while(resultSet.next())
                {
                    Orders tempOrder = new Orders();
                    
                    tempOrder.setUsername(resultSet.getString("username"));
                    tempOrder.setTotal(resultSet.getDouble("total"));
                    tempOrder.setProducts(resultSet.getString("products"));
                    tempOrder.setStatus(resultSet.getShort("status"));
                    
                    orderList.add(tempOrder);
                }
                
                statement.close();
                session.setAttribute("orderList", orderList);
            } 
            catch (SQLException e) 
            {
                nextAddress = "error.jsp";
                String error = e.getMessage();
                out.println(error);
            }
            
            RequestDispatcher rd = request.getRequestDispatcher(nextAddress);
            rd.forward(request, response);
        
        
        
            
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
