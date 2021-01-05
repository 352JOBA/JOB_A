<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | 채용공고</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<style>
#topbanner {
	background:
		url(${pageContext.request.contextPath}/resources/images/job.jpg)
		no-repeat;
	background-position: center center;
	margin-top: 10px;
	height: 400px;
	display: flex;
}
	#topbanner-textarea {
		width: 40%;
		height: 50%;
		margin: auto;
		padding: auto;
		border : 1px solid black;
		display: flex;
		background : black;
		opacity : 0.4;
	}
	
	#topbanner-text {
		font-size: 40px;
		font-weight: 500;
		margin: auto;
		color: white;
	}
	
	#utilBox {
		width : 100%;
		height : 50px;
		margin-top : 50px;
	}
	
	#searchBox {
		width : 35%;
		height : 100%;
		float : left;
		margin-right : 10px;
	}
	
	#writeBtn {
		float: right;
	}
	
	#listArea {
		/*border: 1px solid blue;*/
		width : 100%;
		height : auto;
		margin: 40px auto auto auto;
	}
	
	.pagination {
		text-align: center;
		margin-top : 20px;
		margin-bottom : 100px;
	}
	
	#noticeList{
		text-align : center;
		margin: auto;
	}
	
	tbody>tr:hover {
		cursor: pointer;
		
	}
	
	tr>td{
		background : white;
	}
	
	tbody>tr:hover{
		background : black;
		opacity: 0.3;
	}
	
	#nonListArea {
		height : 600px;
		width : 100%;
		display : flex;
	}
	
	#nonListArea>p{
		height : auto;
		width : auto;
		margin : auto;
		font-size : 150%;
	}
	
	#category-border {
		border: 2px solid lightgray;
	}
	
	#categoty {
		padding-top: 10px;
		padding-left: 10px;
	}
</style>
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				<c:import url="../../common/header.jsp" />

				<!-- Top Banner Area -->
				<div id="topbanner">
					<div id="topbanner-textarea">
						<h3 id="topbanner-text">채용공고</h3>
					</div>
				</div>

				<!-- search / write area -->
				<div id="utilBox">
					<div id="searchBox">
						<input type="search" id="search" placeholder="검색내용을 입력해주세요."
							onKeyDown="enterKey();" />
					</div>
					<button type="button" id="searchBtn" onclick="search()">검색
					</button>
<%-- 					<c:if test="${ $member.gradeNo == 5 }" >
 --%>						<button id="writeBtn" onclick="goJobForm();">글쓰기</button>
<%-- 					</c:if>
 --%>				</div>
				<br />
				<!-- 카테고리 -->
<!-- 				<div id="category-border">
					<div id="categoty">
					<input type="checkbox" name="category_No" id="경영·사무" value="1" >
					<label for="경영·사무">경영·사무</label> &nbsp;&nbsp;&nbsp;
					
					<input type="checkbox" name="category_No" id="마케팅·광고·홍보" value="2" >
					<label for="마케팅·광고·홍보">마케팅·광고·홍보</label>&nbsp;&nbsp;&nbsp;
					
					<input type="checkbox" name="category_No" id="IT·미디어" value="3" >
					<label for="IT·미디어">IT·미디어</label>&nbsp;&nbsp;&nbsp;
					
					<input type="checkbox" name="category_No" id="영업" value="4" >
					<label for="영업">영업</label>&nbsp;&nbsp;&nbsp;
					
					<input type="checkbox" name="category_No" id="서비스" value="5" >
					<label for="서비스">서비스</label>&nbsp;&nbsp;&nbsp;
					<br />
					<input type="checkbox" name="category_No" id="연구개발" value="6" >
					<label for="연구개발">연구개발</label>&nbsp;&nbsp;&nbsp;
					
					<input type="checkbox" name="category_No" id="의료" value="7" >
					<label for="의료">의료</label>&nbsp;&nbsp;&nbsp;
					
					<input type="checkbox" name="category_No" id="건설" value="8" >
					<label for="건설">건설</label>&nbsp;&nbsp;&nbsp;
					
					<input type="checkbox" name="category_No" id="교육" value="9" >
					<label for="교육">교육</label>&nbsp;&nbsp;&nbsp;
					
					<input type="checkbox" name="category_No" id="생산·제조" value="10" >
					<label for="생산·제조">생산·제조</label>&nbsp;&nbsp;&nbsp;
					
					<input type="checkbox" name="category_No" id="무역·유통" value="11" >
					<label for="무역·유통">무역·유통</label>
					
					<button>해당 조건으로 검색</button>
					</div>
				</div> -->
						<!-- 게시물 리스트 -->
						<div id="listArea">
							<table id="noticeList">
								<thead>
									<th><center>No.</center></th>
									<th><center>
										<div >
											<a href="#" data-toggle="dropdown" class="dropdown-toggle" style="color: black; border-bottom: none;"> 직무 </a>
<!-- 											<ul class="dropdown-menu">
												<li>전체보기</li>
												<li>경영·사무</li>
												<li>마케팅·광고·홍보</li>
												<li>IT·미디어</li>
												<li>영업</li>
												<li>서비스</li>
												<li>연구개발</li>
												<li>의료</li>
												<li>건설</li>
												<li>교육</li>
												<li>생산·제조</li>
												<li>무역·유통</li>
											</ul> -->
										</div>
									</center></th>
									<th><center>제목</center></th>
									<th><center>작성자</center></th>
									<th><center>등록일</center></th>
									<th><center>조회수</center></th>
								</thead>
								<tbody>
									<c:forEach items="${ selectJobList }" var="job">
									<!--  onclick="selectOne();" -->
									<tr id="${job.board_No}">
										<td>${job.board_No}</td>
										<td>${job.category_Name }</td>
										<td>${job.board_Title}</td>
										<td>${job.mem_Nick}</td>
										<td>${job.board_Date}</td>
										<td>${job.board_View}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
							<!-- #listArea -->
						<center>
						<c:out value="${pageBar}" escapeXml="false"/>
						</center>

			</div>
		</div>
		<c:import url="../../common/sideBar.jsp" />
	</div>
	<c:choose>
		<c:when test="${ empty member }">
		<script>
				$(function() {
				$("div[class=tit]")
						.on(
								"click",function() {
									window.alert("로그인 후 이용해주세요");
								});
				});
		</script>
		</c:when>
		<c:when test="${ !empty member && member.gradeNo eq 3 || member.gradeNo eq  5 }">
		<script>
				$(function() {
				$("div[class=tit]")
						.on(
								"click",function() {
									window.alert("우수회원 이상 이용 가능합니다.");
								});
				});
		</script>
		</c:when>
		<c:otherwise>
		<script>
			$(function() {
				$("div[class=tit]")
						.on(
								"click",
								function() {
									var board_No = $(this).attr("id");
									console.log("board_No=" + board_No);
									location.href = "${pageContext.request.contextPath}/board2/jobSelectOne.do?board_No="
											+ board_No;
								});
			});
		</script>
		</c:otherwise>
	</c:choose>
	<script>

		
		function goJobForm() {
			location.href = "${pageContext.request.contextPath}/board2/jobForm.do";
		}

    	function search() {
			location.href="${pageContext.request.contextPath}/board2/searchJobList.do?keyword="+$('#search').val();

    	}
    	
    	function enterKey() {
    			if (event.keyCode==13){
    				location.href="${pageContext.request.contextPath}/board2/searchJobList.do?keyword="+$('#search').val();
    			}
    		}


	</script>	
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 -->			
</body>
</html>