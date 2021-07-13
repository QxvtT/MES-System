<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
* @Class Name : MachineList.jsp
* @Description : Machine List 화면
* @Modification Information
* 
* @author sunghwan
* @since 2021-07-02
* @version 1.0
* @see
*  
* Copyright (C) All right reserved.
*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>목록</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/sample.css'/>" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">

// grid 의 틀을 만들어 놓는 애 
$(function(){
	const machinemng = new tui.Grid({
	    el: document.getElementById('machinemng'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '설비코드', name:'macCode'},
	    	{ header: '설비명', name:'macName'},
	    	{ header: '사용여부', name:'use1'},
	    	{ header: '설비구분', name:'macDiv'},
			{ header: '모델명', name:'model'},
			{ header: '제작업체', name:'proOper'},
			{ header: '최근 작업자', name:'worker'},
			{ header: '용도', name:'use'},
			{ header: '구매금액', name:'buyPrice'},
			{ header: '구매일자', name:'buyDate'},
			{ header: '사용에너지', name:'usingEnergy'},
			{ header: '부하율', name:'macLoadage'},
			{ header: '온도', name:'macStdTemp'}
	    ]
	}); 
	
// date 불러오는 친구 
	function getMachineMngList() { 
		$.ajax({
			async: false, 
			url : "MachineMngList",
			type : "get",
			data : {
				macName : macName,
				macCode : macCode
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					macCode = result[result.length -1].macCode;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
// 스크롤 엔드 함수 ***.on tui 에서 제공하는 함수다. 'scrollEnd'
	machinemng.on('scrollEnd', () => {
		machinemng.appendRows(getMachineMngList());
	  });
	  
// 왼쪽 메뉴 를 열고 할때 grid 를 화면길이를 재설정.
	$('#mobile-collapse').click(function() {
		machinemng.refreshLayout();
	   });
	   
	
/* grid 에서 실행 된 테이블을 더블 클릭 하는 것 
	 grid.on('dblclick', () => { 
		let key = grid.getFocusedCell()['rowKey'];
		let result = grid.getColumnValues('prcResDNum')[key];
		getProcessResultSelect(result);
		prdComDNum = grid.getColumnValues('prdComDNum')[key];
		prcCode = grid.getColumnValues('prcCode')[key];;
		grid3.resetData(getProduceSelect(prdComDNum,prcCode));
		
	}); */
	

// 
	search.onclick = function() {
		macCode = $("input#macCode").val();
		machinemng.resetData(getMachineMngList());
		$( 'input#macName' ).val(' ');
		$( 'input#use1' ).val(' ');
		$( 'input#macDiv' ).val(' ');
		$( 'input#model' ).val(' ');
		$( 'input#proOper' ).val(' ');	
		$( 'input#worker' ).val(' ');
		$( 'input#use' ).val(' ');
		$( 'input#buyPrice' ).val(' ');
		$( 'input#buyDate' ).val(' ');
		$( 'input#usingEnergy' ).val(' ');
		$( 'input#macLoadage' ).val(' ');
		$( 'input#macStdTemp' ).val(' ');
	}
	
// 체크하고 선택 했을때 불어 오는 값 
	
	function setProduceSelect(key) { 
		$.ajax({
			async: false, 
			url : "SetProduceSelect",
			type : "get",
			data : {
				prcResDNum : key
				},
			dataType: "json",
			success : function(result){
				console.log(result);
				data = result;
				$( 'input#prdComDDate' ).val(result[0]['prdComDDate']);
				$( 'input#prdComNum' ).val(result[0]['prdComNum']);
				$( 'input#prcName' ).val(result[0]['prcName']);
				$( 'input#prcWorkNum' ).val(result[0]['prcWorkNum']);
				$( 'input#empName' ).val(result[0]['empName']);
				$( 'input#macName' ).val(result[0]['macName']);
				
			} // end success
		}); // end ajax 
		return data;
	}
	sibalY.onclick= function() {
		let gridData = grid4.getModifiedRows({});
		
		gridData["ProcessResultVO"] ={
										prcResDNum :prcResDNum,
										prcState : grid4.getData()[0]['prcState'],
										macCode : $('input#macCode').val(),
										empId : $('input#empId').val()
										}
			$.ajax({
			async: false, 
			url : "resultSuccess",
			type : "post",
			data : JSON.stringify(gridData),
			dataType: "json",
			contentType:"application/json",
			success : function(){
				console.log("updatesuccess");
						grid3.resetData(getProduceSelect(prdComDNum,prcCode))
						grid.resetData(getProcessResulList());
			}
			});
			
	}
})
	
</script>
</head>
<body>
	<!-- 		123 -->
	<div class="pcoded-inner-content">
		<div class="main-body">
			<div class="page-wrapper">
				<div class="row">
					<div class="col-xl-4">
						<div class="card">
							<!-- 타이틀 -->
							<div id="title" class="card-header">
								<ul>
									<li><h2>설비 관리</h2></li>
								</ul>
							</div>
							<!-- // 타이틀 -->
							<!-- List -->
							
							<div><input type="text" id="macCode" name="macCode" /> <button id="search">검색</button></div>
							

							<div id="table1">
								<table class="table">
									<tr>
										<th>설비코드</th>
										<td><input type="text" id="macCode" name="macCode" /></td>
									</tr>
									<tr>
										<th>설비명</th>
										<td><input type="text" id="macName" name="macName" /></td>
									</tr>
									<tr>
										<th>사용여부</th>
										<td><input type="text" id="use1" name="use1" /></td>
									</tr>
									<tr>
										<th>설비구분</th>
										<td><input type="text" id="macDiv" name="macDiv" /></td>
									</tr>
									<tr>
										<th>모델명</th>
										<td><input type="text" id="model" name="model" /></td>
									</tr>
									<tr>
										<th>제작업체</th>
										<td><input type="text" id="proOper" name="proOper" /></td>
									</tr>
									<tr>
										<th>최근 작업자</th>
										<td><input type="text" id="worker" name="worker" /></td>
									</tr>
									<tr>
										<th>용도</th>
										<td><input type="text" id="use" name="use" /></td>
									</tr>
									<tr>
										<th>구매금액</th>
										<td><input type="text" id="buyPrice" name="buyPrice" /></td>
									</tr>
									<tr>
										<th>구매일자</th>
										<td><input type="date" id="buyDate" name="buyDate" /></td>
									</tr>
									<tr>
										<th>사용에너지</th>
										<td><input type="text" id="usingEnergy"
											name="usingEnergy" /></td>
									</tr>
									<tr>
										<th>부하율</th>
										<td><input type="text" id="macLoadage" name="macLoadage" /></td>
									</tr>
									<tr>
										<th>온도</th>
										<td><input type="text" id="macStdTemp" name="macStdTemp" /></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
