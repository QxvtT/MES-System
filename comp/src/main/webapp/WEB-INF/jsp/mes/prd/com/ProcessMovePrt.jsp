<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공정이동표 인쇄</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery.min.js "></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery-barcode.js"></script>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-c3ow {
	border-color: inherit;
	text-align: center;
	vertical-align: top
}

.tg .tg-dvpl {
	border-color: inherit;
	text-align: right;
	vertical-align: top
}

.tg .tg-7btt {
	border-color: inherit;
	font-weight: bold;
	text-align: center;
	vertical-align: top;
}

.tg .tg-0pky {
	border-color: inherit;
	text-align: left;
	vertical-align: top;
	padding-left: 10px;
}
</style>
</head>
<body>
	<h2>공정이동표</h2>
	<table class="tg" style="table-layout: fixed; width: 750px">
		<colgroup>
			<col style="width: 72px">
			<col style="width: 127px">
			<col style="width: 66px">
			<col style="width: 77px">
			<col style="width: 109px">
			<col style="width: 103px">
		</colgroup>
		<tr>
			<th class="tg-dvpl" style="border-right: 0px;" colspan="3"></th>
			<th class="tg-7btt" style="border-left: 0px; border-right: 0px;">작업일자
				:</th>
			<th class="tg-0pky" style="border-left: 0px;" colspan="2">prdComDDate</th>
		</tr>
		<tr>
			<td class="tg-7btt">이동번호</td>
			<td class="tg-0pky" colspan="5">movNum</td>
		</tr>
		<tr>
			<td class="tg-7btt">지시번호</td>
			<td class="tg-0pky" colspan="2">prdComNum</td>
			<td class="tg-7btt">지시일자</td>
			<td class="tg-0pky" colspan="2">prdComDate</td>
		</tr>
		<tr>
			<td class="tg-7btt">제품코드</td>
			<td class="tg-0pky" colspan="2">itmCode</td>
			<td class="tg-7btt">제품명</td>
			<td class="tg-0pky" colspan="2">itmName</td>
		</tr>
		<tr>
			<td class="tg-7btt">소재명</td>
			<td class="tg-0pky" colspan="2">matName</td>
			<td class="tg-7btt">소재LOT NO</td>
			<td class="tg-0pky" colspan="2">lotNum</td>
		</tr>
		<tr>
			<td class="tg-7btt">지시량</td>
			<td class="tg-0pky" colspan="5">prdComVol</td>
		</tr>
		<tr>
			<td class="tg-7btt">출고일</td>
			<td class="tg-0pky" colspan="5">matHistDate</td>
		</tr>
		<tr>
			<td class="tg-7btt">출력일자</td>
			<td class="tg-0pky" colspan="5">
				<div id="printDate"></div>
			</td>
		</tr>
		<tr>
			<td class="tg-7btt" colspan="6">바코드</td>
		</tr>
		<tr>
			<td class="tg-c3ow" colspan="6">
				<div align="center">
					<div id="bcTarget3" style="margin-top: 30px;"></div>
				</div>
			</td>
		</tr>
		<tr>
			<td class="tg-7btt">공정순서</td>
			<td class="tg-7btt">공정명</td>
			<td class="tg-7btt">목표량</td>
			<td class="tg-7btt">관리단위</td>
			<td class="tg-7btt">실적량</td>
			<td class="tg-7btt">작업자</td>
		</tr>
		<tr>
			<td class="tg-0pky" style="text-align: center; padding: 0px;">prcFNo</td>
			<td class="tg-0pky" style="text-align: center; padding: 0px;">prcName</td>
			<td class="tg-0pky" style="text-align: center; padding: 0px;">prcResVol</td>
			<td class="tg-0pky" style="text-align: center; padding: 0px;">prcState</td>
			<td class="tg-0pky" style="text-align: center; padding: 0px;">prcResVol - prcErrVol</td>
			<td class="tg-0pky" style="text-align: center; padding: 0px;">empId</td>
		</tr>
	</table>
	<br/>
	<table class="tg" style="width: 750px">
		<tr>
			<td class="tg-7btt" colspan="6"><span style="font-weight: bold">비고</span></td>
		</tr>
		<tr>
			<td class="tg-0pky" colspan="6" height="100px;">prdComNote</td>
		</tr>
	</table>
</body>
<script>
	$("#bcTarget3").barcode("MV210706_0001", "code128", {
		barWidth : 2,
		barHeight : 50,
		bgColor : "white"
	});

	var date = new Date();

	var year = date.getFullYear(); //년도
	var month = date.getMonth() + 1; //월
	var day = date.getDate(); //일

	if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
		day = "0" + day;
	}

	var getToday = year + "-" + month + "-" + day;

	$('#printDate').text(getToday);

	window.print();
</script>
</html>