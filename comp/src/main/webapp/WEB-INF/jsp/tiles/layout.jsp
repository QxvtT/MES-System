<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Material Able bootstrap admin template by Codedthemes</title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
    <meta name="author" content="Codedthemes" />
    <!-- Favicon icon -->
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <!-- waves.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/icon/themify-icons/themify-icons.css">
    <!-- font-awesome-n -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome-n.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
    <!-- scrollbar.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery.mCustomScrollbar.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- tui-date-picker.css, tui-grid.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tui/tui-date-picker.min.css">
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css">
	<!-- jquery toast message css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/toast/jquery.toast.min.css" />
    <!-- custom.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom.css">
    
    <!-- Required Jquery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery.min.js "></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-ui/jquery-ui.min.js "></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap/js/bootstrap.min.js "></script>
    <!-- waves js -->
    <script src="${pageContext.request.contextPath}/assets/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- slimscroll js -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.mCustomScrollbar.concat.min.js "></script>

    <!-- menu js -->
    <script src="${pageContext.request.contextPath}/assets/js/pcoded.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/vertical/vertical-layout.min.js "></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/script.js "></script>
    
    <!-- tui-date-picker, tui-grid js -->
    <script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	
	<!-- jquery toast message js -->
	<script src="${pageContext.request.contextPath}/js/toast/jquery.toast.min.js"></script>
	
	<!-- excel, print -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jQuery.print.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.table2excel.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/FileSaver.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/tableexport.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/xlsx.core.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/saveexcel.js"></script>
</head>

<body>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="loader-track">
            <div class="preloader-wrapper">
                <div class="spinner-layer spinner-blue">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
                <div class="spinner-layer spinner-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>

                <div class="spinner-layer spinner-yellow">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>

                <div class="spinner-layer spinner-green">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">
        	<tiles:insertAttribute name="header" />
            

            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                	<tiles:insertAttribute name="left" />
                    
                    <div class="pcoded-content">
                    <tiles:insertAttribute name="body" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Warning Section Starts -->
    <!-- Older IE warning message -->
    <!--[if lt IE 10]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="${pageContext.request.contextPath}/assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="${pageContext.request.contextPath}/assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="${pageContext.request.contextPath}/assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="${pageContext.request.contextPath}/assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="${pageContext.request.contextPath}/assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
    <!-- Warning Section Ends -->

</body>

</html>