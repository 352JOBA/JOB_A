<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>신고 댓글 리스트</title>
</head>
<body class="vertical  dark  ">
	<div class="wrapper">
		<!-- 헤더 -->
		<c:import url="../common/navbar.jsp" />
		<!-- 사이드 바 -->
		<c:import url="../common/sidebar.jsp" />

		<main role="main" class="main-content">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<h2 class="mb-2 page-title">COMMENT REPORT</h2>
						<div class="row">
							<!-- Striped rows -->
							<div class="col-md-12 my-4">
								<div class="card shadow">
									<div class="card-body">
										
										<!-- table -->
										<table class="table table-bordered" id="dataTable-1">
											<thead>
												<tr role="row" >
													<th>NO.</th>
													<th>댓글 내용</th>
													<th>게시글 작성자</th> <!-- 피신고자 : memNo2 -->
													<th>신고사유</th>
													<th>신고자</th> <!-- memNo -->
													<th>신고일</th>
													<th>상태</th>
												</tr>
									
											</thead>
											<tbody>
												<c:forEach items="${reportList}" var="m" varStatus="status"> 
													<tr onclick="location.href='${pageContext.request.contextPath}/boardReportDetail.do?boardNo=${m.boardNo}&reportReason=${m.reportReason}&appendantMemNick=${appendantList[status.index].memNick}&reporterMemNick=${reporterList[status.index].memNick}';">
														<td>${m.reportNo}</td>
														<td>${commentList[status.index].comm_Content }</td>
														<td>${appendantList[status.index].memNick}</td>
														<td>${m.reportReason }</td>
														<td>${reporterList[status.index].memNick}</td>
														<td>${m.reportDate}</td>
														<td> <!-- 토글버튼 -->
									
															<div class="custom-control custom-switch">
														<c:if test="${commentList[status.index].comm_Status eq 'Y'}">
																<input type="checkbox" class="custom-control-input" 
																		id="${commentList[status.index].comm_No}" disabled="disabled" name="statusY" checked>
																<label class="custom-control-label"
																 for="${commentList[status.index].comm_No}"></label>
														</c:if>
														
														<c:if test="${commentList[status.index].comm_Status eq 'N'}">
															<input type="checkbox" class="custom-control-input" 
																id="${commentList[status.index].comm_No}" disabled="disabled" >
															<label class="custom-control-label"
																for="${commentList[status.index].comm_No}"></label>
															</c:if>	 															
															</div>
															
														</td>
													</tr>
													<tr>
														<td colspan="7">
															<input type="text" value="여기에 댓글 내용 적을지 아님 해당 화면으로 넘기게 할지 정하기!" style="width: 100%;">
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- simple table -->
						</div>
						<!-- end section -->

					</div>
					<!-- .col-12 -->
				</div>
				<!-- .row -->
			</div>
			<!-- .container-fluid -->


		</main>
		<!-- main -->
	</div>
	<!-- .wrapper -->

	<script>
      $('#dataTable-1').DataTable(
      {
        autoWidth: true,
        "lengthMenu": [
          [16, 32, 64, -1],
          [16, 32, 64, "All"]
        ]
      });
    </script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/apps.js"></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
	<script>
      	window.dataLayer = window.dataLayer || [];

		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
		gtag('config', 'UA-56159088-1');

      	/*
      	$(document).ready(function(){
      	    $(".custom-control-input").change(function(){
      	        if($(".custom-control-input").is(":checked")){
      	            alert("체크박스 체크했음!");
      	        }else{
      	            alert("체크박스 체크 해제!");
      	        }
      	    });
      	});
      	*/
    </script>
	
<!-- 	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script type="text/javascript">

		function search(){
			var searchKey = $("#search").val();
			var searchCon = $("#inlineFormCustomSelectPref").val();
			
			if(searchKey == ""){
				Swal.fire({
	                title: "ʕ⁰̈●̫⁰̈ʔ..이러면 아모고토 검색할수가 없지",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			} else if(searchCon == ""){
				Swal.fire({
	                title: "ʕʘ●̫ʘʔ..근데 뭘로 검색해?",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			} else {
				location.href="${pageContext.request.contextPath}/user/userSearch?condition="+$('#inlineFormCustomSelectPref').val()+"&keyword="+$('#search').val();	
			}
			
		}
	</script> -->
</body>
</html>