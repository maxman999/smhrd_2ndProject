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
								<pre><h2 id="aboutwrite">ATO (����) 
: "All together"</h2>
<h3 id="writeabout">    <strong>����</strong>�� �� �츮���� �����̶� ������, 
<h3 id="writeabout2">��ٸ��� ������ �θ���� �������� �ӻ�� ���� �� ���Ƽ�ø ���񽺸� �����մϴ�.
<h3 id="writeabout3">�Ʊ⿡�� Ư���� ������ ���Ҿ� ���� �غ� ATO�� �Բ� �ϼ���!</h3>


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
