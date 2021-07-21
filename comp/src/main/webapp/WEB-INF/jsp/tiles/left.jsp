<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/mes/common/menu/menuList.jsp"/>
<%--<nav class="pcoded-navbar">
	<div class="sidebar_toggle">
		<a href="#"><i class="icon-close icons"></i></a>
	</div>
	<div class="pcoded-inner-navbar main-menu">
		<div class="">
			<div class="main-menu-header">
				<div style="height: 9px"></div>
				<div class="user-details pt-3 pb-3">
					<c:if test="${!empty loginVO}">
					<span id="more-details">
						${loginVO.name}(${loginVO.id})
						<i class="fa fa-caret-down"></i></span>
					</c:if>
				</div>
			</div>
			<div class="main-menu-content">
				<ul>
					<li class="more-details"><a href="user-profile.html"><i
						class="ti-user"></i>View Profile</a> <a href="#!"><i
						class="ti-settings"></i>Settings</a> 
						<a href="${pageContext.request.contextPath }/uat/uia/actionLogout.do">
                           	<i class="ti-layout-sidebar-left"></i> Logout
                        </a>
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
		<div class="pcoded-navigation-label">UI Element</div>
		<ul class="pcoded-item pcoded-left-item">
			<li class="pcoded-hasmenu"><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layout-grid2-alt"></i><b>BC</b></span> <span
					class="pcoded-mtext">관리</span> <span class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class=""><a href="${pageContext.request.contextPath }/sec/rmt/EgovRoleList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">롤관리</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath }/sec/ram/EgovAuthorList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">권한관리</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath }/sec/rgm/EgovAuthorGroupList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">권한그룹관리</span>
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
					<li class=" "><a href="${pageContext.request.contextPath }/sal/ord/OrderMList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">주문조회</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath }/sal/out/ItemHistoryList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">출고조회</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="${pageContext.request.contextPath }/sal/out/addItemHistoryView.do"
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
					class="pcoded-mtext">자재</span> <span class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class=" "><a href="${pageContext.request.contextPath }/mat/stc/MatStcList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">자재재고조회</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath }/mat/stc/MatLotStcList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">자재LOT재고 조회</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="${pageContext.request.contextPath }/mat/in/MatInMng.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">자재입고관리</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath }/mat/in/MatInList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">자재입고조회</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath }/mat/in/MatOutMng.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">자재출고관리</span>
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
					<li class=" "><a href="${pageContext.request.contextPath }/prd/pln/PrdPlnMng.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">생산계획 관리</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath }/prd/pln/PrdPlnList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">생산계획 조회</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="${pageContext.request.contextPath }/prd/com/PrdComMng.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">생산지시 관리</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath }/prd/com/PrdComList.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">생산지시 조회</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath }/prd/com/ProcsMoveTbl.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">공정이동표 발행</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath }/prd/mon/monitor.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">생산 모니터링</span> <span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath }/prd/res/ProcsResMng.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">공정실적 관리</span> <span class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath }/mac/machine/MacMng.do"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">설비관리</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
				</ul></li>
		</ul> 
	</div>
</nav>--%>