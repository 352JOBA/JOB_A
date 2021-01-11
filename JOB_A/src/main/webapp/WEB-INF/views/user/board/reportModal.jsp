<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script type="text/javascript">
      $(function(){

        var modal = document.getElementById('myModal');
        
        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");
        
        // Get the <span> element that closes the modal
          var span = document.getElementsByClassName("close")[0];                                          
          
          // When the user clicks on the button, open the modal 
          btn.onclick = function() {
            console.log("zzz");
            modal.style.display = "block";
          }
          
          // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
              modal.style.display = "none";
            }
            
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
              if (event.target == modal) {
                modal.style.display = "none";
              }
            }
          }); 
      
      function test(obj){
          console.log(obj.value);
          }

       $('.submitBtn').click(function(){
          $('.reason1').val($(this).val());
          if(confirm("정말 신고하시겠습니까?") == true) {
             alert("신고 요청을 성공하였습니다.");
             $('#form1').submit();
             
             } else{
             alert("신고 요청을 취소하였습니다.");
                return;
                }
       
          });
            </script>
            <style type="text/css">
              /* The Modal (background) */
            .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

</style>
</head>
<body>
  <!-- Trigger/Open The Modal -->
  <button id="myBtn">Open Modal</button>
 
      <!-- The Modal -->
      <div  id="myModal" class="modal">

    
   
        <!-- Modal content-->
  
        <div class="modal-content">
  
          <div class="modal-header">
  
            <span class="close">&times;</span>  
            <h4 class="modal-title">신고 <h4> <!-- 사용자 지정 부분② : 타이틀 -->
  
          </div>
  
          <div class="modal-body">
            <form id="form1" action="${pageContext.request.contextPath}/insertReport.do" method="post">
  
           <!-- radio, checkbox가 안먹힘 : 템플릿에 먹혀서 그런거 같아서 일단 구현하려고 임시로 버튼 해놓음 -->
           <!-- <input type="hidden" class="reason1" name="reason" value=""/> -->
           <input type="hidden" class="modal_board" name="board2" value=""/>
           <input type="hidden" class="modal_board_no" name="board2_no" value=""/>
           <input type="hidden" class="modal_reporter" name="declare" value=""/>
              <!-- <p>신고 사유를 선택해주세요.</p> --> <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
              <div class="form-group">
               <label for="reportReason">신고 사유 선택</label>
               <select class="form-control" name="reason" id="reportReason">
                 <option class="reportConfirm" value="허위사실">허위 사실인 것 같아요!</option>
                 <option class="reportConfirm" value="음란물">문란하다고 생각합니다!</option>
                 <option class="reportConfirm" value="광고글">광고글인 것 같아요!</option>
                 <option class="reportConfirm" value="기타">기타</option>
            
               </select>
                <br />
                <br />
               <input type="submit" class="submitBtn" value="제출" />
             </div>
              <!-- <input type="button" class="reportBtn" value="허위사실">허위 사실인 것 같아요! <br>
              <input type="button" class="reportBtn" value="음란물">문란하다고 생각합니다!<br>
              <input type="button" class="reportBtn" value="광고글">광고글인 것 같아요!<br>
              <input type="button" class="reportBtn" value="욕설">욕설이 담겨져 있어요!<br>
              <input type="button" class="reportBtn" value="기타"/> -->
      <!--         <input type="button" class="reportBtn" name="reason" value="">기타 <input type="text"><br> -->
              
            </form>
          </div>
  
  
        </div>
  
      </div>
 </body>