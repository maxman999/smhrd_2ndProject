<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<style>
.la {
   display: block;
   margin: 6em 0 4em 50em;
}

#jb {
   margin: 1em 0 5em 36em;
}


input[type="radio"] {
   border: 1px solid black !important;
   width: 20px !important;
   height: 20px !important;
   border-radius: 10px !important;
}

input[type="radio"]:checked {
   background-color: grey !important;
}

table#jot {
   margin : auto;
   width: 2000px;
   }

tr{
   align="center"
}


#joinn {
   margin: 0 0 0 15em;
   padding: 5vw 0 0 0;
}


input[type='password'], input[type='text']{
   margin: 0px !important;
}
table{
   width: 800px !important;
   margin: 0px auto !important;
}   
#main-wrapper{
   width: 100% !important;
   margin: 0px auto !important;
   text-align: center !importnat;
}

td.td1 {
    text-align: left;
}

input#age {
    width: 210px;
}

input#idCheck {
    background-color: white;
}
input.qjxmsdlek {
    background-color: white;
}
</style>

<%@ include file="header.jsp"%>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="jquery-3.5.1.min.js"></script>

<!-- Main -->
<!-- <div id="main-wrapper"> -->
<!--id="sideup"  -->
   <div style="text-align: center !important; background-color: white;">
      <!-- Menu -->
      <!-- <nav id="menu"> -->
      <h2 id="joinn" style="margin: 0px auto !important; width: 100% !important; text-align: center !important;">회원가입</h2>
         <form style="width: 100% !important; margin: 0px auto !important;" action="JoinService.do" method="post" name="join">
      <table style="margin: 0px auto !important;">
            <tr>
               <td><b>ID</b></td>
               <td><input type="text" id="ID" name="id"placeholder="ID를 입력하세요"></td>
               <td style="text-align:left;"><input type="button" value="중복확인" id="idCheck"></td>
            </tr>
            <tr>
               <td><b>PW</b></td>   
               <td colspan="2"><input type="password" name="pw" id="pw" placeholder="PW를 입력하세요"></td>
            </tr>

               <tr>
                  <td><b>이름</b></td>
                  <td colspan="2"><input type="text" name="name" id="name"
                     placeholder="이름을 입력하세요"></td>
               </tr>


               <tr class="tr1">
                  <td><b>나이</b></td>
                  <td class="td1" colspan="2"><input type="number" name="age" id="age"
                     placeholder="나이를 입력하세요"></td>
               </tr>


               <tr class="tr1">
                  <td><b>지역</b></td>
                  <td class="td1" colspan="2"><select name="location" id="location" style="margin-left: 0px;width: 210px;">
                        <option value="">선택해주세요</option>
                        <option>서울특별시</option>
                        <option>부산광역시</option>
                        <option>광주광역시</option>
                        <option>대구광역시</option>
                        <option>인천광역시</option>
                        <option>울산광역시</option>
                        <option>대전광역시</option>
                        <option>세종특별자치시</option>
                        <option>경기도</option>
                        <option>강원도</option>
                        <option>충청북도</option>
                        <option>충청남도</option>
                        <option>전라북도</option>
                        <option>전라남도</option>
                        <option>경상북도</option>
                        <option>경상남도</option>
                        <option>제주특별자치도</option>
                        </td>
               </tr>

               <tr class="tr1">
                  <td><b>마지막 생리일</b></td>
                  <td class="td" style="text-align: left;"><input type="date" id="birthday" name="preg_day" style="width: 210px;"></td>
                  <script type="text/javascript">
                     $('#birthday').change(function(){
                        console.log($('#birthday').val());
                     })
                     
                  </script>
   
                  <td style="text-align:left;"><input type="button" id = "button" value="출산예정일 계산" class="qjxmsdlek"></td>
                  <script type="text/javascript">
                  $('#button').click(function(){
                     var dt = new Date($('#birthday').val());
                     dt.setDate(dt.getDate()+7);
                     dt.setMonth(dt.getMonth()+9);// 출산예정일 계산 : 마지막 생리일 기준 월+9, 일+7
                     dt.setFullYear(dt.getFullYear());
                     var bdate = $('#endDate').val(dt.getFullYear()+'-'+(dt.getMonth()+1)+'-'+dt.getDate());
                     sessionStorage.setItem("bdate", bdate);
                  });
                  </script>

               </tr >
               <tr class="tr1">
                  <td><b>출산 예정일</b></td>
                  <td  class="td1" colspan="2"><input type="text" id="endDate"></td>
                  
               </tr>
               
               <tr class="tr1">
                  <td><b>성별</b></td>
                  <td class="td1" colspan="2"><input type="radio" name="sex" id="sex" value="남자">남자
                     <input type="radio" name="sex" id="sex" value="여자">여자</td>
               </tr>
            </table>

            <input type="button" value="가입하기" onclick="memberjoin()"
               id="join_btn" class="qjxmsdlek"> <input type="reset" value="취소"
               onclick="javascript:window.location='Main.jsp'" class="qjxmsdlek">
         </form>
   <!-- </div> -->
</div>

<%@ include file="footer.jsp"%>

<script type="text/javascript">
   function memberjoin() {
      if (join.id.value == "") {
         alert("아이디를 입력하세요");
         join.id.focus();
         return;
      }
      if (join.pw.value == "") {
         alert("비밀번호를 입력하세요");
         join.pw.focus();
         return;
      }
      if (join.name.value == "") {
         alert("이름을 입력하세요");
         join.name.focus();
         return;
      }
      if (join.age.value == "") {
         alert("나이를 입력하세요");
         join.age.focus();
         return;
      }
      if (parseInt(join.age.value) <= 15) {
         alert("나이에 맞게 입력하세요");
         join.age.focus();
         return;
      }
      if (join.location.value == "") {
         alert("지역을 입력하세요");
         join.location.focus();
         return;
      }
      if (join.preg_day.value == "") {
         alert("임신일을 입력하세요");
         join.preg_day.focus();
         return;
      }
      if (join.sex.value == "") {
         alert("성별을 입력하세요");
         join.sex.focus();
         return;
      } else {
         $("#join_btn").click(function() {
            var id = $('#id').val();
            $.ajax({
               url : "IdCheck?id=" + id, //컨트롤러 URL
               type : 'GET',
               success : function(res) {

                  if (res == "true") {
                     alert('아이디 중복을 확인해주세요.');
                  } else {
                     alert('회원가입이 완료되었습니다.');
                     document.join.submit();
                  }
               }
            });
         });
         // 중복이 있으면 회원가입 안되게 
         /* alert("회원가입 되었습니다!");
         document.join.submit(); */
      }

   }
</script>

<script type="text/javascript">
   $("#idCheck").click(function() {
      var id = $('#ID').val();
      console.log(id);
      $.ajax({
         url : "IdCheck?id=" + id, //컨트롤러 URL
         type : 'GET',
         success : function(res) {
            
            if (res == "true") {
               alert('중복 아이디가 존재합니다.');
            } else {
               alert('아이디 사용 가능 합니다.');
            }
         }
      });
   })

   
      
   
</script>





</body>
</html>