<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style>
form#reg_frm {
    margin: 0 0 5vw 20vw;
}

#updatid {
	 margin: 0 0 2vw 0;
}


.updatee{
	margin : 0 0 0 0vw;
	border-left: groove;
	border-top: groove;
    border-left-color: #608857;
    border-top-color : #608857;
    font-size : large;
}

div#main-wrapper {
    background-color: hsla(120, 60%, 100%, 0.3);
}

h2#updatett {
    <%--margin: 0 0 0 4vw;--%>
    position: relative;
    left: 5vw;
}

table#updatetb {
    position: relative;
    left: 6vw;
    border-top: hidden;
    border-left: hidden;
}

input#preginput {
    margin: 0 0 0 5vw;
}

input.updatebt {
    background-color: white;
    border: groove;
    margin : 0 0 0 10vw;
    font-size : small;
}

input.tabletrupdate {
	position: relative;
	left : -25.5vw;
}

input#updateghkr {
	position: relative;
	left : 5vw;
}

input#updatecnl { 
	position: relative;
	right : 4vw;
}

select#locainput{
	position: relative;
    right: 5vw;
}

input#preginput {
	position: relative;
    right: 11vw;
}
</style>
	<%@ include file = "header.jsp" %>

         <div id="main-wrapper">
               <div class="container">
                  <div class="row gtr-200">
                          <form name ="reg_frm" action="UpdateService.do" method="post" id="reg_frm">
                 			 <h2 id="updatett">"<%=info.getUser_id()%>"님의 회원정보 수정</h2>
                              <table id="updatetb">
                              <tr>
                                    <td class="updatee"><b>이름</b></td>
                                    <td><input type="text" name="name" class="tabletrupdate" placeholder="바꿀 이름을 입력하세요"></td>
                                 </tr>
                                 <tr>
                                    <td class="updatee"><b>비밀번호</b></td>
                                    <td><input type="password" name="pw" class="tabletrupdate" placeholder="바꿀 비밀번호를 입력하세요"></td>
                                 </tr>
                                 <tr>
                                    <td class="updatee"><b>지역</b></td>
                                    <td><select name="location" id="locainput">
                                    	  <option value="">지역을 선택해주세요</option>
                                          <option>서울특별시</option>
                                          <option>광주광역시</option>
                                          <option>부산광역시</option>
                                          <option>순천시</option>
                                          <option>제주도</option>
                                    </select></td>
                                 </tr>
                                 <tr>
                                    <td class="updatee" id="preginput"><b>임신일</b></td>
                                    <td><input type="date" name="preg_day" id="preginput"></td>
                                 </tr>
                              </table>
                                    <input type="button" value="확인" onclick="memberModify()" class="updatebt" id="updateghkr">
                                    <input type="reset" value="취소" onclick="javascript:window.location='Main.jsp'" class="updatebt" id="updatecnl">
                           </form>
                           <script>
                              function memberModify(){
                                 if(reg_frm.name.value==""){
                                    alert("이름을 입력하세요.");
                                    regForm.name.focus();
                                    return;
                                 }
                                 if(reg_frm.pw.value==""){
                                    alert("비밀번호를 입력하세요.");
                                    regForm.pw.focus();
                                    return;
                                 }
                                 if(reg_frm.location.value==""){
                                    alert("지역을 입력하세요.");
                                    regForm.location.focus();
                                    return
                                 }
                                 if(reg_frm.preg_day.value==""){
                                    alert("임신 날짜를 입력하세요.");
                                    regForm.preg_day.focus();
                                    return
                                 }
                                 else{
                                    alert("회원 정보수정 되었습니다.");
                                    document.reg_frm.submit();
                                 }
                                 
                                 
                              }
                           </script>
                     </div>
                  </div>
               </div>

         <%@ include file = "footer.jsp" %>


      <!-- Scripts -->

         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>

   </body>
</html>