<%-- 
    Document   : registration
    Created on : 12-Nov-2021, 17:24:13
    Author     : amar_
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reviews Orders</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
  
        <style>
            body{
                background-color: #dee9ff;
            }

            .registration-form{
                    padding: 50px 0;
                    text-align: center;
            }
    

            .registration-form form{
                background-color: #dee9ff;
                margin: auto;
 
                border-top-left-radius: 30px;
                border-top-right-radius: 30px;
                border-bottom-left-radius: 30px;
                border-bottom-right-radius: 30px;
            }

 
        </style>
    </head>
    <body>
                    <jsp:include page="navbar.jsp"></jsp:include>

        <div class="registration-form">
            <form action="WaitingOrders" method="POST">
                <div class="form-group">
                    <button style="margin: 10px;" type="submit" class="btn btn-secondary">Waiting orders</button>
                </div>
            </form>
             <form action="OrdersApproved" method="GET">
                <div class="form-group">
                    <button style="margin: 10px;" type="submit" class="btn btn-success">Approved orders</button>
                </div>
                </form>

                  <form action="OrdersReject" method="GET">
                <div class="form-group">
                    <button style="margin: 10px;" type="submit" class="btn btn-danger">Reject orders</button>
                </div>
            </form>
            
        </div>
    </body>
</html>