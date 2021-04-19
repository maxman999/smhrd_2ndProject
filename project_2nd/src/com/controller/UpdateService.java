package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.MemberDAO;
import com.model.MemberDTO;

public class UpdateService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		String user_id = info.getUser_id();
		String user_name = request.getParameter("name");
		String user_pw = request.getParameter("pw");
		String location = request.getParameter("location");
		String preg_day = request.getParameter("preg_day");

		MemberDTO dto = new MemberDTO(user_id, user_name, user_pw, location, preg_day);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(dto);

		if (cnt > 0) {
			System.out.println("회원정보 수정완료");
			session.setAttribute("info", dto);
			moveURL = "Main.jsp";

		} else {
			System.out.println("회원정보 수정실패");
			moveURL = "update.jsp";
		}
		return moveURL;
	}

}