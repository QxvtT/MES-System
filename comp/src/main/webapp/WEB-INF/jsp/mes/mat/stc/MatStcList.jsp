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
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script
	src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
let matCode = null;
let matCode3 = null;
let matCodes = null;
let sDate = null;
let eDate = null;

$(function(){
	
	let StcDate = new Date();
    let picker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: StcDate,
            input: '#StcStartpicker-input',
            container: '#StcStartpicker-container'
        },
        endpicker: {
            date: StcDate,
            input: '#StcEndpicker-input',
            container: '#StcEndpicker-container'
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
	    	{ header: '자재코드', name:'matCode'},
			{ header: '자재명', name:'matName'},
			{ header: '자재구분', name:'matDiv'},
			{ header: '안전재고', name:'matSafeStock',
				formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
			},
// 			{ header: '이월량', name:'matSafeStock'},
			{ header: '입고량', name:'invol',
				formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
			},
 			{ header: '출고량', name:'outvol',
				formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
 			},
			{ header: '현재고', name:'matVol',
 				formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
			},
			{ header: '미달량', name:'mshort',
				formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
			},
// 			{ header: '특기사항', name:''},
	    ],
	    summary: {
	        position: 'bottom',
	        height: 30,  // by pixel
	        columnContent: {
	          matCode: '합계',
	          invol: {
	            template(valueMap) {
	              return (valueMap.sum == 0)? 0 : String(valueMap.sum).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	            }
	          },
	          outvol: {
	        	template(valueMap) {
	              return (valueMap.sum == 0)? 0 : String(valueMap.sum).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	            }
	          },
	          matVol: {
	        	template(valueMap) {
	              return (valueMap.sum == 0)? 0 : String(valueMap.sum).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	            }
	          }
	        }
	    }
	}); // end const grid
	
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "MatStcList",
			type : "get",
			data : { matCode3: matCode3,
					 matCodes: matCodes,
					 sDate: sDate,
					 eDate: eDate
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matCode3 = result[result.length -1].matCode;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	   
	searchBtn.onclick = function(){
		matCode3 = null;
		console.log(matCode3)
		
		sDate = $('input[name="sDate"]').val();
		console.log(sDate);
		eDate = $('input[name="eDate"]').val();
		console.log(eDate);
		matCodes = $('#matCode').val();
		console.log(matCodes);
		
		grid.resetData(getList());
	}
	
	resetBtn.onclick=function(){
		grid.clear();
	} 
	
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

							<!-- 타이틀 -->
							<div id="title" class="mb-4">
								<h3>자재 재고 조회</h3>
								<br />
							</div>
							<!-- // 타이틀 -->
							<div class="row">
								<div class="col-sm-6"></div>
								<div class="col-sm-6 text-right">
									<div class="btn-group">
										<button type="button" id="searchBtn" name="searchBtn"										
											class="btn waves-effect waves-light btn-primary btn-outline-primary">
											조회</button>
										<input type="button" id="resetBtn" value="리셋 "
											class="btn waves-effect waves-light btn-primary btn-outline-primary"></input>
									</div>
								</div>
							</div><br />
							<div class="row">
								<div class="col-lg-12">
									<div class="table">
										<table class="table">
											<tr>
												<td>
													<div class="d-inline-block align-middle">해당 일자</div>
												</td>
												<td>
													<div class="row align-items-center text-center col-lg-8">
														<div
															class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
															<input type="text" id="StcStartpicker-input"
																class=" form-control w-25" aria-label="Date-Time"
																name="sDate" /> <span class="tui-ico-date"></span>
															<div id="StcStartpicker-container"
																style="margin-left: -1px;"></div>
														</div>
														<div id="date1" style="margin-top: -1px;"></div>
														<label class="col-form-label text-center"> ~ </label>
														<div
															class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
															<input type="text" id="StcEndpicker-input"
																class=" form-control w-25" aria-label="Date-Time"
																name="eDate" /> <span class="tui-ico-date"></span>
															<div id="StcEndpicker-container"
																style="margin-left: -1px;"></div>
														</div>
														<div id="date2" style="margin-top: -1px;"></div>
													</div>
												</td>
											</tr>
											<tr>
												<td><label class="col-form-label text-center">자재코드</label>
												</td>
												<td>
													<div class="row align-items-center text-center col-lg-8">
														<input type="text" class="form-control w-25 ml-3" id="matCode" name="matCode"></input> 
														<input type="text" class="form-control w-25 ml-3" id="matName" name="matName" readonly></input>
														<%@ include
															file="/WEB-INF/jsp/mes/common/modal/MaterialList.jsp"%>
													</div>
													<div class="col-lg-4"></div>
												</td>
											</tr>
										</table>
									</div>
									<div id="grid"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
	</form:form>
</body>
</html>
