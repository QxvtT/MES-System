<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	$(function(){
		$('#monitorBtn').click(function() {
			window.open("MonitorDisplay.do","", "width=1600, height=1000, menubar=no, status=no, toolbar=no");
			
		})
	});
</script>
</head>
<body>
	<!-- 생산모니터링 Title  -->
	<div class="page-header">
		<div class="page-block">
			<div class="row align-items-center">
				<div class="col-md-8">
					<div class="page-header-title">
						<h5 class="m-b-10">생산모니터링</h5>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="/comp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item">생산관리</li>
						<li class="breadcrumb-item">생산모니터링</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 생산모니터링 Title  -->

	<!-- Page-header end -->
	<div class="pcoded-inner-content">
		<br />
		<div class="main-body">
			<div class="page-wrapper">
				<div class="text-right">
					<button type="button" class="btn btn-primary" id="monitorBtn">모니터링</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>