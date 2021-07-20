<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
* @Class Name : MaterialStockList.jsp
* @Description : MaterialStock List 화면
* @Modification Information
* 
* @author materialStock
* @since 2021-06-25
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
let matHisDateS = null;
let matHisDateE = null;
let matCode = null;
let matCodes = null;
let operCode = null;
let matHisNum = null;
let matHisDNum = null;
let matHisDNum1 = null;

$(function(){
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
    
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '입고일자', name:'matHisDate' 
	    		//editor: {type: 'datePicker', options: {language: 'ko'}}
	    	},
	    	{ header: '자재코드', name:'matCode'},
			{ header: '자재명', name:'matName',
	    		sortable: true,
	    	    sortingType: 'asc'},
			{ header: '규격', name:'matSize'},
			{ header: '업체명', name:'matOrdOper',
				sortable: true,
			    sortingType: 'asc'},
			{ header: '발주번호', name:'matComNum'},
			{ header: '입고량', name:'matHisDVol',
				formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");},
				sortable: true,
			    sortingType: 'asc'
			},
			{ header: '단가', name:'matHisPrice',
				formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
			},
			{ header: '금액', name:'amount',
				formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
			},
			{ header: 'Lot No', name:'lotNum'},
			{ header: '입고번호', name:'matHisNum', hidden: true},
			{ header: '일련번호', name:'matHisDNum', hidden: true}
	    ],
	    summary: {
	        position: 'bottom',
	        height: 30,  // by pixel
	        columnContent: {
	          matCode: '합계',
	          matHisDVol: {
	            template(valueMap) {
	             return (valueMap.sum == 0)? 0 : String(valueMap.sum).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	            }
	          },
	          amount: {
	            template(valueMap) {
	              return (valueMap.sum == 0)? 0 : String(valueMap.sum).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	            }
	          }
	        }
	    },
      columnOptions: {
          resizable: true
        }
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "MatInList",
			type : "get",
			data : {matCode: matCode,
					matCodes: matCodes,
					matHisDateS: matHisDateS,
					matHisDateE: matHisDateE,
					matHisDNum1: matHisDNum1
					},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matHisDNum1 = result[result.length -1].matHisDNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	} 
	
	
	$('#testBtn').click(function() {
		console.log("aaaaaaaaa");
		console.log(grid.getCheckedRows());
		matHisDateS = $('#startpicker-input').val();
		matHisDateE = $('#endpicker-input').val();
		matCodes = $('#matCode').val();
		console.log(matCodes);
		operCode = $('#operCode').val();
		grid.resetData(getList());
	});

	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	
	
})



</script>
</head>
<body>
	<form:form commandName="searchVO" name="listForm" id="listForm"
		method="post">
		<input type="hidden" name="matCode" />
		<div class="pcoded-inner-content">
			<div class="main-body">
				<div class="page-wrapper">
					<div class="row">
						<div class="col-xl-12">
							<div id="title" class="mb-4">
								<h3>자재 입고 조회</h3>
							</div>
							<!-- // 타이틀 -->
							<div class="row">
								<div class="col-sm-6"></div>
								<div class="col-sm-6 text-right">
									<div class="btn-group">
										<button type="button" id="testBtn" class="btn waves-effect waves-light btn-primary btn-outline-primary"> 조회 </button>
										<input type="reset" value=" 리셋 " class="btn waves-effect waves-light btn-primary btn-outline-primary"></input>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="table">
									<table class="table">
										<tr>
											<td>
												<div class="d-inline-block align-middle">작업일자</div>
											</td>
											<td>
												<div class="row align-items-center text-center col-lg-8">
												    <div class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
												        <input type="text" id="startpicker-input" class=" form-control w-25" aria-label="Date-Time" name="matHisDate"/>
												        <span class="tui-ico-date"></span>
												        <div id="startpicker-container" style="margin-left: -1px;"></div>
												    </div>
												    <div id="date1" style="margin-top: -1px;"></div>
							
													<label class="col-form-label text-center"> ~ </label>
													<div class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
												        <input type="text" id="endpicker-input" class=" form-control w-25" aria-label="Date-Time" name="matHisDate"/>
												        <span class="tui-ico-date"></span>
												        <div id="endpicker-container" style="margin-left: -1px;"></div>
												    </div>
												    <div id="date2" style="margin-top: -1px;"></div>
												</div>
												<div class="col-lg-4">
												</div>
											</td>
										</tr>
										<tr>
											<td>
										 		<label class="col-form-label text-center">자재코드</label>
										 	</td>
										 	<td>
											 	<div class="row align-items-center text-center col-lg-8">
													<input type="text" class="form-control w-25 ml-3" id="matCode" name="matCode" value="${result.matCode }"></input>
													<input type="text" class="form-control w-25 ml-3" id="matName" name="matName" value="${result.matName }" readonly></input>
													<%--<jsp:include page="/MaterialList.page" />
													<c:import url="/MaterialList.page"/> --%>
													<%@ include file="/WEB-INF/jsp/mes/common/modal/MaterialList.jsp" %>
													
												</div>
												<div class="col-lg-4">
												</div>
											</td>
										</tr>
										<tr>
											<td>
										 		<label class="col-form-label text-cen3ter">업체코드</label>
										 	</td>
										 	<td>
											 	<div class="row align-items-center text-center col-lg-8">
													<input type="text" class="form-control w-25 ml-3" id="operCode" name="operCode" value="${result.operCode }"></input>
													<input type="text" class="form-control w-25 ml-3" id="operName" name="operName" value="${result.operName }" readonly></input>
													<%-- <button type="button" class="btn btn-sm btn-primary waves-effect waves-light ml-3"
														id="searchOperBtn" data-toggle="modal" data-target="#searchOperModal">검색</button>
														<c:import url="/OperationList.page"/> --%>
													<%@ include file="/WEB-INF/jsp/mes/common/modal/OperationList.jsp" %>
													
												</div>
												<div class="col-lg-4">
												</div>
											</td>
										</tr>
									</table>
									</div>
								</div>
							</div>
							
							<div style="height: 50px"></div>
							
							<div class="form-group row">
								<div class="col-sm-12">
									<div id="grid"></div>
								</div>
							</div>
	
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>
