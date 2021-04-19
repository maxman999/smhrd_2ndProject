package com.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.DiaryDTO;
import com.model.MemberDAO;
import com.model.MemberDTO;

public class LoginService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;

		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("pw");
		String user_name = null;
		int age = 0;
		MemberDTO dto = new MemberDTO(user_id, user_pw, user_name, age);
		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.login(dto);

		if (info != null) {
			System.out.println("�α��� ����");
			HttpSession session = request.getSession();
			ArrayList<String> diarydays = dao.getdays(info.getUser_id());

			SimpleDateFormat trans1 = new SimpleDateFormat("yyyy-MM-dd");
			Date sDate = null;
			try {
				sDate = trans1.parse(info.getPregnancy_day());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			// �ӽ� �ּ� ���
			Date eDate = new Date();
			long calDate = sDate.getTime() - eDate.getTime();
			long calDateDays = calDate / (24 * 60 * 60 * 1000);
			calDateDays = Math.abs(calDateDays);
			long cpregWeek = (calDateDays / 7); // �ӽ� �ּ�
			System.out.println("�� ��¥�� ��¥ ����: " + calDateDays);
			System.out.println("�ӽ� �ּ� : " + cpregWeek);
			String[] weekKeywords = new String[3];
			String[] weekKeyUrl = new String[3];
			
			// ����ȭ
			if (cpregWeek < 8) {
				cpregWeek = 0;
				weekKeywords[0] = "�ӽ� �ʱ� ������ �˻� �˾ƺ���";
				weekKeyUrl[0] = "https://www.chamc.co.kr/health/guide/default.asp?ct_id=328&cc_id=32806";
				weekKeywords[1] = "�ӽ� �� ���۽��� ���� �˾ƺ���";
				weekKeyUrl[1] = "https://brunch.co.kr/@chemie/12";
				weekKeywords[2] = "�ӽ� �ʱ� �Ե� �غ� ���Ͽ�";
				weekKeyUrl[2] = "https://www.cnuh.com/health/disease.cs;WEB_JSESSIONID=1BFB761C16F6FB81D7C88BA9E4B0AD9E?act=view&infoId=507&searchKeyword=&searchCondition=&pageIndex=7";
			} else if (cpregWeek >= 8 && cpregWeek < 12) {
				cpregWeek = 1;
			} else if (cpregWeek >= 12 && cpregWeek < 16) {
				cpregWeek = 2;
			} else if (cpregWeek >= 16 && cpregWeek < 20) {
				cpregWeek = 3;
			} else if (cpregWeek >= 20 && cpregWeek < 24) {
				cpregWeek = 4;
			} else if (cpregWeek >= 24 && cpregWeek < 28) {
				cpregWeek = 5;
			} else if (cpregWeek >= 28 && cpregWeek < 32) {
				cpregWeek = 6;
			} else if (cpregWeek >= 32 && cpregWeek < 36) {
				cpregWeek = 7;
			} else if (cpregWeek >= 36 && cpregWeek < 40) {
				cpregWeek = 8;
			} else if (cpregWeek >= 40) {
				weekKeywords[0] = "�̽�, ����� �˸��� ��ȣ";
				weekKeyUrl[0] = "https://www.ibabynews.com/news/articleView.html?idxno=26738";
				weekKeywords[1] = "�ڿ��и��� ���������� ����";
				weekKeyUrl[1] = "https://www.ibabynews.com/news/articleView.html?idxno=26738";
				weekKeywords[2] = "�ӽ� �ʱ� �Ե� �غ� ���Ͽ�";
				weekKeyUrl[2] = "https://www.ibabynews.com/news/articleView.html?idxno=26738";
				cpregWeek = 9;
			}

			String pregWeek = String.valueOf(cpregWeek);
			
			// D-day ����
			Calendar cal = Calendar.getInstance();
			Date bdate = new Date();
			try {
				bdate = trans1.parse(info.getPregnancy_day());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			cal.setTime(bdate);

			cal.add(Calendar.MONTH, 9);
			cal.add(Calendar.DATE, 7);
			String Birthday = trans1.format(cal.getTime());
			System.out.println(Birthday);


		

			session.setAttribute("info", info);
			session.setAttribute("diarydays", diarydays);
			session.setAttribute("pregWeek", pregWeek);
			session.setAttribute("weekKeywords", weekKeywords);
			session.setAttribute("Birthday", Birthday);
			session.setAttribute("weekKeyUrl", weekKeyUrl);
			
			
			moveURL = "Main.jsp";
		} else {
			System.out.println("�α��� ����");
			moveURL = "Main.jsp";
		}
		return moveURL;
	}

}