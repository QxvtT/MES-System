<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
<script type="text/javascript">
	$(document).ready( function () {
	    $('#codeList').DataTable({
	        ajax: {
	        	url: 'ajax/EgovCcmCmmnCodeAll',
	        	dataSrc: 'codes'
	        },
	        columns: [
	        	{data: 'codeId'},
	        	{data: 'codeIdNm'},
	        	{data: 'codeIdDc'},
	        	{data: 'clCodeNm'}
	        ]
	    });
	} );
</script>
</head>
<body>
<h3>공통코드 리스트</h3>
<table id="codeList">
	<thead>
	<tr>
		<th>코드ID</th>
		<th>코드ID명</th>
		<th>코드ID설명</th>
		<th>분류코드명</th>
	</tr>
	</thead>
	<tbody>
	
	</tbody>
</table>
</body>
</html>