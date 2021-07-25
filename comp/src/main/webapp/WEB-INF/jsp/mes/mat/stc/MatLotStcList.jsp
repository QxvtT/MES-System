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
<style type="">
</style>
<script type="text/javaScript" language="javascript" defer="defer">
let matCode = null;
let matCode3 = null;
let matCodes = null;
let sDate = null;
let eDate = null;

$(function(){
	var today = new Date();
    var picker = tui.DatePicker.createRangePicker({
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
        language: 'ko'
        
    });

	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 400,
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ 
	    		header: '자재코드',
	    		name:'matCode'
	    	},
			{ 
	    		header: '자재명', 
	    		name:'matName'
	    	},
			{
	    		header: '규격',
	    		name:'matSize'
	    	},
			{ 
	    		header: '자재구분', 
	    		name:'matDiv'
	    	},
			{ 
	    		header: 'LOT NO', 
	    		name:'lotNum'
	    	},
			{ 
	    		header: '입고량', 
	    		name:'invol',
	    		formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
	    	},
 			{ 
	    		header: '출고량', 
	    		name:'outvol',
	    		formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
	    	},
			{ 
	    		header: '현재고', 
	    		name:'matVol',
	    		formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
	    	}
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
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "MatLotStcList",
			type : "get",
			data : {
					matCode3: matCode3,
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
	
	$('#mobile-collapse').click(function() {
	   grid.refreshLayout();
	});
	
	resetBtn.onclick=function(){
		grid.clear();
	}
	
})

</script>
</head>
<body>
	<!-- 타이틀 -->
	<div class="page-header">
		<div class="page-block">
			<div class="row align-items-center">
				<div class="col-md-8">
					<div class="page-header-title">
						<h5 class="m-b-10">자재 LOT 재고 조회</h5>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/main.do"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item">자재관리</li>
						<li class="breadcrumb-item">자재 LOT 재고 조회</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- // 타이틀 -->
	<div class="pcoded-inner-content">
		<div class="main-body">
			<div class="page-wrapper">
				<form:form commandName="searchVO" name="listForm" id="listForm"
					method="post">
				<input type="hidden" name="matCode" />
					<div class="text-right">
						<button type="button" id="searchBtn"
							class="btn waves-effect waves-light btn-info  btn-md">조회</button>
						<input type="button" value="새자료 " id="resetBtn" name="resetBtn"
							class="btn waves-effect waves-light btn-info  btn-md"></input>
						<button type="button" class="btn btn-info btn-md" id="excelBtn">Excel</button>
						<button type="button" class="btn btn-info btn-md" id="printBtn">인쇄</button>
					</div>
					<br />
					<div class="row">
						<div class="col-xl-12">
							<div class="card">
								<table class="table">
									<tr>
										<td>
											<div class="d-inline-block align-middle">입고일자</div>
										</td>
										<td>
											<div class="row align-items-center text-center col-lg-8">
												<div
													class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
													<input type="text" id="startpicker-input"
														class=" form-control w-25" aria-label="Date-Time"
														name="sDate" /> <span class="tui-ico-date"></span>
													<div id="startpicker-container" style="margin-left: -1px;"></div>
												</div>
												<div id="date1" style="margin-top: -1px;"></div>
	
												<label class="col-form-label text-center"> ~ </label>
												<div
													class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
													<input type="text" id="endpicker-input"
														class=" form-control w-25" aria-label="Date-Time"
														name="eDate" /> <span class="tui-ico-date"></span>
													<div id="endpicker-container" style="margin-left: -1px;"></div>
												</div>
												<div id="date2" style="margin-top: -1px;"></div>
											</div>
											<div class="col-lg-4"></div>
										</td>
										<!-- <td>
														<div class="d-inline-block align-middle">자재구분</div>
													</td>
													<td>
														<select>
															<option>전체</option>
															<option>일반자재</option>
															<option>가공자재</option>
														</select>
													</td> -->
									</tr>
									<tr>
										<td><label class="col-form-label text-center">자재코드</label>
										</td>
										<td>
											<div class="row align-items-center col-lg-8">
												<input type="text" class="form-control w-25 ml-3"
													id="matCode" name="matCode"></input> <input type="text"
													class="form-control w-25 ml-3" id="matName" name="matCode"
													readonly></input>
												<%@ include
													file="/WEB-INF/jsp/mes/common/modal/MaterialList.jsp"%>
											</div>
											<div class="col-lg-4"></div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="card pt-3">
						<div class="ml-3 mt-2"><p class="font-weight-bold" style="font-size:15px">자재 LOT 재고</p></div>
						<div class="row">
							<div class="col-sm-12">
								<div id="grid"></div>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
