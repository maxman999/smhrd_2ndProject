<%@page import="java.net.URLEncoder"%>
<%@page import="com.model.DiaryDTO"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<!-- Scripts -->

   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/jquery.dropotron.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>
   
<style>

ul {
   list-style: none;
}

#pola {
   text-decoration: none !important;
   list-style: none !important;
   display:block;
   margin-left : auto;
   margin-right: auto;
   width:50%;
   position: relative;
}

article {
   padding : 0 0 0 30em;
}

.polaroid {
   width : 100%;
   border:solid #fff;
    border-width:64px 10px 20px 23px;
    box-shadow:1px 1px 5px #333; 
    -webkit-box-shadow:1px 1px 5px #333;
    -moz-box-shadow:1px 1px 5px #333;
}

div.cantainer{
   text-align : center;
   padding : 5px;
}

div img:hover { 
   opacity: 0.2; /*사진위에 마우스 커서가 호버링되면 투명도를 0.2로 설정한다.*/
}

div#main-wrapper {
   background-color : rgba(255, 255, 255, 0.3);
}

div#image_preview {
    background-color: white;
}

#writtingt{
   margin : 0 0 0 27vw;
}

.polaroid {
    margin: 0 0 0 13vw;
}

.writtingbut {
   margin : 1.5vw 0 0 1vw;
}

#wb {
   margin : 0 0 0 23vw;
}

input#img {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0,0,0,0);
    border: 0;
}

.polaroid label {
   display: inline-block; 
   padding: .5em .75em; 
   color: #fffff; 
   font-size: inherit; 
   line-height: normal; 
   vertical-align: middle; 
   background-color: #fdfdfd; 
   cursor: pointer; 
   border: 1px solid #ebebeb; 
   border-bottom-color: #e2e2e2; 
   border-radius: .25em;
   position : relative;
   left : 19vw;
   bottom : 1.5vw;
}

.textareaw {
   resize:none;
   margin : 1vw 0 0 1.5vw;
}

#writtingdate {
   margin : 0 0 0 -14vw;
}

#writtingtitlei {
   margin : 0 0 0 16vw;
   width: 20vw;
}

#uplodingbt {
   color :#608857;
}

input::-webkit-input-placeholder { opacity: 1;  }
</style>

   <%@ include file = "header.jsp" %>
   <%
      DiaryDTO diaryinfo = (DiaryDTO)session.getAttribute("diaryinfo");
   %>
      <!-- Main -->
      <div id="main-wrapper">
         <div class="container">
            <div id="content">

               <!-- Content -->
               <form action="DiarySave.do" method="post" enctype = "multipart/form-data" name="writting">
                  <article>
                  <h2 id="writtingt">육아 수첩 수정하기</h2>
                     
                     <!-- 날짜 -->
                         <%
                         String targetdate = (String)session.getAttribute("targetdate");
                        System.out.println("리딩날짜 : " + targetdate); 
                               %>
                        <h3 id="writtingdate">작성일자 : <%=targetdate%></h3>

                     
                     <!-- 사진 첨부 -->
                     <div class="polaroid">
                     <div id="image_preview">
                                 <%
                                    if (diaryinfo != null) {
                                 %>
                                    <img id = "pola" src="upload/<%=URLEncoder.encode(diaryinfo.getImg(), "EUC-KR")%>" style="width: 700px; height: 350px;">
                                    <label for="img" id="uplodingbt">이미지 업로드</label>
                                    <input type="file" id="img" name="bf_file[]">
                                 <%
                                    } else {
                                 %>
                                 사진이 없습니다
                                 <%
                                    }
                                 %>
                              </div>
                     
                     <!-- 제목 -->
                     
                           <%
                              if (diaryinfo != null) {
                           %> <input type="text" name="title" value = "<%=diaryinfo.getTitle()%>" id="writtingtitlei"
                           style="border:groove; border-top:none; border-left:none; border-right:none"> 
                           <%
                              } else {
                           %> <input type="text" name="title" placeholder="제목을 입력해주세요" id="writtingtitlei"
                           style="border:groove; border-top:none; border-left:none; border-right:none"><%
                               }
                            %>
                     
                           
                     <!-- 내용 -->
                     <div class="container">
                        <textarea rows="7" cols="100" style="width: 1000px; height: 350px;border: 0;"
                           name="content" class="textareaw" placeholder="내용을 입력해주세요">
                        <%
                           if (diaryinfo != null) {
                        %> <%=diaryinfo.getContent()%>
                        <%
                           } else {
                        %>
                           내용을 입력해주세요 <%
                           }
                        %>                  
                        </textarea>
                     </div>
                     </div>
                     </div>
                     </div>
                        
                        <input type="button" value="제출" onclick="diary_witting()" id="wb" class="writtingbut"> 
                        <input type="button" value="삭제" onclick='location.href="RemoveDiary.do"' class="writtingbut" class="writtingbut">
                        </article>
               </form>

               <script>
               
               function diary_witting() {
                  if (writting.title.value == "") {
                     alert("제목를 입력하세요");
                     return;
                  } 
                  if (writting.content.value == ""){
                     alert("내용을 입력해 주세요");
                     return;
                  }else{
                     alert("일기가 작성되었습니다.");
                     document.writting.submit();
                     return;
                  }
               }
                  // 이미지 업로드
                  $('#img').on('change',function() {
                                 ext = $(this).val().split('.').pop().toLowerCase(); //확장자
                                 //배열에 추출한 확장자가 존재하는지 체크
                                 if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
                                    resetFormElement($(this)); //폼 초기화
                                    window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
                                 } else {
                                    file = $('#img').prop("files")[0];
                                    blobURL = window.URL.createObjectURL(file);
                                    $('#image_preview img').attr('src', blobURL);
                                    $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
                                    $(this).slideUp(); //파일 양식 감춤
                                 }
                              });
               </script>

            </div>
         </div>
      </div>

      <%@ include file = "footer.jsp" %>

   

</body>
</html>