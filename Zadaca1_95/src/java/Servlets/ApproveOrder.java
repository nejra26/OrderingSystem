/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Orders;
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
@WebServlet(name = "ApproveOrder", urlPatterns = {"/ApproveOrder"})
public class ApproveOrder extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
           String id = request.getParameter("id");
                               
            String query = "UPDATE orders SET status = 2 WHERE id = '"+id+"'";
            
             Connection con = null;
            Statement stmt = null;
            String nextAddress = "waitingOrders.jsp";
            
            try {
                con = DB.getInstance().getConnection();
                stmt = con.createStatement();
                stmt.executeUpdate(query);
                stmt.close();
            } catch (SQLException e) {
                String error = e.getMessage();
                out.println(error);
            }
            
            HttpSession session = request.getSession(true);
           
            Object waitingOrdersObject = session.getAttribute("waitingOrders");
            List<Orders> waitingOrders;
            
            if(waitingOrdersObject == null){
                waitingOrders = new ArrayList<Orders>();
            }else{
                waitingOrders = ( ArrayList<Orders>) waitingOrdersObject;
            }
            
            int a = 0;
            Integer ordersId=Integer.valueOf(id);  
            for(int i=0; i<waitingOrders.size(); i++){
                if(waitingOrders.get(i).getId() == ordersId){
                    a = i;
                }
            }
            
            waitingOrders.remove(a);
            
            
            
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
