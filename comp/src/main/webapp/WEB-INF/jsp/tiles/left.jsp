<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="pcoded-navbar">
	<div class="sidebar_toggle">
		<a href="#"><i class="icon-close icons"></i></a>
	</div>
	<div class="pcoded-inner-navbar main-menu">
		<div class="">
			<div class="main-menu-header">
				<img class="img-80 img-radius"
					src="${pageContext.request.contextPath}/assets/images/avatar-4.jpg"
					alt="User-Profile-Image">
				<div class="user-details">
					<span id="more-details">John Doe<i class="fa fa-caret-down"></i></span>
				</div>
			</div>
			<div class="main-menu-content">
				<ul>
					<li class="more-details"><a href="user-profile.html"><i
							class="ti-user"></i>View Profile</a> <a href="#!"><i
							class="ti-settings"></i>Settings</a> <a
						href="auth-normal-sign-in.html"><i
							class="ti-layout-sidebar-left"></i>Logout</a></li>
				</ul>
			</div>
		</div>
		<div class="p-15 p-b-0">
			<form class="form-material">
				<div class="form-group form-primary">
					<input type="text" name="footer-email" class="form-control">
					<span class="form-bar"></span> <label class="float-label"><i
						class="fa fa-search m-r-10"></i>Search Friend</label>
				</div>
			</form>
		</div>
		<div class="pcoded-navigation-label">Navigation</div>
		<ul class="pcoded-item pcoded-left-item">
			<li class="active"><a href="index.jsp"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-home"></i><b>D</b></span> <span class="pcoded-mtext">Dashboard</span>
					<span class="pcoded-mcaret"></span>
			</a></li>
		</ul>
		<div class="pcoded-navigation-label">UI Element</div>
		<ul class="pcoded-item pcoded-left-item">
			<li class="pcoded-hasmenu"><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layout-grid2-alt"></i><b>BC</b></span> <span
					class="pcoded-mtext">Basic</span> <span class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class=" "><a href="breadcrumb.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Breadcrumbs</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="button.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Button</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="accordion.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Accordion</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="tabs.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Tabs</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="color.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Color</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="label-badge.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Label
								Badge</span> <span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="tooltip.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Tooltip
								And Popover</span> <span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="typography.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Typography</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="notification.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Notifications</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
				</ul></li>
		</ul>
		<ul class="pcoded-item pcoded-left-item">
			<li class="pcoded-hasmenu"><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layout-grid2-alt"></i><b>BC</b></span> <span
					class="pcoded-mtext">주문</span> <span class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class=" "><a href="OrderMList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">주문조회</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="ItemHistoryList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">출고조회</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="addItemHistoryView.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">출고관리</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="tabs.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Tabs</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="color.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Color</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="label-badge.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Label
								Badge</span> <span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="tooltip.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Tooltip
								And Popover</span> <span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="typography.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Typography</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="notification.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Notifications</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
				</ul></li>
		</ul>
		<ul class="pcoded-item pcoded-left-item">
			<li class="pcoded-hasmenu"><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layout-grid2-alt"></i><b>BC</b></span> <span
					class="pcoded-mtext">생산</span> <span class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class=" "><a href=""
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">생산계획 관리</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="ProduceCommandDList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">생산계획 조회</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href=""
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">생산지시 관리</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href=""
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">생상지시 조회</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href=""
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">공정이동표 발행</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href=""
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">생산 모니터링</span> <span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="ProcessResultList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">공정실적 관리</span> <span class="pcoded-mcaret"></span>
					</a></li>
				</ul></li>
		</ul>
		<div class="pcoded-navigation-label">Forms</div>
		<ul class="pcoded-item pcoded-left-item">
			<li class=""><a href="form-elements-component.html"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layers"></i><b>FC</b></span> <span class="pcoded-mtext">Form</span>
					<span class="pcoded-mcaret"></span>
			</a></li>
		</ul>
		<div class="pcoded-navigation-label">Tables</div>
		<ul class="pcoded-item pcoded-left-item">
			<li class=""><a href="bs-basic-table.html"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-receipt"></i><b>B</b></span> <span class="pcoded-mtext">Table</span>
					<span class="pcoded-mcaret"></span>
			</a></li>
		</ul>
		<div class="pcoded-navigation-label">Chart And Maps</div>
		<ul class="pcoded-item pcoded-left-item">
			<li class=""><a href="chart-morris.html"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-bar-chart-alt"></i><b>C</b></span> <span class="pcoded-mtext">Charts</span>
					<span class="pcoded-mcaret"></span>
			</a></li>
			<li class=""><a href="map-google.html"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-map-alt"></i><b>M</b></span> <span class="pcoded-mtext">Maps</span>
					<span class="pcoded-mcaret"></span>
			</a></li>
		</ul>
		<div class="pcoded-navigation-label">Pages</div>
		<ul class="pcoded-item pcoded-left-item">
			<li class="pcoded-hasmenu "><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-id-badge"></i><b>A</b></span> <span class="pcoded-mtext">Pages</span>
					<span class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class=""><a href="auth-normal-sign-in.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Login</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="auth-sign-up.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Registration</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="sample-page.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-layout-sidebar-left"></i><b>S</b></span> <span
							class="pcoded-mtext">Sample Page</span> <span
							class="pcoded-mcaret"></span>
					</a></li>
				</ul></li>
				
		</ul>
	</div>
</nav>