<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ include file="header.jsp"%>

<script src="jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	var today = new Date();
	var date = new Date();
	
	var yyy;
	var ddd;
	
	function prevCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
		buildCalendar();
	}

	function nextCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		buildCalendar();
	}
	<%if(info!=null){%>
	function buildCalendar() {
		var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		var tbCalendar = document.getElementById("calendar");
		var tbCalendarYM = document.getElementById("tbCalendarYM");
		
		
		tbCalendarYM.innerHTML = today.getFullYear() + "�� "
				+ (today.getMonth() + 1) + "��";
		tbCalendarYM.innerHTML = today.getFullYear() + "�� "
				+ (today.getMonth() + 1) + "��";
		dimonth = tbCalendarYM.innerHTML;
		var year = today.getFullYear();
		yyy = today.getFullYear() + "";
		ddd = month = today.getMonth() + 1;
		var month = today.getMonth() + 1;
		var fulldate = year + "-" + month;
		while (tbCalendar.rows.length > 2) {
			tbCalendar.deleteRow(tbCalendar.rows.length - 1);
		}
		var row = null;
		row = tbCalendar.insertRow();
		var cnt = 0;
		for (i = 0; i < doMonth.getDay(); i++) {
			cell = row.insertCell();
			cnt = cnt + 1;
		}
		for (i = 1; i <= lastDate.getDate(); i++) {
			cell = row.insertCell();
			cell.setAttribute('class', 'diary');
			cell.innerHTML = "<a href=DiaryReadingService.do?date="+fulldate+"-"+i+ " >" + i + "</a>";
			cnt = cnt + 1;
			if (cnt % 7 == 1) {/*�Ͽ��� ���*/
				cell.innerHTML = "<a href=DiaryReadingService.do?date="+fulldate+"-"+i+ " class= 'day' > <font color=#d83552 font size=5>" + i
						+ "</a>"
			}
			if (cnt % 7 == 0) {/* 1������ 7�� �̹Ƿ� ����� ���ϱ�*/
				cell.innerHTML = "<a href=DiaryReadingService.do?date="+fulldate+"-"+i+ " class= 'day' > <font color=blue font size=5>" + i
						+ "</a>"
				row = calendar.insertRow();
			}
			if (today.getFullYear() == date.getFullYear()
					&& today.getMonth() == date.getMonth()
					&& i == date.getDate()) {
				cell.bgColor = "white";
			}
		 	
			var chkresult;
			if (ddd < 10) {
				if (i < 10) {
					chkresult = yyy.substring(2, 4) + '-0' + ddd
							+ '-0' + i;
				} else {
					chkresult = yyy.substring(2, 4) + '-0' + ddd + '-'
							+ i;
				}
			} else {
				if (i < 10) {
					chkresult = yyy.substring(2, 4) + '-' + ddd + '-0'
							+ i;
				} else {
					chkresult = yyy.substring(2, 4) + '-' + ddd + '-'
							+ i;
				}
			}
		 
		 
		  <%   ArrayList<String> diarydays = (ArrayList<String>)session.getAttribute("diarydays");  %>
          <% for(int i = 0 ; i < diarydays.size() ; i++){%>
            var kjy = "<%=diarydays.get(i).substring(2,10)%>";
            if(chkresult === kjy){
               cell.setAttribute('background','images/oksticker.png');
               cell.setAttribute('style',"background-repeat:no-repeat ; background-position: 5px");
               }
            else{
            }
         <%}%>
			}
	myCheck();
		layout();
		errm();
		
	}<%}%>
	
	
</script>
<style>

/* ���̾� ũ�� */
.popupLayer {
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 2px #d0d0d0;
	width: 300px;
	height: 450px;
	padding: 10px;
	overflow-y: auto;
}
/* ���̾� ��� */
.popupLayer{
	<%--background-image : URL('images/b4.jpg');--%>
	background-color : rgba(145, 145, 145, 0.2);
}

.popupLayer div {
	position: absolute;
	top: 5px;
	right: 5px
}

.popupLayer p {
	display: inline-block !important;
}

#content_lay{
	border-sizing : content-box;
	height: 250px;
}

div#mainm {
    margin: 2vw 0 0 5vw;
}

/* Ű���� css  */
#up{
 display: none;
 margin-top: 5vw;
}


#features-wrapper{
	margin: auto;
	text-align: center;
	display : none;
	background-color: rgb(255, 255, 255);
	height: 1000px
	position : absolute;
}

#key_title{
	margin : 0 0 30px 150px;
	color: black;
	}

h3.keyname{
	margin : 0 0 0 0;
	}

#keyword{
	text-align : center;
	margin: 0px;
	padding-left: 240px;
	}

.preg_week{
	display : inline-block;
	width: 450px;
	height: 450px;
	position: relative;
    right: 5vw;
	}
	
.preg_product{
	display : inline-block;	
	width: 450px;
	height: 450px;
	margin-left: 90px;
	}

.week_a{
	font-size: 25px;
	color: black;
	}

#week_a1 {
	background-color: transparent;
	width:400px;
	height:20px;
	display:none;
	}

#week_a2 {
	background-color: transparent;
	width:400px;
	height:20px;
	display:none;
	}

#week_a3 {
	background-color: transparent;
	width:400px;
	height:20px;
	display:none;
	}

#product_div1{
	margin-left: 100px; 
}

.product_a{
	font-size: 25px;
	color: black;
	}

#product_a1 {
	background-color: transparent;
	width:400px;
	height:20px;
	display:none;
	}

#product_a2 {
	background-color: transparent;
	width:400px;
	height:20px;
	display:none;
	}

#product_a3 {
	background-color: transparent;
	width:400px;
	height:20px;
	display:none;
	}

h3#wjdqhek {
    position: relative;
    right: 7vw;
}
/* Ű���� ����  */

#servebut {
	margin : 0 0 0 10vw;
}

img.mySlides {
    margin: 0 0 0 50%;
}

a#servebut {
    margin: 30% 0 0 30%;
}
<%-- ���α� �������* --%>
h1#mih {
    margin: 0 0 0 8vw;
    font-size : 3.2vw;
}
<%-- ���� ����ϱ� ��ư* --%>
a#mibut {
    margin: 0 0 0 11vw;
}

#mydiarytitle {
	margin : 0 0 0 42vw;
	font-size: xx-large;
}

table#calendar {
    margin: 2vw 0 0 25vw;
}

td#tbCalendarYM {
    font-size: 1.6vw;
}

td.calendartop {
    padding: 1.3vw;
    border-right: hidden;
    border-left: hidden;
}

a.button.large.icon.solid.fa-arrow-circle-right {
    margin: 3vw 0 0 7vw;
    padding: 0 4vw 0 0;
}

a#writtingwr {
    margin: 5vw 0 0 17vw;
}

#overlay1 {
	background-image: url(file:///C:/Users/SMHRD/Desktop/kij/WebProjectTeam/WebContent/assets/css/images/m.jpg);
    border-radius: 6px;
    <%-- box-shadow: 0px 3px 0px 0px rgb(0 0 0 / 5%); --%>
    padding: 4em;
}

#overlay2 {
	background-image: url(file:///C:/Users/SMHRD/Desktop/kij/WebProjectTeam/WebContent/assets/css/images/m.jpg);
    border-radius: 6px;
    <%--box-shadow: 0px 3px 0px 0px rgb(0 0 0 / 5%);--%>
    padding: 4em;
}

table#tableover {
    width: 42%;
    margin: 0 0 0 29vw;
}

table#tableover2 {
 	width: 45%;
 	margin: 0 0 0 26vw;
}

a#openwritting {
    margin: 0 0 0 0;
    padding: 0 4vw 0 13vw;
}

div#mainm2 {
    background-image: url(file:///C:/Users/SMHRD/Desktop/kij/WebProjectTeam/WebContent/assets/css/images/m.jpg);
    border-radius: 6px;
    box-shadow: 0px 3px 0px 0px rgb(0 0 0 / 5%);
    padding: 4em;
    width: 100%;
    height: 1150px;
}

img#imagebaby {
    margin: 0 0 0 72%;
    position: relative;
    bottom: 35vw;
}

<%-- �޷� �� ũ�� --%>
td.diary {
    font-size: 1.2vw;
}

td.calendarfont {
    font-size: 1.3vw;
    border-left: hidden;
    border-right: hidden;
}

a#writtingwr {
    position: relative;
    left: 12vw;
}

img.breathig {
    margin: 0 0 2vw 0;
}

/* Day-css */
p#birthday {
    margin: 0 0 0 39vw;
    font-size: xx-large;
    position: relative;
    bottom: 380px;
    font-weight: bold;
}

<%--div#breath_a3 {
    height: 80%;
}--%>

</style>


<body class="is-preload homepage">
	<div id="page-wrapper">

		<%-- ���̾�� ���̴� �ڵ� --%>
		<%
			if (info != null) {
		%>
		<input type="hidden" value="<%=info.getUser_id()%>" id="hiddenId">
		<%
			}
		%>

		<!-- Banner -->
		<div id="banner-wrapper">
			<div id="banner" class="box container">
				<div class="row">
					<div class="col-7 col-12-medium" id="mainm">

					<% if (info != null) {
						%>
							<h1 id="mih" class="animate__animated animate__bounce">���� �ƺ����� ���༭ ������ ��</h1>
						<!-- ����ϱ�  -->
                  			<a onclick="openDia()" class="button large icon solid fa-arrow-circle-right" id="openwritting"> ���� �ϱ� </a>
                  		<%-- ����ϱ� ������ --%>
                  			<div id="myDia" class="overlay">
                  				<a href="javascript:void(0)" class="closebtn" onclick="closeDia()">&times;</a>

			  		                <div class="overlay-content">
                     					<div id="overlay1">
                        					<table id="tableover">
                           						<tr>
                              						<td class="diarymenu">
                                 						<p>�ٷ� �ϱ⸦ ���� �ʹٸ�,</p>
                                 						<a href ='board_writting.jsp?chk=1' class="button large icon solid fa-arrow-circle-right">����Ϸ� ���� </a>
                              						</td>
                           						</tr>
                        					</table>
                        					<div id="overlay2">
                        					<table  id="tableover2">
                           						<tr>
                              						<td class="diarymenu">
                                 						<p>���� �� �ϱ⸦ ���� �ʹٸ�,</p>
                                						 <a onclick="closeDia(); openBrea(); audiopaly(); slideshow();" class="button large icon solid fa-arrow-circle-right"> �����Ϸ� ���� </a>
                             						 </td>
                           						</tr>
                        					</table>
                        					</div>
                    					</div>
                    					</div>
                  					</div>
                  			</div>
                  		<!-- ȣ��1 -->
                  			<div id = "breath_a1" class="overlay">
                  		<!-- ȣ��â �ݱ� -->
                  				<a href="javascript:void(0)" class="closebtn" onclick="closeBrea();">&times;</a>
                  				<div class="overlay-content" >
                     				<div class = "breath">
                        				<img src = "images/brea2.png" class="breathig">
                        				<p> ���� �ڼ����� õõ�� ���⸦ 4�ʰ� �ڷ� ���� ���ſ�. </p>
                        				<br>
                     				</div>
                  				</div>
                  			</div>
                  
                  		<!-- ȣ��2 -->
                  			<div id = "breath_a2" class="overlay">
                  		<!-- ȣ��â �ݱ� -->
                  				<a href="javascript:void(0)" class="closebtn" onclick="closeBrea();">&times;</a>
                  				<div class="overlay-content" >
                     				<div class = "breath">
                        				<img src = "images/brea3.png" class="breathig">
                        				<p> ���� ���̸��� ���¿��� 7�ʰ� ���� ���߾� �ּ���. </p>
                        				<br>
                     				</div>
                  				</div>
                  			</div>
                  
                  		<!-- ȣ��3 -->
                 			 <div id = "breath_a3" class="overlay">
                  		<!-- ȣ��â �ݱ� -->
                  				<a href="javascript:void(0)" class="closebtn" onclick="closeBrea();">&times;</a>
                  				<div class="overlay-content" >
                     				<div class = "breath">
                        				<img src = "images/brea4.png" class="breathig">
                        				<p> ���� ���� ���� ���������� 8�ʸ� �����ָ鼭 ���� ����� �ּ���. </p>
                        				<br>
                     				</div>
                        				<a href ='board_writting.jsp?chk=1' class="button large icon solid fa-arrow-circle-right" id="writtingwr"> ����ϱ� </a>
                  				</div>
                  			</div>
 
					</div>
						<%
							}
						%>

						
					</div>
					<div class="col-5 col-12-medium" id="mainm2">
						
						<%
						if (info != null) {
						ArrayList<String> diarydays = (ArrayList<String>)session.getAttribute("diarydays");
						int myQuota = diarydays.size();
						%>

							<h5 id="mydiarytitle">My Diary  (<%=myQuota%>/250) </h5>
							<ul>
							<li>
								<table id="calendar" border="3" align="center" background = "images/green.jpg"
									style="border-color: #93c193;  border-style: inset; width:45%;background-size: cover">
									<tr>
										<!-- label�� ���콺�� Ŭ���� ���ϰ� ���� -->
										<td style="cursor:pointer" class="calendartop"><label onclick="prevCalendar()"><b> < </b></label></td>
										<td class="calendartop" align="center" id="tbCalendarYM" colspan="5"><b>yyyy�� m��</b></td>
										<td style="cursor:pointer" class="calendartop"><label onclick="nextCalendar()"><b> > </b></label></td>
									</tr>
									<tr>
										<td align="center" class="calendarfont"><font color="#d83552">��</td>
										<td align="center" class="calendarfont">��</td>
										<td align="center" class="calendarfont">ȭ</td>
										<td align="center" class="calendarfont">��</td>
										<td align="center" class="calendarfont">��</td>
										<td align="center" class="calendarfont">��</td>
										<td align="center" class="calendarfont"><font color="blue">��</td>
									</tr>
								</table> 
								<img src="images/babyh.png" style="width:20%;" id="imagebaby">
								<script language="javascript" type="text/javascript">
									buildCalendar();

								</script>
								<p id="birthday" >��꿹���� : <%= birthday %></p>
							</li>
						</ul>
						</div>
						<%-- �α��� �������� ���� �̹��� --%>
						<%
							} else {
						%>
						<pre>
							<h2>�����ƺ����� ���༭
 ������ ��</h2>
						</pre>
						<img src="images/mainp.png" id="kg">
					</div>
						<%
							}
						%>
					</div>
				</div>
		<!-- Features -->
		<%if(info!=null){ %>
		<img style="cursor:pointer" src="images/down.svg" width=60vw id="down">
		<%} %>
		<div id="features-wrapper">
			<div class="container">
				<div class="row" id = keyword>
					<div class="key_words">

						<!-- Box -->
						<section class="box feature">
						<div class="inner">
								<header>
									<%
									String user_name = "";
									if(info != null){
									user_name = info.getUser_name();
									}%>
									<h3 id="wjdqhek"><%=user_name%>�Բ� �� �ʿ��� ����!</h3>
								</header>
							</div>
						<!--������� -->
						<%
						if (info != null) {
							String pregWeek = (String)session.getAttribute("pregWeek");
							String[] weekKeywords = (String[])session.getAttribute("weekKeywords");
							String[] weekKeyUrl = (String[])session.getAttribute("weekKeyUrl");
						%>
						<img class="preg_week" src="images/keywords/heart<%=pregWeek%>.jpg" alt="" />

						<div id="week_div1">
						<a target="_blank" class="week_a" id="week_a1" href = <%=weekKeyUrl[0]%>><%=weekKeywords[0]%></a><br>
						<a target="_blank" class="week_a" id="week_a2" href = <%=weekKeyUrl[1]%>><%=weekKeywords[1]%></a><br>
						<a target="_blank" class="week_a" id="week_a3" href = <%=weekKeyUrl[2]%>><%=weekKeywords[2]%></a></div>
						<%}	%>
						
						</section>

					</div>
					<div class="key_words">

						<!-- Box -->
						<section class="box feature">
							<div class="inner">
								<header>
									<h3>ATO ��õ ��ǰ</h3>
								</header>
							</div>
						<!--��ǰ��õ -->
						<%
						if (info != null) {
							String pregWeek = (String)session.getAttribute("pregWeek");
							String[] weekKeywords = (String[])session.getAttribute("weekKeywords");
						%>
						<img class="preg_product" src="images/keywords/product1.jpg" alt="" />
						<div id="product_div1">
						<a target="_blank" class="product_a" id="product_a1" href = "https://www.coupang.com/np/search?component=&q=%EC%9E%84%EC%82%B0%EB%B6%80+%EC%9B%90%ED%94%BC%EC%8A%A4&channel=user">�ӻ�� ���ǽ� ��������</a><br>
						<a target="_blank" class="product_a" id="product_a2" href = "https://www.coupang.com/np/search?component=&q=%EC%9E%84%EC%82%B0%EB%B6%80+%EB%B0%94%EC%A7%80&channel=user">�ӻ�� ���� ��������</a><br>
						<a target="_blank" class="product_a" id="product_a3" href = "https://www.coupang.com/np/search?component=&q=%EC%9E%84%EC%82%B0%EB%B6%80+%ED%81%AC%EB%A6%BC&channel=user">�ӻ�� ũ�� ��������</a></div>
						<%}	%>
						</section>
					</div>
				</div>
				<img style="cursor:pointer" src="images/up.svg" width=60vw id="up">
			</div>
			</div>


		<%@ include file="footer.jsp"%>

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
			layout();
		});

		function closeLayer(obj) {
			$(obj).parent().parent().hide();
		}
		
	/* �̸����� ���̾� */
	</script>
		<div class="popupLayer">
			<!-- <p>��ȣ : </p>
		<p id="dnum"></p><br>
		<p>���̵� : </p>
		<p id="did"></p><br>
		<p>�̹��� ��� : </p>
		<p id="dimg"></p><br> -->
			<table border="3" align="center"
			style="border-color: gray;  border-style: outset;">
				<tr>
					<td><b style="width: 70px;">��¥</b></td>
					<b><td id="dday"></td></b>
				</tr>
				<tr>
					<td><b>����</b></td>
					<b><td id="dtitle"></td></b>
				</tr>
				<tr id = "content_lay">
					<td><b>����</b></td>
					<b><td id="dcontent"></td></b>
				</tr>
			</table>
		</div>

	<script type="text/javascript">
	/* ȣ���� Jquery */
	function openDia() {
		document.getElementById("myDia").style.width = "100%";
	}

	function closeDia() {
		document.getElementById("myDia").style.width = "0%";
	}
	
	function openBrea() {
		document.getElementById("breath_a1").style.width = "100%";
	}

	function closeBrea() {
		document.getElementById("breath_a3").style.width = "0%";
	}
	
	function audiopaly(){
			  var audio1 = new Audio("5minit.mp3");
			  audio1.loop = false; // �ݺ�������� ����
			  audio1.volume = 1; // ���� ����
			  audio1.play(); // sound1.mp3 ���
			  
			  $('.closebtn').click(function(){
				  audio1.pause()
			  });
	}
	
	function audiostop(){
		audio1.pause();
	}
	
	
	</script>
	
	<!-- ���� ���  -->
	<script>
	$(document).ready(function() {
		$("#down").click(function() {
			if ($('#features-wrapper').css('display') == "none") {
				$("#features-wrapper").fadeIn(3500);
				$("#down").fadeOut();
				var offset = $('#down').offset();
				$('html').animate({scrollTop : offset.top}, 400);
				$('#up').fadeIn(3500);
			} else {
			}
		})
		
		$("#up").click(function() {
			if ($('#features-wrapper').css('display') != "none") {
				$("#features-wrapper").fadeOut("fast");
				$("#up").fadeOut();
				var offset = $('#mydiarytitle').offset();
				$('html').animate({scrollTop : offset.top}, 400);
				$('#down').fadeIn(3500);
				
				$("#week_a1").fadeOut();
				$("#week_a2").fadeOut("slow");
				$("#week_a3").fadeOut(2500);
				$("#product_a1").fadeOut();
				$("#product_a2").fadeOut("slow");
				$("#product_a3").fadeOut(2500);
			} else {
			}
		})
		
		
	});	
	
		$(document).ready(function() {
			$(".preg_week").click(function() {
				$("#week_a1").fadeIn();
				$("#week_a2").fadeIn("slow");
				$("#week_a3").fadeIn(2500);
			})

		});
		
		$(document).ready(function() {
			$(".preg_product").click(function() {
				$("#product_a1").fadeIn();
				$("#product_a2").fadeIn("slow");
				$("#product_a3").fadeIn(2500);
			})
		});
	</script>
	
	<script>
   	/* ȣ���� ���� �������� */
   	function slideshow(){
      
         setTimeout(function() {
            $("#breath_a1").css({'transition':'1s','width':'100%'});
            $("#breath_a1").css({'transition':'1s','width':'0%'});
            $("#breath_a2").css({'transition':'1s','width':'100%'});
         }, 5000);
         
         setTimeout(function() {
            $("#breath_a2").css({'transition':'1s','width':'0%'});
            $("#breath_a3").css({'transition':'1s','width':'100%'});
         }, 13000);
         
         
  	};
 	</script>
	
	
</body>
</html>