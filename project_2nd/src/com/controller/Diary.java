package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.DiaryDAO;
import com.model.DiaryDTO;

/**
 * Servlet implementation class Diary
 */
@WebServlet("/Diary")
public class Diary extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String yd = request.getParameter("yd");
		String md = request.getParameter("md");
		String td = request.getParameter("td");
		String day = yd + "-" + md + "-" + td;

		 DiaryDAO dao = new DiaryDAO();
		 DiaryDTO dto = dao.selectDiaryOne(id,day);
		 
		 response.setCharacterEncoding("UTF-8");
		 if(dto != null) {
		 }else {
			 
		 }
		 Gson gson = new Gson();
		 response.getWriter().println(gson.toJson(dto)); 
		

	}

}
