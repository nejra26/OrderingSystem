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

<% double total = 0;
List<Product> cartProducts;
         Object cartProductsObject = request.getSession().getAttribute("cartProducts");
          cartProducts = new ArrayList<Product> ();
          
          if(cartProductsObject == null){
    cartProducts = new ArrayList<Product> ();
}else{
    cartProducts = (ArrayList<Product>) cartProductsObject;
}

       for(int i=0; i<cartProducts.size(); i++){
           total += cartProducts.get(i).getPrice();
       }
                                    %> 


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Cart</title>
        
        
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
                    <form action="AddOrder" method="POST">
                    <table class="table">
                        <thead>
                            <tr>
                           
                                <th>Name</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody class="table-body">
                        <c:forEach items="${cartProducts}" var="item" >
                            <tr class="cell-1">
                               
                                <td>${item.getName()}</td>
                                <td>$ ${item.getPrice()}</td>
                               
                            </tr>
                          </c:forEach>
                            
                            <tr class="cell-1">
                               
                                <td>TOTAL</td>
                                <td><%=total%></td>
                               
                            </tr>
                            
                            
                               
                          
                         
                        </tbody>
                    </table>
                <button class="btn btn-primary">Order </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
  
        
    </body>
</html>
