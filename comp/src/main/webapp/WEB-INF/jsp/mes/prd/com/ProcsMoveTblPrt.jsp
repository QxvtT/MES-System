<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
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
	border-color: black;
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
	<table class="tg" style="table-layout: fixed; width: 750px" id="table">
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
			<th class="tg-0pky" style="border-left: 0px;" colspan="2" id="prdComDDate"></th>
		</tr>
		<tr>
			<td class="tg-7btt">이동번호</td>
			<td class="tg-0pky" colspan="5" id="movNum"></td>
		</tr>
		<tr>
			<td class="tg-7btt">지시번호</td>
			<td class="tg-0pky" colspan="2" id="prdComNum"></td>
			<td class="tg-7btt">지시일자</td>
			<td class="tg-0pky" colspan="2" id="prdComDate"></td>
		</tr>
		<tr>
			<td class="tg-7btt">제품코드</td>
			<td class="tg-0pky" colspan="2" id="itmCode"></td>
			<td class="tg-7btt">제품명</td>
			<td class="tg-0pky" colspan="2" id="itmName"></td>
		</tr>
		<tr>
			<td class="tg-7btt">소재명</td>
			<td class="tg-0pky" colspan="2" id="matName"></td>
			<td class="tg-7btt">소재LOT NO</td>
			<td class="tg-0pky" colspan="2" id="lotNum"></td>
		</tr>
		<tr>
			<td class="tg-7btt">지시량</td>
			<td class="tg-0pky" colspan="5" id="prdComVol"></td>
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
	</table>
	<br />
	<table class="tg" style="width: 750px">
		<tr>
			<td class="tg-7btt" colspan="6"><span style="font-weight: bold">비고</span></td>
		</tr>
		<tr>
			<td class="tg-0pky" colspan="6" height="100px;"></td>
		</tr>
	</table>
</body>
<script>
	let data1 = opener.getProcessMov();
	let data2 = opener.getProcessMat();
	let data3 = opener.getProcessFlow();
	
	console.log(data1);
	console.log(data2);
	console.log(data3);
	
	$('#prdComDDate').text(data1.prdComDDate1);
	$('#movNum').text(data2.movNum);
	$('#prdComNum').text(data1.prdComNum);
	$('#prdComDate').text(data1.prdComDate);
	$('#itmCode').text(data1.itmCode);
	$('#itmName').text(data1.itmName);
	$('#matName').text(data1.matName);
	$('#lotNum').text(data2.lotNum);
	$('#prdComVol').text(data1.prdComVol);
	
	var date = new Date();
	var year = date.getFullYear(); //년도
	var month = date.getMonth() + 1; //월
	var day = date.getDate(); //일
	if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
		day = "0" + day;
	}
	var getToday = year + "-" + month + "-" + day;
	$('#printDate').text(getToday);
	
	$("#bcTarget3").barcode(data2.movNum, "code128", {
		barWidth : 2,
		barHeight : 50,
		bgColor : "white"
	});
	
	for(i in data3){
		$('<tr>')
			.append($('<td>').html(data3[i].prcFNo)).attr('align', 'center')
			.append($('<td>').html(data3[i].prcName))
			.append($('<td>').html(data3[i].prcComDVol))
			.append($('<td>').html(data3[i].prcUnit))
			.append($('<td>').html((data3[i].prcResVol - data3[i].prcErrVol)))
			.append($('<td>').html(data3[i].empName))
			.appendTo('#table')
	};
	

	window.print();
</script>
</html>