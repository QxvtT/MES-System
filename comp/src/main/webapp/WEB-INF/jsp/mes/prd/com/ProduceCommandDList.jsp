<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ProduceCommandDList.jsp
  * @Description : ProduceCommandD List 화면
  * @Modification Information
  * 
  * @author soyeon
  * @since 20210625
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

<script type="text/javaScript" language="javascript" defer="defer">
let myToast = null;
let prdComDNum1 = null;
let prdComNum1 = null;
let prdComNum = null;
let prdComMatNum = null;
let prdComDNum = null;
$(function(){
	
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '일련번호', name:'prdComDNum', hidden: true},
	    	{ header: '계획일련번호', name:'prdPlanDNum', hidden: true},
	    	{ header: '주문일련번호', name:'ordDNum', hidden: true},
			{ header: '제품코드', name:'itmCode'},
			{ header: '구분', name:'prcComDiv'},
			{ header: '주문번호', name:'ordNum'},
			{ header: '납기일자', name:'ordDeliveryDate'},
			{ header: '주문량', name:'ordVol'},
			{ header: '기지시량', name:'yComVol'},
			{ header: '미지시량', name:'nComVol'},
			{ header: '지시량', name:'prdComVol'},
			{ header: 'UPH', name:'uph'},
			{ header: '일생산량', name:'itmDayOutput'},
			{ header: '일수', name:'dayNum'},
			{ header: '작업일자', name:'prdComDDate'},
			{ header: '작업순서', name:'prcComNo'},
			{ header: '비고', name:'prdComDNote'}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "ProduceCommandDList",
			type : "get",
			data : {prdComDNum1: prdComDNum1,
					prdComNum: prdComNum
					},
			dataType: "json",
			success : function(result){
				console.log(prdComNum1);
				if(result.length > 0) {
					prdComDNum1 = result[result.length -1].prdComDNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#mobile-collapse').click(function() {
		grid.refreshLayout();
	});
	
	
	//작업지시 조회용 모달
	let today = new Date();
    let picker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: today,
            input: '#startpicker-input',
            container: '#startpicker-container'
        },
        endpicker: {
            date: today,
            input: '#endpicker-input',
            container: '#endpicker-container'
        },
        language: 'ko',
        type: 'date',
        format: 'yyyy-MM-dd'
  
    });
    
	const grid2 = new tui.Grid({
	    el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '지시번호', name:'prdComNum'},
			{ header: '지시일자', name:'prdComDate'},
			{ header: '작업지시명', name:'prdComName'},
			{ header: '비고', name:'prdComNote'}
	    ]
	}); // end const grid2
	
	grid2.on('scrollEnd', () => {
	    grid2.appendRows(getPrdComList());
	  })
	  
	function getPrdComList() {
		let data;
		$.ajax({
			async: false,
			url : "ProduceCommandList",
			type : "get",
			data : {prdComNum1: prdComNum1},
			dataType: "json",
			success : function(result){
				console.log(prdComNum1);
				if(result.length > 0) {
					prdComNum1 = result[result.length -1].prdComNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#searchComBtn').click(function(){
		$("#myModal").modal("toggle");
		$("#myModal").on('shown.bs.modal', function () {
			prdComNum1 = null;
			grid2.refreshLayout();
			grid2.resetData(getPrdComList());
		});
		
	})
	
	//작업지시 조회모달에서 더블클릭시 조회할 지시 선택하는 기능
	grid2.on('dblclick', (e) => {
		if(myToast != null) myToast.reset();
		prdComNum = grid2.getValue(e.rowKey,'prdComNum');
		grid.resetData(getList());
		$('#myModal').modal('hide');
		//토스트메시지 테스트
		myToast = $.toast({ 
			  text : "조회되었습니다.", 
			  showHideTransition : 'slide',  // It can be plain, fade or slide
			  bgColor : 'yellowgreen',              // Background color for toast
			  textColor : 'white',            // text color
			  allowToastClose : false,       // Show the close button or not
			  hideAfter : 2000,              // `false` to make it sticky or time in miliseconds to hide after
			  stack : 5,                     // `fakse` to show one stack at a time count showing the number of toasts that can be shown at once
			  textAlign : 'center',            // Alignment of text i.e. left, right, center
			  position : 'top-center'       // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values to position the toast on page
			});
	});
	//작업지시 조회용 모달//
	
	//행에서 쓸 자재로트
	const gridMat = new tui.Grid({
	    el: document.getElementById('gridMat'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: null,
	    rowHeaders: ['checkbox'],
	    columns: [
			{ header: '지시자재일련번호', name:'prdComMatNum', hidden: true},
			{ header: '자재LOT NO', name:'lotNum'},
			{ header: '수량', name:'matVol'},
			{ header: '비고', name:'prdComMatNote'}
	    ]
	}); // end const grid2
	
	gridMat.on('scrollEnd', () => {
	    gridMat.appendRows(getComMatList());
	  })
	  
	function getComMatList() {
		let data;
		$.ajax({
			async: false,
			url : "ProduceCommandMatList",
			type : "get",
			data : {prdComMatNum: prdComMatNum,
					prdComDNum: prdComDNum
					},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					prdComMatNum = result[result.length -1].prdComMatNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	//행에서 쓸 자재로트//
	
	//grid 행 더블클릭시 자재조회
	grid.on('dblclick', (e) => {
		prdComDNum = grid.getValue(e.rowKey,'prdComDNum');
		console.log(prdComDNum);
		gridMat.resetData(getComMatList());
	});
	
})



<!--
/* 글 수정 화면 function */


function fn_egov_select(prdComDNum) {
	document.getElementById("listForm").prdComDNum.value = prdComDNum;
   	document.getElementById("listForm").action = "<c:url value='/prd/com/updateProduceCommandDView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/prd/com/addProduceCommandDView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/prd/com/ProduceCommandDList.do'/>";
   	document.getElementById("listForm").submit();
}

 // -->
</script>
</head>
<body>

<div class="pcoded-inner-content">
<div class="main-body">
<div class="page-wrapper">
<div class="row">
<div class="col-xl-12">


	<!-- 작업지시서 검색 모달 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">
						작업지시서 검색
					</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body">
					<div class="">
					    <div class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3 d-inline-block">
					        <input type="text" id="startpicker-input" class=" form-control w-25" aria-label="Date-Time"/>
					        <span class="tui-ico-date"></span>
					        <div id="startpicker-container" style="margin-left: -1px;"></div>
					    </div>
					    <div id="date1" class="d-inline-block" style="margin-top: -1px;"></div>
	
						<label class="col-form-label text-center"> ~ </label>
						<div class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3 d-inline-block">
					        <input type="text" id="endpicker-input" class=" form-control w-25" aria-label="Date-Time"/>
					        <span class="tui-ico-date"></span>
					        <div id="endpicker-container" style="margin-left: -1px;"></div>
					    </div>
					    <div id="date2" class="d-inline-block" style="margin-top: -1px;"></div>
					    <button type="button" id="searchPlnBtn"
							class="btn btn-sm btn-primary waves-effect waves-light">검색</button>
					</div>
				</div>	
				<div id="grid2"></div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
  



	<!-- 타이틀 -->
	<div id="title" class="mb-4">
		<h3>생산 지시 관리</h3>
	</div>
	<!-- // 타이틀 -->
	
	<div class="row">
		<div class="col-sm-6"></div>
		<div class="col-sm-6 text-right">
			<div class="btn-group">
				<button type="button" id="searchComBtn" class="btn waves-effect waves-light btn-primary btn-outline-primary" data-toggle="modal" data-target="#myModal"> 조회 </button>
				<input type="reset" value=" 리셋 " class="btn waves-effect waves-light btn-primary btn-outline-primary"></input>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="table">
			<table class="table">
				<tr>
					<td>
						<div class="d-inline-block align-middle">작성일자</div>
					</td>
					<td>
						<div class="row align-items-center text-center col-lg-12">
						    <div class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
						        <input type="text" id="startpicker-input" class=" form-control w-25" aria-label="Date-Time" name="matHisDate"/>
						        <span class="tui-ico-date"></span>
						        <div id="startpicker-container" style="margin-left: -1px;"></div>
						    </div>
						    <div id="date1" style="margin-top: -1px;"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
				 		<label class="col-form-label text-center">작업지시명</label>
				 	</td>
				 	<td>
					 	<div class="row align-items-center text-center col-lg-12">
							<input type="text" class="form-control w-25 ml-3" id="matCode" name="matCode"></input>
						</div>
					</td>
				</tr>
				<tr>
					<td>
				 		<label class="col-form-label text-center">특이사항</label>
				 	</td>
				 	<td>
					 	<div class="row align-items-center text-center col-lg-12">
							<input type="text" class="form-control ml-3" id="operCode" name="operCode"></input>
						</div>
					</td>
				</tr>
			</table>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
					<div class="card-body">
					<h5 class="d-inline">생산계획 조회</h5>
					<button type="button" id="searchPlnBtn"
								class="btn btn-sm btn-primary waves-effect waves-light ml-3">검색</button>
				</div>
			</div>
		</div>
	</div>
	
	<div style="height: 50px"></div>
	
	<div class="row">
		<div class="col-sm-12">
			<div id="grid"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div id="gridMat"></div>
		</div>
	</div>
	

</div>
</div>
</div>
</div>
</div>

</body>
</html>
