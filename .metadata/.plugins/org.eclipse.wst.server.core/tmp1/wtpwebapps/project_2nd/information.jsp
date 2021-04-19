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

                                 <h2 style= "margin-bottom: 0px;">나와 아기를 위한 특별 선물! 태교일기</h2>
                                 
                                 <table>
                                    <tr>
                                       <td class= "img_td">
                                          <img src ="flower.png" alt="없음" width ="300"/><br>
                                          <input type="radio" name="choose"  value ="꽃무늬 표지">꽃무늬 표지
                                       </td>
                                       <td class= "img_td">
                                          <img src ="pastel.png" alt="없음" width ="300"/>
                                          <input type="radio" name="choose" value ="파스텔 표지">파스텔 표지
                                       </td>
                                       <td class= "img_td">
                                          <img src ="animal.png" alt="없음" width ="300"/>
                                          <input type="radio" name="choose" value ="동물 일러스트 표지">동물 일러스트 표지
                                       </td>
                                       <td class= "img_td">
                                          <img src ="noimage.jpg" alt="없음" width ="300"/>
                                          <input type="radio" name="choose" value="본인 디자인 표지">본인 디자인 표지
                                       </td>
                                       
                                    </tr>
                                    <tr>
                                       <td colspan="4" style="font-size: 3em; padding-top: 0px; padding-bottom: 0px;">표지 디자인</td>
                                    </tr>
                                    
                                    <tr>
                                       <td class= "img_td">
                                          <img src ="flower1.png" alt="없음" width ="300"/><br>
                                          <input type="radio" name="choose1" value ="꽃무늬 내용 디자인">꽃무늬 내용 디자인
                                       </td>
                                       <td class= "img_td">
                                          <img src ="pastel2.png" alt="없음" width ="300"/><br>
                                          <input type="radio" name="choose1"  value ="파스텔 내용 디자인">파스텔 내용 디자인
                                       </td>
                                       <td class= "img_td">
                                          <img src ="animal1.png" alt="없음" width ="300"/><br>
                                          <input type="radio" name="choose1" value ="동물 일러스트 내용 디자인">동물 일러스트 내용 디자인
                                       </td>
                                       <td class= "img_td">
                                          <img src ="noimage.jpg" alt="없음" width ="300"/><br>
                                          <input type="radio" name="choose1" value="본인 디자인 내용 디자인">본인 디자인 내용
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="4" style="font-size: 3em; padding-top: 0px; padding-bottom: 0px;">내용 디자인</td>
                                    </tr>
                                    <tr>
                                       <td colspan = "4"><input type="button" value="제출" onclick="submit(); javascript:window.location='Main.jsp'" id ="submit"></td>
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
         // 이미지 업로드
                  $('#img').on('change', function() {
                                 ext = $(this).val().split('.')
                                       .pop().toLowerCase(); //확장자
                                 //배열에 추출한 확장자가 존재하는지 체크
                                 if ($.inArray(ext, [ 'gif', 'png',
                                       'jpg', 'jpeg' ]) == -1) {
                                    resetFormElement($(this)); //폼 초기화
                                    window
                                          .alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
                                 } else {
                                    file = $('#img').prop("files")[0];
                                    blobURL = window.URL
                                          .createObjectURL(file);
                                    $('#image_preview img').attr(
                                          'src', blobURL);
                                    $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
                                    $(this).slideUp(); //파일 양식 감춤
                                 }
                              });
         
         function submit(){
            
            alert("제출 되었습니다.")
            
         }
         
         </script>

   </body>
</html>