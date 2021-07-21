<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar header-navbar pcoded-header">
                <div class="navbar-wrapper">
                    <div class="navbar-logo">
                        <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                            <i class="ti-menu"></i>
                        </a>
                        <!-- <div class="mobile-search waves-effect waves-light">
                            <div class="header-search">
                                <div class="main-search morphsearch-search">
                                    <div class="input-group">
                                        <span class="input-group-prepend search-close"><i class="ti-close input-group-text"></i></span>
                                        <input type="text" class="form-control" placeholder="Enter Keyword">
                                        <span class="input-group-append search-btn"><i class="ti-search input-group-text"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <a href="${pageContext.request.contextPath}/main.do">
                            <h4 class="pr-3 pl-3 mr-3 ml-3">mes system</h4>
                            <%--<img class="img-fluid" src="${pageContext.request.contextPath}/assets/images/logo.png" alt="Theme-Logo" /> --%>
                        </a>
                        <a class="mobile-options waves-effect waves-light">
                            <i class="ti-more"></i>
                        </a>
                    </div>
                    <div class="navbar-container container-fluid">
                        <ul class="nav-left">
                            <li>
                                <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                            </li>
                            <li>
                                <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                                    <i class="ti-fullscreen"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav-right">
                            <c:if test="${empty loginVO}">
                            <li>
                                <a href="${pageContext.request.contextPath}/uat/uia/egovLoginUsr.do">
                                   <span>Login</span>
                                </a>
                            </li>
							</c:if>
                            <li class="user-profile header-notification">
                            	<c:if test="${!empty loginVO}">
	                                <a href="#!" class="waves-effect waves-light">
	                                     <%--<img src="${pageContext.request.contextPath}/assets/images/avatar-4.jpg" class="img-radius" alt="User-Profile-Image"> --%>
                                    <span>${loginVO.name}(${loginVO.id})</span>
                                    <i class="ti-angle-down"></i>
	                                </a>
								</c:if>
                                <ul class="show-notification profile-notification">
                                    <li class="waves-effect waves-light">
                                    <a href="${pageContext.request.contextPath }/uat/uia/actionLogout.do">
                                    	<i class="ti-layout-sidebar-left"></i> Logout
                                    </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>