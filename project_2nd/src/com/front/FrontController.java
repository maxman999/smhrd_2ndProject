package com.front;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.DiaryReadingService;
import com.controller.JoinService;
import com.controller.LoginService;
import com.controller.LogoutService;
import com.controller.RemoveDiary;
import com.controller.UpdateService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("프론트 컨트롤러");
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");

		String requestURI = request.getRequestURI();
		String path = request.getContextPath();
		String resultURL = requestURI.substring(path.length() + 1);

		System.out.println(resultURL);

		String moveURL = null;
		Command command = null;

		if (resultURL.equals("JoinService.do")) {
			command = new JoinService();
		} else if (resultURL.equals("LoginService.do")) {
			command = new LoginService();
		} else if (resultURL.equals("UpdateService.do")) {
			command = new UpdateService();
		} else if (resultURL.equals("LogoutService.do")) {
			command = new LogoutService();
		} else if (resultURL.equals("RemoveDiary.do")) {
			command = new RemoveDiary();
		} else if (resultURL.equals("DiaryReadingService.do")) {
			HttpSession session = request.getSession();
			String targetdate = request.getParameter("date");
			session.setAttribute("targetdate", targetdate);
			command = new DiaryReadingService();
		}
		moveURL = command.execute(request, response);
		response.sendRedirect(moveURL);

	}
}
