<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

   <%@ include file = "header.jsp" %>
   
   


   <body class="is-preload left-sidebar">
      
         <!-- Main -->
            <div id="main-wrapper">
               <div class="container">
                  <div class="row gtr-200">
                        <div id="sidebar">

                           <!-- Sidebar -->



                     </div>
                     <div class="col-8 col-12-medium imp-medium">
                        <div id="content">

                           <!-- Content -->
                              <article>

                                 <h2 style= "margin-bottom: 0px;">���� �Ʊ⸦ ���� Ư�� ����! �±��ϱ�</h2>
                                 
                                 <table>
                                    <tr>
                                       <td class= "img_td">
                                          <img src ="flower.png" alt="����" width ="300"/><br>
                                          <input type="radio" name="choose"  value ="�ɹ��� ǥ��">�ɹ��� ǥ��
                                       </td>
                                       <td class= "img_td">
                                          <img src ="pastel.png" alt="����" width ="300"/>
                                          <input type="radio" name="choose" value ="�Ľ��� ǥ��">�Ľ��� ǥ��
                                       </td>
                                       <td class= "img_td">
                                          <img src ="animal.png" alt="����" width ="300"/>
                                          <input type="radio" name="choose" value ="���� �Ϸ���Ʈ ǥ��">���� �Ϸ���Ʈ ǥ��
                                       </td>
                                       <td class= "img_td">
                                          <img src ="noimage.jpg" alt="����" width ="300"/>
                                          <input type="radio" name="choose" value="���� ������ ǥ��">���� ������ ǥ��
                                       </td>
                                       
                                    </tr>
                                    <tr>
                                       <td colspan="4" style="font-size: 3em; padding-top: 0px; padding-bottom: 0px;">ǥ�� ������</td>
                                    </tr>
                                    
                                    <tr>
                                       <td class= "img_td">
                                          <img src ="flower1.png" alt="����" width ="300"/><br>
                                          <input type="radio" name="choose1" value ="�ɹ��� ���� ������">�ɹ��� ���� ������
                                       </td>
                                       <td class= "img_td">
                                          <img src ="pastel2.png" alt="����" width ="300"/><br>
                                          <input type="radio" name="choose1"  value ="�Ľ��� ���� ������">�Ľ��� ���� ������
                                       </td>
                                       <td class= "img_td">
                                          <img src ="animal1.png" alt="����" width ="300"/><br>
                                          <input type="radio" name="choose1" value ="���� �Ϸ���Ʈ ���� ������">���� �Ϸ���Ʈ ���� ������
                                       </td>
                                       <td class= "img_td">
                                          <img src ="noimage.jpg" alt="����" width ="300"/><br>
                                          <input type="radio" name="choose1" value="���� ������ ���� ������">���� ������ ����
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="4" style="font-size: 3em; padding-top: 0px; padding-bottom: 0px;">���� ������</td>
                                    </tr>
                                    <tr>
                                       <td colspan = "4"><input type="button" value="����" onclick="submit(); javascript:window.location='Main.jsp'" id ="submit"></td>
                                    </tr>
                                 </table>
                                    

                                 

                              </article>

                        </div>
                     </div>
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
         <script>
         // �̹��� ���ε�
                  $('#img').on('change', function() {
                                 ext = $(this).val().split('.')
                                       .pop().toLowerCase(); //Ȯ����
                                 //�迭�� ������ Ȯ���ڰ� �����ϴ��� üũ
                                 if ($.inArray(ext, [ 'gif', 'png',
                                       'jpg', 'jpeg' ]) == -1) {
                                    resetFormElement($(this)); //�� �ʱ�ȭ
                                    window
                                          .alert('�̹��� ������ �ƴմϴ�! (gif, png, jpg, jpeg �� ���ε� ����)');
                                 } else {
                                    file = $('#img').prop("files")[0];
                                    blobURL = window.URL
                                          .createObjectURL(file);
                                    $('#image_preview img').attr(
                                          'src', blobURL);
                                    $('#image_preview').slideDown(); //���ε��� �̹��� �̸����� 
                                    $(this).slideUp(); //���� ��� ����
                                 }
                              });
         
         function submit(){
            
            alert("���� �Ǿ����ϴ�.")
            
         }
         
         </script>

   </body>
</html>