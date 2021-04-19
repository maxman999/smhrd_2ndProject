package com.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.DiaryDAO;
import com.model.DiaryDTO;
import com.model.MemberDAO;
import com.model.MemberDTO;

public class DiaryReadingService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		HttpSession session = request.getSession();
		String targetdate = (String) session.getAttribute("targetdate");
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		String pregday = info.getPregnancy_day();
		
		SimpleDateFormat trans = new SimpleDateFormat("yyyy-MM-dd");

		Date ctargetdate;
		Date cpregday;
		Date today = new Date();
		try {
			ctargetdate = trans.parse(targetdate);
			String ctoday = trans.format(today);
			today = trans.parse(ctoday);
			long calDateDays1 = (ctargetdate.getTime() - today.getTime()) / (24 * 60 * 60 * 1000);
			System.out.println("오늘 날짜와 차이 = " + calDateDays1);
			
			cpregday = trans.parse(pregday);
			long calDateDays2 = (ctargetdate.getTime() - cpregday.getTime()) / (24 * 60 * 60 * 1000);
			System.out.println("임신일과의 차이 = " + calDateDays2);
			
			targetdate = trans.format(ctargetdate);
			if (calDateDays1 > 0) {
				moveURL = "Main.jsp";
				return moveURL;
			}
			if (calDateDays2 < 0) {
				moveURL = "Main.jsp";
				return moveURL;
			}
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}

		System.out.println("받은 날짜 : " + targetdate);
		session.setAttribute("targetdate",targetdate);
		
		
		DiaryDAO dao = new DiaryDAO();
		DiaryDTO diaryinfo = dao.diaryReading(info.getUser_id(), targetdate);
		
		
		if (diaryinfo != null) {
			session.setAttribute("diaryinfo", diaryinfo);
			MemberDAO mdao = new MemberDAO();
			ArrayList<String> diarydays = mdao.getdays(info.getUser_id());
			session.setAttribute("diarydays", diarydays);
			
			moveURL = "board_reading.jsp";
		} else {
			System.out.println("실패");
			moveURL = "board_writting.jsp";
		}
		return moveURL;
		
		
	}

}