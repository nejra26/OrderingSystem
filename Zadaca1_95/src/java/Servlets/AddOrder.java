/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Product;
import Beans.User;
import Utils.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "AddOrder", urlPatterns = {"/AddOrder"})
public class AddOrder extends HttpServlet {

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
            
            List<Product> cartProducts;
              Object cartProductsObject = request.getSession().getAttribute("cartProducts");
          cartProducts = new ArrayList<Product> ();
          
          if(cartProductsObject == null){
    cartProducts = new ArrayList<Product> ();
}else{
    cartProducts = (ArrayList<Product>) cartProductsObject;
}
          
          String products = "";
          
          for(int i=0; i<cartProducts.size()-1; i++){
              products += cartProducts.get(i).getName() + ",";
       }
          
          products += cartProducts.get(cartProducts.size()-1).getName();
            
          double total = 0;
          
           for(int i=0; i<cartProducts.size(); i++){
           total += cartProducts.get(i).getPrice();
       }
           
        Object userObject = request.getSession().getAttribute("user");
        
        User user = (User) userObject;
        
        String query = "INSERT INTO orders (username, total, products, status) VALUES ('"+user.getUsername()+"', '"+ total +"', '"+ products +"', 1)";

           Connection con = null;
            Statement stmt = null;
            String nextAddress = "home.jsp";
            
            try {
                con = DB.getInstance().getConnection();
                stmt = con.createStatement();
                stmt.executeUpdate(query);
                stmt.close();
            } catch (SQLException e) {
                String error = e.getMessage();
                out.println(error);
            }
            
            RequestDispatcher rd = request.getRequestDispatcher(nextAddress);
            rd.forward(request, response);
            
            cartProducts.clear();
            
            
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
