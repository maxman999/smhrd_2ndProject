<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style>
#aboutwrite {
	margin : 0 0 0 17vw;
	position: relative;
    bottom: 7vw;
}

#writeabout {
	margin : 0 0 0 17vw;
	position: relative;
    bottom: 7vw;
}
#writeabout2 {
	margin : 0 0 0 18vw;
	position: relative;
    bottom: 7vw;
}
#writeabout3 {
	margin : 0 0 0 18vw;
	position: relative;
    bottom: 7vw;
}
#sidebar{
	margin : 0 0 0 15vw;
}
div#main-wrapper { 
	background-color: hsla(120, 60%, 100%, 0.3);

}
</style>
</head>

	<%@ include file = "header.jsp" %>

	
		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-4 col-12-medium">

						<!-- Sidebar -->
						<div id="sidebar">
							<section class="widget thumbnails">
								<div class="grid">
									<div class="row gtr-50">
										<div class="col-6">
									<img src="images/logo3heart.png">
										</div>
									</div>
								</div>
							</section>
						</div>

					</div>
					<div class="col-8 col-12-medium imp-medium">

						<!-- Content -->
						<div id="content">
							<section class="last">
								<pre><h2 id="aboutwrite">ATO (아토) 
: "All together"</h2>
<h3 id="writeabout">    <strong>아토</strong>는 순 우리말로 선물이란 뜻으로, 
<h3 id="writeabout2">기다림과 설레는 부모님의 마음으로 임산부 정보 및 육아수첩 서비스를 제공합니다.
<h3 id="writeabout3">아기에게 특별한 선물과 더불어 순산 준비를 ATO와 함께 하세요!</h3>


</pre>
								
							</section>
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

</body>
</html>
