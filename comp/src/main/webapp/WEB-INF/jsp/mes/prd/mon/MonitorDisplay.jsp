<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css">
<script>
	$(function() {
		function getToday() {
			var date = new Date();
			var year = date.getFullYear(); //년도
			var month = date.getMonth() + 1; //월
			var day = date.getDate(); //일
			if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
				day = "0" + day;
			}
			var getToday = year + "-" + month + "-" + day;
			$('#today').text(getToday);
		}
		getToday();

		function getTime() {
			var d = new Date(); // 현재 날짜와 시간
			var hur = d.getHours(); // 시
			var min = d.getMinutes(); //분
			var sec = d.getSeconds(); //초
			var timeBoard = document.getElementById("currentTime"); // 값이 입력될 공간
			var time = hur + "시 " + min + "분 " + sec + "초" // 형식 지정
			timeBoard.innerHTML = time; // 출력
			setTimeout(getTime, 1000); //1000밀리초(1초) 마다 반복
		}
		getTime();
		
	});
</script>
<style>
ul {
	list-style: none;
}
</style>
</head>
<body>
	<div>${list }</div>
	<div class="table">
		<table class="table-bordered" style="width: 100%; text-align: center;">
			<tr>
				<th colspan="3"><h1>진행 공정 작업실적 현황</h1></th>
				<td colspan="4" align="left">
					<ul>
						<li>작업일자 <span id="today" style="padding-left: 20px;"></span></li>
						<li>현재시간 <span id="currentTime" style="padding-left: 20px;"></span></li>
					</ul>
				</td>
			</tr>
			<tr>
				<th colspan="7">
					<h3>1라인</h3>
				</th>
			</tr>
			<tr>
				<th>설 비 명</th>
				<th>공 정 명</th>
				<th style="width: 25%;">제 품 명</th>
				<th>금일계획</th>
				<th>현재실적</th>
				<th>현재불량</th>
				<th>실적율</th>
			</tr>
			<tr>
				<th>분할설비</th>
				
				<c:choose>
					<c:when test="${empty prcResult }">
						<th>X</th>
						<th colspan="5">대기중</th>
					</c:when>
					<c:otherwise>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>B</th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th>C</th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th colspan="7">
					<h3>2라인</h3>
				</th>
			</tr>
			<tr>
				<th>설 비 명</th>
				<th>공 정 명</th>
				<th style="width: 25%;">제 품 명</th>
				<th>금일계획</th>
				<th>현재실적</th>
				<th>현재불량</th>
				<th>실적율</th>
			</tr>
		</table>
		<div id="grid2"></div>
	</div>
</body>
</html>