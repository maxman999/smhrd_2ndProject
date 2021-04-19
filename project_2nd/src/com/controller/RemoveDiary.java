package com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.DiaryDAO;
import com.model.DiaryDTO;
import com.model.MemberDAO;
import com.model.MemberDTO;

public class RemoveDiary implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String moveURL = null;

		// get������� �Ѿ���� String Ÿ���̴�.
		HttpSession session = request.getSession();
		DiaryDTO diaryinfo = (DiaryDTO)session.getAttribute("diaryinfo");
		
		int num = diaryinfo.getNum();
		
		DiaryDAO dao = new DiaryDAO();
		int cnt = dao.removeDiary(num);

		if (cnt > 0) {
			System.out.println("���õ� �� ���� ����");
			MemberDTO info = (MemberDTO)session.getAttribute("info");
			MemberDAO mdao = new MemberDAO();
			ArrayList<String> diarydays = mdao.getdays(info.getUser_id());
			session.setAttribute("diarydays",diarydays);
			
		} else {
			System.out.println("���õ� �� ���� ����");
		}
		moveURL = "Main.jsp";

		return moveURL;
	}

}
