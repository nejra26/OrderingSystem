<%-- 
    Document   : cart
    Created on : Nov 13, 2021, 7:29:27 PM
    Author     : ajnaa
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Beans.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>All Customer Orders</title>
        
        
        <style>
            
@import url('https://fonts.googleapis.com/css?family=Assistant');

body {
    background: #dee9ff;
    font-family: Assistant, sans-serif
}

.cell-1 {
    border-collapse: separate;
    border-spacing: 0 4em;
    background: #fff;
    border-bottom: 5px solid transparent;
    background-clip: padding-box
}

thead {
    background: #dddcdc
}


            
        </style>
    </head>
    <body>
        
        <jsp:include page="navbar.jsp"></jsp:include>
       
             
               <div class="container mt-5">
    <div class="d-flex justify-content-center row">
        <div class="col-md-10">
            <div class="rounded">
                <div class="table-responsive table-borderless">
                    <table class="table">
                        <thead>
                            <tr>
                           
                                <th>Status</th>
                                <th>Products</th>
                                <th> Total </th>
                            </tr>
                        </thead>
                        <tbody class="table-body">
                        <c:forEach items="${orderList}" var="item" >
                            <tr class="cell-1">
                               
                                <c:if test="${item.getStatus() == 1}">
                                    <td style="color: grey;">WAITING</td>
                                </c:if>
                                    
                                  <c:if test="${item.getStatus() == 2}">
                                      <td style="color: green;">APPROVED</td>
                                </c:if>
                                    
                                <c:if test="${item.getStatus() == 3}">
                              <td style="color: red;">REJECT</td>
                          </c:if>
                                
                                
                                <td>${item.getProducts()}</td>
                                <td>$ ${item.getTotal()}</td>

                            </tr>
                          </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
  
        
    </body>
</html>
