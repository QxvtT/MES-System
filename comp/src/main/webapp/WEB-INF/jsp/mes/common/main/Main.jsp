<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
* @Class Name : EgovUnitContent.jsp
* @Description : 로그인 성공후 컨텐츠 영역
* @Modification Information
* 
* @수정일               수정자            수정내용
*  ----------   --------   ---------------------------
*  2020.06.23   신용호            세션만료시간 보여주기
*
*  @author 공통서비스 개발팀 신용호
*  @since 2009.03.03	
*  @version 1.0
*  @see
*
*  Copyright (C) 2009 by MOPAS  All right reserved.
*/
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Main</title>
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
let comVol = 0;
let errVol = 0;
let errPer = 0;
let bckVol = 0;
let bckper = 0;
	$(function(){
			$.ajax({
				async: false, 
				url : "getOrdVol",
				type : "get",
				dataType: "json",
				success : function(result){
					$('h5#ordVol').text(result);
				}
			});
			
			$.ajax({
				async: false, 
				url : "getOrdComVol",
				type : "get",
				dataType: "json",
				success : function(result){
					$('h5#ordComVol').text(result);
				}
			});
			
			$.ajax({
				async: false, 
				url : "getBckVol",
				type : "get",
				dataType: "json",
				success : function(result){
					bckVol = result;
				}
			});
			$.ajax({
				async: false, 
				url : "getErrVol",
				type : "get",
				dataType: "json",
				success : function(result){
					errVol = result
				}
			});
			
			$.ajax({
				async: false, 
				url : "getComVol",
				type : "get",
				dataType: "json",
				success : function(result){
					comVol = result;
					if(comVol >0){
						errPer =errVol/(errVol+bckVol)*100;
						$('h5#errPer').text(Math.round(errPer)+'%');
						bckper = bckVol/comVol*100;
						$('h5#bckPer').text(Math.round(bckper)+'%');
						
					}
				}
			});
			$.ajax({
				async: false, 
				url : "getUsingMac",
				type : "get",
				dataType: "json",
				success : function(result){
					$('h5#getUsingMac').text(result);
				}
			});
			$.ajax({
				async: false, 
				url : "getMonPrice",
				type : "get",
				dataType: "json",
				success : function(result){
					$('h5#getMonPrice').text((result).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				}
			});
			$.ajax({
				async: false, 
				url : "getMonVol",
				type : "get",
				dataType: "json",
				success : function(result){
					$('h5#getMonVol').text(result);
				}
			});
			
			
			
	
		
	})
	
</script>
<style type="text/css">

#sibal:hover{
	background-color: #f0f0f5;
	cursor:pointer;
}

.cssZoom{
	border:1px solid #ccc;
	padding:10px;
	margin-top:10px;
	width:100%;
	height:47vh;
	overflow:hidden;
}

.cssZoom iframe{
	-ms-zoom: 0.5;
	
	-moz-transform: scale(0.5);
	-moz-transform-origin: 0 0;
	
	-o-transform: scale(0.5);
	-o-transform-origin: 0 0;
	
	-webkit-transform: scale(0.5);
	-webkit-transform-origin: 0 0;
	
	transform: scale(0.5);
	transform-origin: 0 0;	
	
	border:1px solid #ccc;
	top:0px;
	left:0px;
	
	width:200%;
	height:200%;
}

</style>
</head>
<body>
<!-- Page-header start -->
	<div class="page-header" align="center">
		<div class="page-block">
			<div class="row align-items-center">
				<div class="col-md-8">
					<div class="page-header-title" >
						<h5 class="m-b-10">&nbsp;
						</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Page-header end -->
	<div class="pcoded-inner-content">
		<!-- Main-body start -->
		<div class="main-body">
			<div class="page-wrapper">
				<!-- Page-body start -->
				<div class="page-body">
					<div class="row">
						<!-- Material statustic card start -->
						<div class="col-xl-4 col-md-12">
						<!-- 가동중인 설비목록 -->
							<div class="card mat-stat-card">
								<div class="card-block">
									<div class="row align-items-center b-b-default">
										<div id ="sibal" class="col-sm-6 b-r-default p-b-20 p-t-20">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="far fa-user text-c-purple f-24"></i>
												</div>
												<div id ="sibal" class="col-8 p-l-0" onclick="location.href='${pageContext.request.contextPath}/sal/ord/OrderMList.do'">
													<h5 id = "ordVol" >0</h5>
													<p class="text-muted m-b-0">진행중인 주문</p>
												</div>
											</div>
										</div>
										<div id ="sibal"class="col-sm-6 p-b-20 p-t-20">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="fas fa-volume-down text-c-green f-24"></i>
												</div>
												<div class="col-8 p-l-0" onclick="location.href='${pageContext.request.contextPath}/prd/res/ProcessListR.do'">
													<h5 id = "bckPer">0%</h5>
													<p class="text-muted m-b-0">금일 실적률</p> 
												</div>
											</div>
										</div>
									</div>
									<div class="row align-items-center">
										<div id ="sibal" class="col-sm-6 p-b-20 p-t-20 b-r-default">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="far fa-file-alt text-c-red f-24"></i>
												</div>
												<div id ="sibal" class="col-8 p-l-0" onclick="location.href='${pageContext.request.contextPath}/sal/ord/OrderMList.do'">
														<h5 id ="ordComVol">0</h5>
													<p class="text-muted m-b-0">완료된 주문</p>
												</div>
											</div>
										</div>
										<div id ="sibal" class="col-sm-6 p-b-20 p-t-20">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="far fa-envelope-open text-c-blue f-24"></i>
												</div>
												<div class="col-8 p-l-0" onclick="location.href='${pageContext.request.contextPath}/prd/res/ProcessListR.do'">
												<h5 id ="errPer">0%</h5>
													<p class="text-muted m-b-0">불량률</p>
													
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-md-12">
							<div class="card mat-stat-card">
								<div class="card-block">
									<div class="row align-items-center b-b-default">
										<div id ="sibal" class="col-sm-6 b-r-default p-b-20 p-t-20">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="fas fa-share-alt text-c-purple f-24"></i>
												</div>
												<div class="col-8 p-l-0">
													<h5 id= "getMonPrice">0</h5>
													<p class="text-muted m-b-0">월 매출</p>
												</div>
											</div>
										</div>
										<div id ="sibal" class="col-sm-6 p-b-20 p-t-20">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="fas fa-sitemap text-c-green f-24"></i>
												</div>
												<div class="col-8 p-l-0">
													<h5 id= "getMonVol">0</h5>
													<p class="text-muted m-b-0">월 생산량</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row align-items-center">
										<div id ="sibal"class="col-sm-6 p-b-20 p-t-20 b-r-default">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="fas fa-signal text-c-red f-24"></i>
												</div>
												<div class="col-8 p-l-0" onclick="location.href='${pageContext.request.contextPath}/mac/machine/MacMng.do'">
													<h5 id ="getUsingMac">0</h5>
													<p class="text-muted m-b-0">사용중 설비</p>
												</div>
											</div>
										</div>
										<div id ="sibal" class="col-sm-6 p-b-20 p-t-20">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="fas fa-wifi text-c-blue f-24"></i>
												</div>
												<div class="col-8 p-l-0">
													<h5>66.75%</h5>
													<p class="text-muted m-b-0">부하율</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-md-12">
							<div class="card mat-clr-stat-card text-white green ">
								<div class="card-block">
									<div class="row">
										<div class="col-3 text-center bg-c-green">
											<i class="fas fa-star mat-icon f-24"></i>
										</div>
										<div class="col-9 cst-cont">
											<h5>고등어순살조림</h5>
											<p class="m-b-0">점심메뉴</p>
										</div>
									</div>
								</div>
							</div>
							<div class="card mat-clr-stat-card text-white blue">
								<div class="card-block">
									<div class="row">
										<div class="col-3 text-center bg-c-blue">
											<i class="fas fa-trophy mat-icon f-24"></i>
										</div>
										<div class="col-9 cst-cont">
											<h5 ></h5>
											<p class="m-b-0">우수사원</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Material statustic card end -->
						<!-- order-visitor start -->


						<!-- order-visitor end -->

						<!--  차트자리야 -->
						
						
						
					</div>
				</div>
				<!-- Project statustic end -->
				<div class="cssZoom">
				<iframe scrolling="no" src="prd/mon/MonitorDisplay.do"></iframe>
				</div>
			</div>
		</div>
 
	</div>
	<div id="styleSelector"></div>
	
	
	

</body>
</html>
