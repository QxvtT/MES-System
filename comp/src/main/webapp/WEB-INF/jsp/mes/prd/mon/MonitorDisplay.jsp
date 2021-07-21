<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap/css/bootstrap.min.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css">
<script>
	$(function() {
		function getToday() {
			var date = new Date();
			var year = date.getFullYear(); //년도
			var month = date.getMonth() + 1; //월
			if ((month + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
				month = "0" + month;
			}
			var day = date.getDate(); //일
			if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
				day = "0" + day;
			}
			var getToday = year + "-" + month + "-" + day;
			$('#today').text(getToday);
		}
		getToday();

		function getTime() {
			var d = new Date(); // 현재 시간
			var hur = d.getHours(); // 시
			var min = d.getMinutes(); //분
			var sec = d.getSeconds(); //초
			var timeBoard = document.getElementById("currentTime"); // 값이 입력될 공간
			var time = hur + "시 " + min + "분 " + sec + "초" // 형식 지정
			timeBoard.innerHTML = time; // 출력
			setTimeout(getTime, 1000); //1000밀리초(1초) 마다 반복
		}
		getTime();
		
		function getProcess(){  
		      setTimeout('location.reload()',10000); 
		}
		getProcess();
	});
</script>
<style>
body {
	background-color: #DCDCDC;
}

table {
	font-weight: bold;
	border-color: black;
}

th {
	font-size: 40px;
}

td {
	font-size: 40px;
	color: white;
}

ul {
	list-style: none;
	margin: 0px;
}
</style>
</head>
<body>
	<div>
		<table border="1" style="width: 100%; text-align: center;">
			<tr style="background-color: #0764DB">
				<td colspan="3" align="left"><span
					style="margin-left: 20px; font-size: 50px;">진행 공정 작업실적 현황</span></td>
				<td colspan="4" align="left">
					<ul style="font-size: 25px;">
						<li>작업일자 <span id="today"
							style="padding-left: 20px; color: #FFD700;"></span></li>
						<li>현재시간 <span id="currentTime"
							style="padding-left: 20px; color: #FFD700;"></span></li>
					</ul>
				</td>
			</tr>
			<tr>
				<th colspan="7" style="background-color: #94D902">1라인</th>
			</tr>
			<tr style="background-color: #94D902">
				<th>설 비 명</th>
				<th>공 정 명</th>
				<th style="width: 25%;">제 품 명</th>
				<th>금일계획</th>
				<th>현재실적</th>
				<th>현재불량</th>
				<th>실적율</th>
			</tr>
			<tr>
				<td style="background-color: #334269">분할설비</td>
				<c:choose>
					<c:when test="${!empty list }">
						<td style="background-color: #334269"></td>
						<th colspan="5">대기중</th>
					</c:when>
					<c:otherwise>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td style="background-color: #334269">압축설비</td>
				<c:choose>
					<c:when test="${empty list }">
						<td style="background-color: #334269"></td>
						<th colspan="5">대기중</th>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="list">
							<td style="background-color: #334269">${list.prcName }</td>
							<th>${list.itmName }</th>
							<th>${list.prcComDVol }${list.prcUnit }</th>
							<th>${list.prcResVol }${list.prcUnit }</th>
							<th style="color: red;">${list.prcErrVol }${list.prcUnit }</th>
							<th style="color: blue;"><fmt:parseNumber var="result"
									integerOnly="true"
									value="${list.prcResVol / (list.prcComDVol - list.prcErrVol) * 100}" />
								${result }%</th>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td style="background-color: #334269">열처리설비</td>
				<c:choose>
					<c:when test="${!empty list }">
						<td style="background-color: #334269"></td>
						<th colspan="5">대기중</th>
					</c:when>
					<c:otherwise>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td style="background-color: #334269">도금설비</td>
				<c:choose>
					<c:when test="${!empty list }">
						<td style="background-color: #334269"></td>
						<th colspan="5">대기중</th>
					</c:when>
					<c:otherwise>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td style="background-color: #334269">포장설비</td>
				<c:choose>
					<c:when test="${!empty list }">
						<td style="background-color: #334269"></td>
						<th colspan="5">대기중</th>
					</c:when>
					<c:otherwise>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th colspan="7" style="background-color: #94D902">2라인</th>
			</tr>
			<tr style="background-color: #94D902">
				<th>설 비 명</th>
				<th>공 정 명</th>
				<th style="width: 25%;">제 품 명</th>
				<th>금일계획</th>
				<th>현재실적</th>
				<th>현재불량</th>
				<th>실적율</th>
			</tr>
			<tr>
				<td style="background-color: #334269">분할설비</td>
				<c:choose>
					<c:when test="${!empty list }">
						<td style="background-color: #334269"></td>
						<th colspan="5">대기중</th>
					</c:when>
					<c:otherwise>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td style="background-color: #334269">압축설비</td>
				<c:choose>
					<c:when test="${!empty list }">
						<td style="background-color: #334269"></td>
						<th colspan="5">대기중</th>
					</c:when>
					<c:otherwise>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td style="background-color: #334269">열처리설비</td>
				<c:choose>
					<c:when test="${!empty list }">
						<td style="background-color: #334269"></td>
						<th colspan="5">대기중</th>
					</c:when>
					<c:otherwise>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td style="background-color: #334269">도금설비</td>
				<c:choose>
					<c:when test="${!empty list }">
						<td style="background-color: #334269"></td>
						<th colspan="5">대기중</th>
					</c:when>
					<c:otherwise>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td style="background-color: #334269">포장설비</td>
				<c:choose>
					<c:when test="${!empty list }">
						<td style="background-color: #334269"></td>
						<th colspan="5">대기중</th>
					</c:when>
					<c:otherwise>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
	</div>
</body>
</html>