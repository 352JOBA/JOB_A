<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 등록</title>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
<body class="vertical  dark  ">
	<div class="wrapper">
		<!-- 헤더 -->
		<c:import url="../common/navbar.jsp" />
		<!-- 사이드 바 -->
		<c:import url="../common/sidebar.jsp" />
		<section>
			<main role="main" class="main-content">
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-12">
						<h2 class="page-title">관리자 등록</h2>
							<div class="row">
							<div class="col-md-6 my-4">
								<div class="card shadow">
									<div class="card-body">
										<form action="${pageContext.request.contextPath }/admin/adminEnroll" method="post">
											<div class="form-group row">
												<label for="adminId" class="col-sm-3 col-form-label">사번</label>
												<div class="col-sm-5">
													<input type="text" class="form-control userInputId" id="adminId"
														name="adminId" onkeyup="enroll(this.value)">
												</div>
												<!-- 아이디 중복검사 --> &nbsp;
											<button type="button" class="btn btn-primary duplicateCheck" name="idDuplicateCheck" id="idDuplicateCheck">중복확인</button>
											</div>
											<div class="form-group row">
												<label for="adminPw" class="col-sm-3 col-form-label">비밀번호</label>
												<div class="col-sm-5">
													<input type="password" class="form-control" id="adminPw"
														name="adminPw" placeholder="초기 비밀번호는 사번으로 설정됩니다">
												</div>
											</div>
											<div class="form-group row">
												<label for="adminName" class="col-sm-3 col-form-label">이름</label>
												<div class="col-sm-5">
													<input class="form-control" id="adminName" type="text"
														name="adminName">
												</div>
											</div>
											<fieldset class="form-group">
												<div class="row">
													<label for="adminPhone"
														class="col-form-label col-sm-3 pt-0">연락처</label>
													<div class="col-sm-5">
														<input class="form-control input-phoneus" id="adminPhone" name="adminPhone" maxlength="14" required>
													</div>
												</div>
											</fieldset>
											<div class="form-group row">
												<label for="adminEmail" class="col-sm-3 col-form-label">이메일</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" id="adminEmail"
														name="adminEmail" placeholder="사번이 아이디로 사용됩니다">
												</div> @job-jo8a.com
											</div>
											<div>
												<input type="hidden" name="gradeNo" value="1" />
											</div>
											
											<div class="form-group mb-2">
												<button type="submit" class="btn btn-primary">등록</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</section>
	</div>

	<script>
		// 같은값 입력받기
		function enroll(val) {
			document.getElementById('adminPw').value = val;
			document.getElementById('adminEmail').value = val;
		}

		$('.input-phoneus').mask('000-0000-0000');



		/* 아이디 중복 체크 */
		$(".duplicateCheck").click(function(){
			var memId = $(".userInputId").val();
			
				if(memId == null || memId == ""){
					alert("사번을 입력해주세요!!");	
							
					} else{ // else 시작하는 부분
						
			console.log("userInputId : " + memId);

			$.ajax({
				url  : "${pageContext.request.contextPath}/member/idCheckDuplicate.do",
				data : {memId:memId},
		        dataType: "json",
		        success : function(data){
		        console.log(data);

		        if(data.checkId==true){
					alert("등록 가능한 사번입니다.");
					$(".check_Id").val('true');
					
			        } else{
						alert("이미 등록된 아이디입니다.");
				        }
				}
				});
						} // else 닫는 부분
			});
	</script>
</body>
</html>