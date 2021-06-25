<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <head>
        <title>Insert title here</title>
        <style>
          
        </style>
    </head>
    <body>
        <div id="header"><tiles:insertAttribute name="header" /></div>
        <div id="left"><tiles:insertAttribute name="left" /></div>
        <div id="main"><tiles:insertAttribute name="body" /></div>    
        <div id="footer"><tiles:insertAttribute name="footer" /></div>
        
        <!-- Bootstrap core JavaScript-->
    </body>
</html>