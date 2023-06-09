<%-- 
    Document   : home
    Created on : 12-Nov-2021, 17:24:27
    Author     : ajnaa
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        
          <c:if test="${user.role == 1}">
            <jsp:include page="adminHome.jsp"></jsp:include>
                          </c:if>
    <c:if test="${user.role == 2}">
       <jsp:include page="customerHome.jsp"></jsp:include>
        
      </c:if>
    
    
      <c:if test="${user.role == 3}">
       <jsp:include page="guestHome.jsp"></jsp:include>
      </c:if>
        
    </body>
</html>