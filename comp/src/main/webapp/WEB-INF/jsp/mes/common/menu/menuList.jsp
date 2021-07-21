<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title><spring:message code="comUatUia.title" /></title><!-- 로그인 -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<script type="text/javaScript" language="javascript">
$(function() {
	$.ajax({
		async: false,
		url : "${pageContext.request.contextPath }/common/menu/selectMenuList",
		type : "get",
		data : {uniqId: "${loginVO.uniqId}"},
		dataType: "json",
		success : function(result){
			let tag = '<div class=""><div class="main-menu-header"><div style="height: 9px"></div><div class="user-details pt-3 pb-3">';
			tag = tag + '<c:if test="${!empty loginVO}"><span id="more-details">${loginVO.name}(${loginVO.id})</span></c:if></div></div></div>';
			console.log(result);
			for(let i in result) {
				if(i == 0) {
					continue;
				}
				if(result[i].chkURL == 'dir') {
					if(i > 1) {
						tag = tag + '</ul></li></ul>';
					}
					tag = tag + '<ul class="pcoded-item pcoded-left-item"><li class="pcoded-hasmenu">';
					tag = tag + '<a href="javascript:void(0)"class="waves-effect waves-dark"> <span class="pcoded-micon">';
					tag = tag + '<i class="ti-layout-grid2-alt"></i><b>BC</b></span>';
					tag = tag + '<span class="pcoded-mtext">'+ result[i].menuNm +'</span> <span class="pcoded-mcaret"></span></a>';
					tag = tag + '<ul class="pcoded-submenu">';
				} else {
					tag = tag + '<li class=" "><a href="${pageContext.request.contextPath }' + result[i].chkURL + '" class="waves-effect waves-dark">'
					tag = tag + '<span class="pcoded-micon"><i class="ti-angle-right"></i></span>'
					tag = tag + '<span class="pcoded-mtext">' + result[i].menuNm + '</span>'
					tag = tag + '<span class="pcoded-mcaret"></span></a></li>';
				}
				if(i == result.length-1) {
					tag = tag + '</ul></li></ul>';
				}
				
			}
			console.log("aaaaaaa");
			console.log(tag);
			$('#test').html(tag);
			
		} // end success
	}); // end ajax 
	
	//현재페이지의 메뉴창 열려있게 처리
	let aTags = $(".pcoded-item > li > ul.pcoded-submenu > li > a");
	let menu;
	for(let i=0; i<aTags.length; i++)  {
		console.log(aTags[i].href);
		if(aTags[i].href == window.location.href) {
			menu = aTags.eq(i).closest(".pcoded-item > li").eq(0);
			
			menu.closest('.pcoded-inner-navbar').find('li.pcoded-trigger').removeClass('pcoded-trigger');
			menu.addClass('pcoded-trigger');
			menu.children('.pcoded-submenu').slideDown();
			
		}
	}
	
	
});

</script>
</head>
<nav class="pcoded-navbar">
	<div class="sidebar_toggle">
		<a href="#"><i class="icon-close icons"></i></a>
	</div>
	<div class="pcoded-inner-navbar main-menu" id="test">
		<%--
		<div class=""><div class="main-menu-header"><div style="height: 9px"></div><div class="user-details pt-3 pb-3"><span id="more-details">성조장(C01)<i class="fa fa-caret-down"></i></span></div></div><div class="main-menu-content"><ul><li class="more-details"><a href="user-profile.html"><i class="ti-user"></i>View Profile</a> <a href="#!"><i class="ti-settings"></i>Settings</a> <a href="/comp/uat/uia/actionLogout.do"><i class="ti-layout-sidebar-left"></i> Logout </a></ul></div></div><ul class="pcoded-item pcoded-left-item"><li class="pcoded-hasmenu"><a href="javascript:void(0)"class="waves-effect waves-dark"> <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i><b>BC</b></span><span class="pcoded-mtext">생산관리</span> <span class="pcoded-mcaret"></span></a><ul class="pcoded-submenu"><li class=" "><a href="/comp/prd/pln/PrdPlnMng.do" class="waves-effect waves-dark"><span class="pcoded-micon"><i class="ti-angle-right"></i></span><span class="pcoded-mtext">생산계획 관리</span><span class="pcoded-mcaret"></span></a></li><li class=" "><a href="/comp/prd/pln/PrdPlanList.do" class="waves-effect waves-dark"><span class="pcoded-micon"><i class="ti-angle-right"></i></span><span class="pcoded-mtext">생산계획 조회</span><span class="pcoded-mcaret"></span></a></li><li class=" "><a href="/comp/prd/com/PrdComMng.do" class="waves-effect waves-dark"><span class="pcoded-micon"><i class="ti-angle-right"></i></span><span class="pcoded-mtext">생산지시 관리</span><span class="pcoded-mcaret"></span></a></li><li class=" "><a href="/comp/prd/com/PrdComList.do" class="waves-effect waves-dark"><span class="pcoded-micon"><i class="ti-angle-right"></i></span><span class="pcoded-mtext">생산지시 조회</span><span class="pcoded-mcaret"></span></a></li><li class=" "><a href="/comp/prd/com/ProcsMoveTbl.do" class="waves-effect waves-dark"><span class="pcoded-micon"><i class="ti-angle-right"></i></span><span class="pcoded-mtext">공정이동표 발행</span><span class="pcoded-mcaret"></span></a></li><li class=" "><a href="/comp/prd/mon/monitor.do" class="waves-effect waves-dark"><span class="pcoded-micon"><i class="ti-angle-right"></i></span><span class="pcoded-mtext">생산 모니터링</span><span class="pcoded-mcaret"></span></a></li><li class=" "><a href="/comp/prd/res/ProcsResMng.do" class="waves-effect waves-dark"><span class="pcoded-micon"><i class="ti-angle-right"></i></span><span class="pcoded-mtext">공정실적관리</span><span class="pcoded-mcaret"></span></a></li><li class=" "><a href="/comp/mac/machine/MacMng.do" class="waves-effect waves-dark"><span class="pcoded-micon"><i class="ti-angle-right"></i></span><span class="pcoded-mtext">설비관리</span><span class="pcoded-mcaret"></span></a></li></ul></li></ul>
	 	--%>
	</div>
</nav>
</html>


