<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport"
	  content="width=device-width, initial-scale=1, user-scalable=no" />
<meta http-equiv="Page-Enter" content="revealtrans(Duration=1,Transition=12)" />

<title>Ato HOMEPAGE</title>

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet"
	  href="http://fonts.googleapis.com/css?family=Lato:300,400,700">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />

<%  MemberDTO info = (MemberDTO)session.getAttribute("info");
	String birthday = (String)session.getAttribute("Birthday");
%> 
<style>
@import
url('https://fonts.googleapis.com/css2?family=Gaegu&family=Gamja+Flower&display=swap');

/* 로고 */
#l{
    width: 10vw;
    transform: translate(-45%, -13%);
}
/* 로그인 창 */
.overlay {
  <%--height: 80%;--%>
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  right: 0;
  background-color: rgb(105, 103, 103, 0.9);
  background-color: rgba(249, 249, 249, 90);
  overflow-x: hidden;
  transition: 0.5s;
   height: 80%;
}

.overlay-content {
  position: relative;
  top: 1%;
  width: 100%;
  text-align: center;
  margin-top: 30px;
  height : 35vw;
}

input[type="text"] {
    margin: 0 0 0 30em;												
}

input[type="password"] {
	margin: 0 0 0 30em;
}

.overlay a {
  padding: 8px;
  text-decoration: none;
  font-size: 60px;
  color: #222121;
  display: block;
  transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
 color: #0e5a11;
}

.overlay .closebtn {
  position: absolute;
  top: 20px;
  right: 45px;
  font-size: 60px;
}

@media screen and (max-height: 450px) {
  .overlay a {font-size: 20px}
  .overlay .closebtn {
  font-size: 40px;
  top: 15px;
  right: 35px;
  }
}

input.button.fit {
    padding: 0 0.5em 0 0.5em;
}
<%-- 로그인 창 간격 --%>
.input-box {
  position: relative;
  margin: 2vw 0 2vw 3.5vw;
  
}

.input-box input {
  border-style: none;
  background: transparent;
  border-bottom: 1px solid #222121;
  width: 100%;
  position: relative;
  outline: none;
  padding: 10px 0;
  color: rgb(15, 15, 15);
  font-size: 18px;
  margin-bottom: 30px;
}

.input-box label {
  color: rgb(15, 15, 15);
  position: absolute;
  padding: 10px 0;
  top: 0;
  left: 25vw;
  pointer-events: none;
  transition: 0.5s;
}

.input-box input:focus ~ label,
.input-box input:valid ~ label {
  color: #2a6b36;
  font-size: 15px;
  top: -20px;
  transition: 0.3s;
}

.overlay input[type="submit"] {
  background: transparent;
  color: rgb(15, 15, 15);
  border-spacing: none;
  border: 1px solid rgb(15, 15, 15);
  padding: 10px 20px;
  font-size: 16px;
  border-radius: 3px;
  outline: none;
  cursor: pointer;
  transition: 0.3s;
}

.overlay input[type="submit"]:hover {
  border: 1px solid rgb(75, 151, 104);
  transition: 0.3s;
}

label.loginip {
    font-size: larger;
}

form#loginc {
    margin: 6vw;
}

input.loginbu {
    margin: 0 5vw 0 0;
}

input#joinbut {
  background: transparent;
  color: rgb(15, 15, 15);
  border-spacing: none;
  border: 1px solid rgb(15, 15, 15);
  padding: 10px 20px;
  font-size: 16px;
  border-radius: 3px;
  outline: none;
  cursor: pointer;
  transition: 0.3s;
  transform: translate(120%, -113%);
}
<%-- 맨 위 박스  --%>
#flip {
  padding: 5px;
  text-align: center;
  background-color: #e5eecc;
  background-color: hsla(120, 30%, 70%, 0.3);
  border: solid 1px #d2e0d2;
}
<%-- 상단 로그인 버튼 위치 설정 --%>
.changel{
	margin: 3vw 0 0 85vw;
}

img#ghkrtjd {
    position: relative;
    top: 0.2vw;
}

td.diarymenu {
    border-bottom: groove;
    border-left: groove;
    border-right: groove;
    border: solid 5px #608857;
}

div#content {
    margin: 8vw 0 0 0;
}

a#logintext {
    position: relative;
    top: 5vw;
}

/* DIY td 크기조절  */
.img_td{
   width : 300px;
   font-size: x-large;
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


</style>
</head>

<body class="is-preload homepage">
	<div id="page-wrapper">
	<div id="flip">
	<% if(info!=null){ %>
		<p id="mp"><b><img src="images/ghkrtjd.png" width=24vw id="ghkrtjd"><%= info.getUser_id() %>님 환영합니다!</b></p>
	<% }else{ %>
		<p id="mp"><b><img src="images/ghkrtjd.png" width=24vw id="ghkrtjd"> 로그인 시 서비스 이용 가능합니다 </b></p>
		<% } %>
	</div>
	<%-- 다이어리에 쓰이는 코드 --%> 
	<%
		if (info != null) {
	%>
	<input type="hidden" value="<%=info.getUser_id()%>" id="hiddenId">
	<input type="hidden" value="<%= info.getPregnancy_day().substring(0,10) %>" id="preDay">
	<%
		}
	%>

		<!-- Header 맨 윗부분 -->
	<% if(info!=null){ %>
		<a href=LogoutService.do><span style="font-size:25px;cursor:pointer" onclick="openNav()" class="changel"> 로그아웃</span></a> 
	<% }else{ %>
		<span style="font-size:25px;cursor:pointer;color:black;" onclick="openNav()" class="changel">&#9776; 로그인</span>
		
	 <% } %>
		<div id="header-wrapper">
			<div id="myNav" class="overlay">
			
				 <%-- 로그인창 닫는 아이콘 코드 --%>
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				
				<div class="overlay-content">
					<%-- 로그인 창 구성 --%>
					<%  if( info == null){ %>
					<a href=# id="logintext">로그인</a>    
					<div class="container">
					  <div id="content">
						  <!-- Content -->
						 <div>
							<form action="LoginService.do" method="post" name="login">
							  <div class = "input-box">
								<input type="text" name="id" id="ID" required >
								<label for="id" class="loginip">ID</label>
							  </div>
							  <div class="input-box">
								<input type="password" name="pw" id="PW" required >
								<label for="pw" class="loginip">PW</label>
							  </div>
							  <input type="submit" value="확인" class="loginbu" onclick="logincheck()" id="login_btn">
							  <a href="join.jsp"><input type="button" value="회원가입" id="joinbut" class="loginbu"></a>
							</form>
						  </div>
						<%}else{%>
						
					<% } %>
					</div>
				</div>
				</div>
			  </div>
			  
			  <% if (info == null) {%>
						<% }else { %>
						<% } %>
			<header id="header" class="container">
				<!-- Logo -->
				<div id="logo">
						<a href="Main.jsp"><img src="images/logo3.png" id="l"></a>
				</div>
			
				<!-- Nav 상단메뉴 -->
				<nav id="nav">
					<ul>
						<li class="current">
							<a href="Main.jsp">HOME</a>
						</li>
						<li>
							<a href="about.jsp">ABOUT</a>
						</li>
							<% if(info == null){ %>
							<%}else{ %>
							<li><a href="#">Services</a>
								<ul>
								<li><a href="information.jsp">수첩 DIY</a></li>
								<li><a href="board_writting.jsp?chk=1">일기쓰기</a></li>
								</ul>
							</li>
							<%} %>
							<% if(info != null){%>
							<li><a href="#">회원 정보</a>
							<ul>
								<li><a href="update.jsp">회원정보수정</a></li>
							<%}else{%>
							<%}%>
							</ul>
							</li>
					 </ul>
				</nav>
			</header>
			
	<!-- Scripts -->

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script>
		function openNav() {
			document.getElementById("myNav").style.width = "100%";
		}

		function closeNav() {
			document.getElementById("myNav").style.width = "0%";
		}
		$(document).ready(function() {
			myCheck();
		});

		function myCheck() {
			$('.diary').mouseover(
					function() {
						var id = $('#hiddenId').val();
						var value = this.innerText;
						var result;

						if (ddd < 10) {
							if (value < 10) {
								result = yyy.substring(2, 4) + '/0' + ddd
										+ '/0' + value;
							} else {
								result = yyy.substring(2, 4) + '/0' + ddd + '/'
										+ value;
							}
						} else {
							if (value < 10) {
								result = yyy.substring(2, 4) + '/' + ddd + '/0'
										+ value;
							} else {
								result = yyy.substring(2, 4) + '/' + ddd + '/'
										+ value;
							}
						}
						var vvv = result.split('/');
						var yd = vvv[0];
						var md = vvv[1];
						var td = vvv[2];

						$.ajax({
							// 요청 URL
							url : 'Diary?id=' + id + '&yd=' + yd + '&md=' + md
									+ '&td=' + td,
							// 전송방식(GET/POST)				
							type : 'GET',
							// 데이터 유형(생략시 자동 판단)
							dataType : 'json',
							// 요청 성공시 result에 data 추가
							success : function(data) {
								if (data != null) {
									console.log(data.num);
								} else {
									console.log('널');
								}
							}
						});
					});
		}
		
		/* 미리보기 jquery */
	      function layout() {
	         $('.diary').mouseover(function(e) {
	            
	            var id = $('#hiddenId').val();
	            var value = this.innerText;
	            var result;
	            vv = "20";

	            if (ddd < 10) {
	               if (value < 10) {
	                  result = yyy.substring(2, 4) + '/0' + ddd
	                        + '/0' + value;
	                   vv += yyy.substring(2, 4) + '-0' + ddd
	                        + '-0' + value;
	               } else {
	                  result = yyy.substring(2, 4) + '/0' + ddd + '/'
	                        + value;
	                  vv += yyy.substring(2, 4) + '-0' + ddd + '-'
	                        + value;
	               }
	            } else {
	               if (value < 10) {
	                  result = yyy.substring(2, 4) + '/' + ddd + '/0'
	                        + value;
	                  vv += yyy.substring(2, 4) + '-' + ddd + '-0'
	                        + value;
	               } else {
	                  result = yyy.substring(2, 4) + '/' + ddd + '/'
	                        + value;
	                  vv += yyy.substring(2, 4) + '-' + ddd + '-'
	                        + value;
	               }
	            }
	            var vvv = result.split('/');
	            var yd = vvv[0];
	            var md = vvv[1];
	            var td = vvv[2];

	            $.ajax({
	               // 요청 URL
	               url : 'Diary?id=' + id + '&yd=' + yd + '&md=' + md
	                     + '&td=' + td,
	               // 전송방식(GET/POST)            
	               type : 'GET',
	               // 데이터 유형(생략시 자동 판단)
	               dataType : 'json',
	               // 요청 성공시 result에 data 추가
	               success : function(data) {
	                  if (data != null) {
	                     $('#dnum').html(data.num);
	                     $('#did').html(data.id);
	                     $('#dimg').text(data.img);
	                     $('#dday').text(data.day);
	                     $('#dtitle').text(data.title);
	                     $('#dcontent').text(data.content);
	                     
	                     /* var sWidth = window.innerWidth;
	                     var sHeight = window.innerHeight;

	                     var oWidth = $('.popupLayer').width();
	                     var oHeight = $('.popupLayer').height();*/

	                     // 레이어가 나타날 위치를 셋팅한다.
	                     var divTop = 920;
	                     var divLeft = 300;

	                     /*// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
	                     if (divLeft + oWidth > sWidth)
	                        divLeft -= oWidth;
	                     if (divTop + oHeight > sHeight)
	                        divTop -= oHeight;

	                     // 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
	                     if (divLeft < 0)
	                        divLeft = 0;
	                     if (divTop < 0)
	                        divTop = 0;
 						*/
	                     $('.popupLayer').css({
	                        "top" : divTop,
	                        "left" : divLeft,
	                        "position" : "absolute"
	                     }).show();
	                  } 
	               }
	            });
	            
	         });
	         
	         $('.diary').mouseout(function() {
	            $('.popupLayer').hide();
	         });
	      }
	      
		
		/* */
		function errm(){
	           
	           /* 클릭한 날짜와 임신날, 오늘날 비교 스크립트*/
	            $('.diary').click(function(){
	             
	             let today = new Date();   

	             let year = today.getFullYear(); // 년도
	             let month = today.getMonth() + 1;  // 월
	             let date = today.getDate();  // 날짜
	             let day = today.getDay();  // 요일
	             
	             
	             if (month < 10) {
	                month = "0"+(today.getMonth() + 1);
	             } 
	             if(date < 10){
	                date = "0"+today.getDate();
	             }
	             /* 오늘날짜 */
	             var rere = year+"-"+month+"-"+date;
	             
	             var preday = $("#preDay").val();
	                console.log(vv);
	            	console.log(preday);
	            
	                /* if((vv >= preday) && (rere > vv)){ 
	                confirm('작성가능! 작성하시겠습니까?');
	                
	                if(confirm('작성가능! 작성하시겠습니까')==true){
	                   location.href="board_writting.jsp"
	                }else{
	                  location.href="Main.jsp"
	                }
	                
	                } else*/ 
	              if(preday > vv){
	                 alert('임신일 이전에 작성할 수 없습니다.');
	              }else if(vv > rere){
	                alert('오늘 이후는 작성할 수 없습니다.');
	             }
	             
	          });
	           
	        }
		
		function logincheck(){
	         $("#login_btn").click(function() {
	            var id = $('#ID').val();
	            var pw = $('#PW').val();
	            console.log(id);
	            console.log(pw)
	            $.ajax({
	               url : "LoginCheck?id=" + id +"&pw=" + pw, //컨트롤러 URL
	               type : 'GET',
	               success : function(res) {
	                  
	                  if (res != "true") {
	                     alert('아이디 또는 비밀번호를 확인해주세요.');
	                  }else{
	                     document.login.submit();
	                  }
	               }
	            });
	         });
	         }
	</script>


