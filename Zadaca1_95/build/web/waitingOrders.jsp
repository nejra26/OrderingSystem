<%-- 
    Document   : waitingOrders
    Created on : Nov 14, 2021, 6:39:59 PM
    Author     : ajnaa
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Waiting Orders</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
        
        <style>
            
            @import url('https://fonts.googleapis.com/css?family=Assistant');

body {
    background: #dee9ff;
    font-family: Assistant, sans-serif;
    font-color: red;
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
                           
                                <th>Username</th>
                                <th>Products</th>
                                <th> Total </th>
                                <th>Approve/Reject</th>
                            </tr>
                        </thead>
                        <tbody class="table-body">
                        <c:forEach items="${waitingOrders}" var="item" >
                            <tr class="cell-1">
                               
                            
                                
                                <td>${item.getUsername()}</td>
                                <td>${item.getProducts()}</td>
                                <td>$ ${item.getTotal()}</td>
                                <td>
                                    <form action="ApproveOrder" method="POST">
                                        <input style="display: none;" id="id" name="id" value="${item.getId()}">
                                        <button type="submit" class="btn btn-success">Approve</button>
                                    </form>
                                        
                                        <form action="RejectOrder" method="POST">
                                        <input style="display: none" id="id" name="id" value="${item.getId()}">
                                        <button type="submit" class="btn btn-danger">Reject</button>
                                    </form>
                                    
                                </td>

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
