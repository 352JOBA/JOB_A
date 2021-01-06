<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
		rel="stylesheet">
<title>JOB_A | 검색 결과</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
#topbanner {
	background:
		url(${pageContext.request.contextPath}/resources/images/com.jpg)
		no-repeat;
	background-position: center center;
	margin-top: 10px;
	height: 400px;
	display: flex;
}

.tit:hover {
	cursor: pointer;
}

p {
	padding-right: 20px !important;
	margin: 0 !important;
}

.wrap-info {
	position: relative;
	margin-top: 8px;
	font-size: 15px;
	color: gray;
}

.article-list .article-list-pre .pre-txt {
	display: -webkit-box;
	overflow: hidden;
	line-height: 1.33em;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	box-sizing: border-box;
	max-height: 40px;
	font-size: 17px;
	line-height: 1.43em;
	word-break: break-word;
}

.article-list .article-list-pre.attach-img-pre h3 {
	padding-right: 130px !important;
}

.article-list .article-list-pre.attach-img-pre .pre-txt {
	padding-right: 130px !important;
}

.attach-img {
	position: relative;
	display: inline-block;
	margin-top: 54px;
	margin-right: 24px;
}

#nonListArea {
		height : 300px;
		width : 10%;
		text-align: center;
		display: table-cell;
		vertical-align: middle;
	}
#nonListArea>div{
	display: inline-block;
}

#nonListArea>div>p{
	font-size : 35px;
}
</style>
</head>
<body class="is-preload">
	<!-- 사용 스크립트 선언 -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
 

	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<c:import url="../common/header.jsp" />
				
				<!-- Top Banner Area -->
				<div id="topbanner">
					<div id="topbanner-textarea">
						<h3 id="topbanner-text">전체 검색</h3>
					</div>
				</div>
				
				<section class="container">
					<div class="wrapped">
						<div role="main" class="contents">
							
							 <c:if test="${empty searchList}">
							<div id="nonListArea">
								<div>
								<p> ₊·*◟(⌯ˇ ɞ ˇ⌯)◜‧*<br>검색된 결과가 없네 <br>✧*｡٩(ˊᗜˋ*)و✧*｡ </p>
								</div>
							</div>
							</c:if> 
							<div class="article-list">
								<c:forEach items="${searchList}" var="blah">
									<div class="article-list-pre">
										<div class="tit" id="${search.board_No}">
											<p style="display: none;">${search.board_No }</p>
											<h3 class="hh">${search.board_Title}</h3>
											<div class="pre-txt">${search.board_Content}</div>
										</div>
										<div class="sub">
											<p class="name" style="padding-top: 2em;">${search.mem_Nick}</p>
											<div class="wrap-info">
												<i class="far fa-eye"> ${search.board_View }</i> <i
													class="far fa-comment"> ${search.comm_Count }</i>
												<div class="info_fnc">
													${search.board_Date} <i class="far fa-bookmark" id="bookmark"></i>
												</div>
											</div>
										</div>
									</div>
<%-- 									<c:if test="${b.file_Count > 0}">
										<div class="article-list-pre attach-img-pre">
											<div class="tit" id="${search.board_No}">
												<p style="display: none;">${search.board_No }</p>
												<h3 class="hh">${search.board_Title}</h3>
												<div class="pre-txt">${search.board_Content}</div>
												<span class="attach-img"> <img src="http://localhost:8087/joba/resources/uplaodFiles/board/20210104_023203_730.png">
												</span>
											</div>
											<div class="sub">
												<p class="name">${search.mem_Nick}</p>
												<div class="wrap-info">
													<i class="far fa-eye"> ${search.board_View }</i> <i
														class="far fa-comment"> ${search.comm_Count }</i>
													<div class="info_fnc">
														${search.board_Date} <i class="far fa-bookmark"
															id="bookmark"></i>
													</div>
												</div>
											</div>
										</div>
									</c:if> --%>
								</c:forEach>
							</div>
						</div>
					</div>
					<br /> <br />
					<center>
						<c:out value="${pageBar}" escapeXml="false" />
					</center>

				</section>
				
			</div>
		</div>
		<c:import url="../common/sideBar.jsp" />
	</div>
	
</body>
</html>