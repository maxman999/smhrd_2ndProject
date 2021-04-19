<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>


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
	opacity: 0.2; /*�������� ���콺 Ŀ���� ȣ�����Ǹ� ������ 0.2�� �����Ѵ�.*/
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
	
		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">
				<div id="content">

					<!-- Content -->
					<form action="DiarySave.do" method="post" enctype = "multipart/form-data" name="writting">
						<article>
						<h2 id="writtingt">���� ��ø ����ϱ�</h2>
							
							<!-- ��¥ -->
							    <%
							      String targetdate = (String)session.getAttribute("targetdate");
							      String chk = request.getParameter("chk");
							      Date today = new Date();
			                      SimpleDateFormat trans = new SimpleDateFormat("yyyy-MM-dd");
			                      String stoday = trans.format(today);
							      if(chk != null){
							    	 targetdate = stoday;
							      }
			                      if(targetdate ==null){
			                    	 targetdate = stoday;
			                      }else if(targetdate.equals(stoday)){
			                      }else{
			                    	stoday = targetdate;
			                      }
			                      
			                      session.setAttribute("targetdate",targetdate); 
			                      %>
								<h3 id="writtingdate">�ۼ����� : <%=stoday%></h3>

							
							<!-- ���� ÷�� -->
							<div class="polaroid">
							<div id="image_preview">
								<img id="pola" src="noimg.jpg" style="width: 700px; height: 350px;">
								<label for="img" id="uplodingbt">�̹��� ���ε�</label>
								<input type="file" id="img" name="bf_file[]">
							
							<!-- ���� -->
							
								<div><input type="text" name="title" placeholder="������ �Է����ּ���" id="writtingtitlei"
								style="border:groove; border-top:none; border-left:none; border-right:none">
							</div>
									
							<!-- ���� -->
							<div class="container">
								<textarea rows="7" cols="100" style="width: 1000px; height: 350px;border: 0;"
										name="content" class="textareaw" placeholder="������ �Է����ּ���"></textarea>
							</div>
							</div>
							</div>
								
								<input type="button" value="����" onclick="diary_witting()" id="wb" class="writtingbut"> 
								<input type="reset" value="�ʱ�ȭ" class="writtingbut" class="writtingbut">
								</article>
					</form>

					<script>
					
					function diary_witting() {
						if (writting.title.value == "") {
							alert("���� �Է��ϼ���");
							return;
						} 
						if (writting.content.value == ""){
							alert("������ �Է��� �ּ���");
							return;
						}else{
							/* alert("�ϱⰡ �ۼ��Ǿ����ϴ�."); */
							document.writting.submit();
							return;
						}
					}
						// �̹��� ���ε�
						$('#img')
								.on(
										'change',
										function() {
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
					</script>
					</article>

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