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
                 			 <h2 id="updatett">"<%=info.getUser_id()%>"���� ȸ������ ����</h2>
                              <table id="updatetb">
                              <tr>
                                    <td class="updatee"><b>�̸�</b></td>
                                    <td><input type="text" name="name" class="tabletrupdate" placeholder="�ٲ� �̸��� �Է��ϼ���"></td>
                                 </tr>
                                 <tr>
                                    <td class="updatee"><b>��й�ȣ</b></td>
                                    <td><input type="password" name="pw" class="tabletrupdate" placeholder="�ٲ� ��й�ȣ�� �Է��ϼ���"></td>
                                 </tr>
                                 <tr>
                                    <td class="updatee"><b>����</b></td>
                                    <td><select name="location" id="locainput">
                                    	  <option value="">������ �������ּ���</option>
                                          <option>����Ư����</option>
                                          <option>���ֱ�����</option>
                                          <option>�λ걤����</option>
                                          <option>��õ��</option>
                                          <option>���ֵ�</option>
                                    </select></td>
                                 </tr>
                                 <tr>
                                    <td class="updatee" id="preginput"><b>�ӽ���</b></td>
                                    <td><input type="date" name="preg_day" id="preginput"></td>
                                 </tr>
                              </table>
                                    <input type="button" value="Ȯ��" onclick="memberModify()" class="updatebt" id="updateghkr">
                                    <input type="reset" value="���" onclick="javascript:window.location='Main.jsp'" class="updatebt" id="updatecnl">
                           </form>
                           <script>
                              function memberModify(){
                                 if(reg_frm.name.value==""){
                                    alert("�̸��� �Է��ϼ���.");
                                    regForm.name.focus();
                                    return;
                                 }
                                 if(reg_frm.pw.value==""){
                                    alert("��й�ȣ�� �Է��ϼ���.");
                                    regForm.pw.focus();
                                    return;
                                 }
                                 if(reg_frm.location.value==""){
                                    alert("������ �Է��ϼ���.");
                                    regForm.location.focus();
                                    return
                                 }
                                 if(reg_frm.preg_day.value==""){
                                    alert("�ӽ� ��¥�� �Է��ϼ���.");
                                    regForm.preg_day.focus();
                                    return
                                 }
                                 else{
                                    alert("ȸ�� �������� �Ǿ����ϴ�.");
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