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
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>eGovFrame <spring:message code="comCmm.unitContent.1" /></title>
<body>
	<div class="pcoded-inner-content">
		<!-- Main-body start -->
		<div class="main-body">
			<div class="page-wrapper">
				<!-- Page-body start -->
				<div class="page-body">
					<div class="row">
						<!-- Material statustic card start -->
						<div class="col-xl-4 col-md-12">
							<div class="card mat-stat-card">
								<div class="card-block">
									<div class="row align-items-center b-b-default">
										<div class="col-sm-6 b-r-default p-b-20 p-t-20">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="far fa-user text-c-purple f-24"></i>
												</div>
												<div class="col-8 p-l-0">
													<h5>10K</h5>
													<p class="text-muted m-b-0">Visitors</p>
												</div>
											</div>
										</div>
										<div class="col-sm-6 p-b-20 p-t-20">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="fas fa-volume-down text-c-green f-24"></i>
												</div>
												<div class="col-8 p-l-0">
													<h5>100%</h5>
													<p class="text-muted m-b-0">Volume</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row align-items-center">
										<div class="col-sm-6 p-b-20 p-t-20 b-r-default">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="far fa-file-alt text-c-red f-24"></i>
												</div>
												<div class="col-8 p-l-0">
													<h5>2000+</h5>
													<p class="text-muted m-b-0">Files</p>
												</div>
											</div>
										</div>
										<div class="col-sm-6 p-b-20 p-t-20">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="far fa-envelope-open text-c-blue f-24"></i>
												</div>
												<div class="col-8 p-l-0">
													<h5>120</h5>
													<p class="text-muted m-b-0">Mails</p>
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
										<div class="col-sm-6 b-r-default p-b-20 p-t-20">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="fas fa-share-alt text-c-purple f-24"></i>
												</div>
												<div class="col-8 p-l-0">
													<h5>1000</h5>
													<p class="text-muted m-b-0">Share</p>
												</div>
											</div>
										</div>
										<div class="col-sm-6 p-b-20 p-t-20">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="fas fa-sitemap text-c-green f-24"></i>
												</div>
												<div class="col-8 p-l-0">
													<h5>600</h5>
													<p class="text-muted m-b-0">Network</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row align-items-center">
										<div class="col-sm-6 p-b-20 p-t-20 b-r-default">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="fas fa-signal text-c-red f-24"></i>
												</div>
												<div class="col-8 p-l-0">
													<h5>350</h5>
													<p class="text-muted m-b-0">Returns</p>
												</div>
											</div>
										</div>
										<div class="col-sm-6 p-b-20 p-t-20">
											<div class="row align-items-center text-center">
												<div class="col-4 p-r-0">
													<i class="fas fa-wifi text-c-blue f-24"></i>
												</div>
												<div class="col-8 p-l-0">
													<h5>100%</h5>
													<p class="text-muted m-b-0">Connections</p>
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
											<h5>4000+</h5>
											<p class="m-b-0">Ratings Received</p>
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
											<h5>17</h5>
											<p class="m-b-0">Achievements</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Material statustic card end -->
						<!-- order-visitor start -->


						<!-- order-visitor end -->

						<!--  차트자리야 -->
						
						
						<div class="col-xl-12">
							<div class="card proj-progress-card">
								<div class="card-block">
									<div class="row">
										<div class="col-xl-3 col-md-6">
											<h6>Published Project</h6>
											<h5 class="m-b-30 f-w-700">
												532<span class="text-c-green m-l-10">+1.69%</span>
											</h5>
											<div class="progress">
												<div class="progress-bar bg-c-red" style="width: 25%"></div>
											</div>
										</div>
										<div class="col-xl-3 col-md-6">
											<h6>Completed Task</h6>
											<h5 class="m-b-30 f-w-700">
												4,569<span class="text-c-red m-l-10">-0.5%</span>
											</h5>
											<div class="progress">
												<div class="progress-bar bg-c-blue" style="width: 65%"></div>
											</div>
										</div>
										<div class="col-xl-3 col-md-6">
											<h6>Successfull Task</h6>
											<h5 class="m-b-30 f-w-700">
												89%<span class="text-c-green m-l-10">+0.99%</span>
											</h5>
											<div class="progress">
												<div class="progress-bar bg-c-green" style="width: 85%"></div>
											</div>
										</div>
										<div class="col-xl-3 col-md-6">
											<h6>Ongoing Project</h6>
											<h5 class="m-b-30 f-w-700">
												365<span class="text-c-green m-l-10">+0.35%</span>
											</h5>
											<div class="progress">
												<div class="progress-bar bg-c-yellow" style="width: 45%"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Project statustic end -->
			</div>
		</div>

	</div>
	<div id="styleSelector"></div>
</body>
</html>