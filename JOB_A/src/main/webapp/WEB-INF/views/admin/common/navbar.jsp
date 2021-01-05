<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<head>
<!-- Simple bar CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/simplebar.css">
<!-- Fonts CSS -->
<link
	href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<!-- Icons CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/dropzone.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/uppy.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/jquery.steps.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/jquery.timepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/quill.snow.css">
<!-- Date Range Picker CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/daterangepicker.css">
<!-- App CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/app-light.css"
	id="lightTheme">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/app-dark.css"
	id="darkTheme" disabled>

<style>
	* {
   font-family: 'Do Hyeon', sans-serif !important;
	}
</style>	
</head>

<nav class="topnav navbar navbar-light">
        <button type="button" class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
          <i class="fe fe-menu navbar-toggler-icon"></i>
        </button>
        <!-- <form class="form-inline mr-auto searchform text-muted">
          <input class="form-control mr-sm-2 bg-transparent border-0 pl-4 text-muted" type="search" placeholder="Type something..." aria-label="Search">
        </form> -->
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link text-muted my-2" href="#" id="modeSwitcher" data-mode="dark">
              <i class="fe fe-sun fe-16"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-muted my-2" href="./#" data-toggle="modal" data-target=".modal-shortcut">
              <span class="fe fe-grid fe-16"></span>
            </a>
          </li>
          <!-- <li class="nav-item nav-notif">
            <a class="nav-link text-muted my-2" href="./#" data-toggle="modal" data-target=".modal-notif">
              <span class="fe fe-bell fe-16"></span>
              <span class="dot dot-md bg-success"></span>
            </a>
          </li> -->
          <div style="padding-top: 15px; padding-left: 10px;">
          	<a href="" style="text-decoration: none; ">
          		${member.memNick}&nbsp;관리자님 오늘도 수고링~!
          	</a>
          </div>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle text-muted pr-0" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="avatar avatar-sm mt-2">
                <img src="${pageContext.request.contextPath}/resources/admin/images/admin.png" alt="..." class="avatar-img rounded-circle">
              </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
              <a class="dropdown-item" href="#">Profile</a>
              <a class="dropdown-item" href="#">Settings</a>
            </div>
          </li>
        </ul>
      </nav>