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
      <h2 id="joinn" style="margin: 0px auto !important; width: 100% !important; text-align: center !important;">ȸ������</h2>
         <form style="width: 100% !important; margin: 0px auto !important;" action="JoinService.do" method="post" name="join">
      <table style="margin: 0px auto !important;">
            <tr>
               <td><b>ID</b></td>
               <td><input type="text" id="ID" name="id"placeholder="ID�� �Է��ϼ���"></td>
               <td style="text-align:left;"><input type="button" value="�ߺ�Ȯ��" id="idCheck"></td>
            </tr>
            <tr>
               <td><b>PW</b></td>   
               <td colspan="2"><input type="password" name="pw" id="pw" placeholder="PW�� �Է��ϼ���"></td>
            </tr>

               <tr>
                  <td><b>�̸�</b></td>
                  <td colspan="2"><input type="text" name="name" id="name"
                     placeholder="�̸��� �Է��ϼ���"></td>
               </tr>


               <tr class="tr1">
                  <td><b>����</b></td>
                  <td class="td1" colspan="2"><input type="number" name="age" id="age"
                     placeholder="���̸� �Է��ϼ���"></td>
               </tr>


               <tr class="tr1">
                  <td><b>����</b></td>
                  <td class="td1" colspan="2"><select name="location" id="location" style="margin-left: 0px;width: 210px;">
                        <option value="">�������ּ���</option>
                        <option>����Ư����</option>
                        <option>�λ걤����</option>
                        <option>���ֱ�����</option>
                        <option>�뱸������</option>
                        <option>��õ������</option>
                        <option>��걤����</option>
                        <option>����������</option>
                        <option>����Ư����ġ��</option>
                        <option>��⵵</option>
                        <option>������</option>
                        <option>��û�ϵ�</option>
                        <option>��û����</option>
                        <option>����ϵ�</option>
                        <option>���󳲵�</option>
                        <option>���ϵ�</option>
                        <option>��󳲵�</option>
                        <option>����Ư����ġ��</option>
                        </td>
               </tr>

               <tr class="tr1">
                  <td><b>������ ������</b></td>
                  <td class="td" style="text-align: left;"><input type="date" id="birthday" name="preg_day" style="width: 210px;"></td>
                  <script type="text/javascript">
                     $('#birthday').change(function(){
                        console.log($('#birthday').val());
                     })
                     
                  </script>
   
                  <td style="text-align:left;"><input type="button" id = "button" value="��꿹���� ���" class="qjxmsdlek"></td>
                  <script type="text/javascript">
                  $('#button').click(function(){
                     var dt = new Date($('#birthday').val());
                     dt.setDate(dt.getDate()+7);
                     dt.setMonth(dt.getMonth()+9);// ��꿹���� ��� : ������ ������ ���� ��+9, ��+7
                     dt.setFullYear(dt.getFullYear());
                     var bdate = $('#endDate').val(dt.getFullYear()+'-'+(dt.getMonth()+1)+'-'+dt.getDate());
                     sessionStorage.setItem("bdate", bdate);
                  });
                  </script>

               </tr >
               <tr class="tr1">
                  <td><b>��� ������</b></td>
                  <td  class="td1" colspan="2"><input type="text" id="endDate"></td>
                  
               </tr>
               
               <tr class="tr1">
                  <td><b>����</b></td>
                  <td class="td1" colspan="2"><input type="radio" name="sex" id="sex" value="����">����
                     <input type="radio" name="sex" id="sex" value="����">����</td>
               </tr>
            </table>

            <input type="button" value="�����ϱ�" onclick="memberjoin()"
               id="join_btn" class="qjxmsdlek"> <input type="reset" value="���"
               onclick="javascript:window.location='Main.jsp'" class="qjxmsdlek">
         </form>
   <!-- </div> -->
</div>

<%@ include file="footer.jsp"%>

<script type="text/javascript">
   function memberjoin() {
      if (join.id.value == "") {
         alert("���̵� �Է��ϼ���");
         join.id.focus();
         return;
      }
      if (join.pw.value == "") {
         alert("��й�ȣ�� �Է��ϼ���");
         join.pw.focus();
         return;
      }
      if (join.name.value == "") {
         alert("�̸��� �Է��ϼ���");
         join.name.focus();
         return;
      }
      if (join.age.value == "") {
         alert("���̸� �Է��ϼ���");
         join.age.focus();
         return;
      }
      if (parseInt(join.age.value) <= 15) {
         alert("���̿� �°� �Է��ϼ���");
         join.age.focus();
         return;
      }
      if (join.location.value == "") {
         alert("������ �Է��ϼ���");
         join.location.focus();
         return;
      }
      if (join.preg_day.value == "") {
         alert("�ӽ����� �Է��ϼ���");
         join.preg_day.focus();
         return;
      }
      if (join.sex.value == "") {
         alert("������ �Է��ϼ���");
         join.sex.focus();
         return;
      } else {
         $("#join_btn").click(function() {
            var id = $('#id').val();
            $.ajax({
               url : "IdCheck?id=" + id, //��Ʈ�ѷ� URL
               type : 'GET',
               success : function(res) {

                  if (res == "true") {
                     alert('���̵� �ߺ��� Ȯ�����ּ���.');
                  } else {
                     alert('ȸ�������� �Ϸ�Ǿ����ϴ�.');
                     document.join.submit();
                  }
               }
            });
         });
         // �ߺ��� ������ ȸ������ �ȵǰ� 
         /* alert("ȸ������ �Ǿ����ϴ�!");
         document.join.submit(); */
      }

   }
</script>

<script type="text/javascript">
   $("#idCheck").click(function() {
      var id = $('#ID').val();
      console.log(id);
      $.ajax({
         url : "IdCheck?id=" + id, //��Ʈ�ѷ� URL
         type : 'GET',
         success : function(res) {
            
            if (res == "true") {
               alert('�ߺ� ���̵� �����մϴ�.');
            } else {
               alert('���̵� ��� ���� �մϴ�.');
            }
         }
      });
   })

   
      
   
</script>





</body>
</html>