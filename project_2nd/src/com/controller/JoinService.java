package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.front.Command;
import com.model.MemberDAO;
import com.model.MemberDTO;

public class JoinService implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String moveURL = null;

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String sex = request.getParameter("sex");
		String location = request.getParameter("location");
		String preg_day = request.getParameter("preg_day");

		System.out.println("입력받은 날짜 :" + preg_day);

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(id, pw, name, age, sex, location, preg_day);
		int cnt = dao.join(dto);

		if (cnt > 0) {
			System.out.println("회원가입 성공");
		} else {
			System.out.println("회원가입 실패");
		}
		moveURL = "Main.jsp";

		return moveURL;
	}

}