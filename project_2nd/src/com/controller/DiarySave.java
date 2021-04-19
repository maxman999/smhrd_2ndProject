package com.controller;

import java.io.IOException;

import java.text.ParseException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.DiaryDAO;
import com.model.DiaryDTO;
import com.model.MemberDAO;
import com.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/DiarySave.do")
public class DiarySave extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		// 다이어리 등록
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		
		
		String savePath = "upload";

		int uploadFileSizeLimit = 10 * 1024 * 1024;
		String encType = "EUC-KR";

		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);

		String id = "";
		String img = null;
		String day = null;
		String title = null;
		String content = null;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // HH:mm:ss(시분초)
		Date dtoday = new Date();
		String today = dateFormat.format(dtoday);
		System.out.println("지금1");
		String targetdate = (String)session.getAttribute("targetdate");
		System.out.println("지금2");
		if(targetdate == null) {
			targetdate = today;
		}
		if(targetdate.equals(today)) {
		}else {
			today = targetdate;
		}
		
		if (info == null) {
			System.out.println("로그인을 해주세요.");
		} else {
			id = info.getUser_id();
		}
		
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType,
					new DefaultFileRenamePolicy());
			img = multi.getFilesystemName("bf_file[]");
			System.out.println("파일의 경로 : " + img);
			if (img == null) {
				System.out.println("파일 업로드 되지 않았음");
				System.out.println("이미지 없음으로 등록");
				img = "noimage.jpg";
				day = today;
				title = multi.getParameter("title");
				content = multi.getParameter("content");
			} else {
				day = today;
				title = multi.getParameter("title");
				content = multi.getParameter("content");
			}
		} catch (Exception e) {
			System.out.print("예외 발생 : " + e);
		}

		// 날짜 중복 확인
		DiaryDAO diarydao = new DiaryDAO();
		DiaryDTO diaryinfo = diarydao.alldiarydate(id);

		PrintWriter writer = response.getWriter();
		String moveURL = null;
		System.out.println(diaryinfo == null);
		
		System.out.println("일기 날짜 : " + day);
		

		if ((diaryinfo == null) || !diaryinfo.getDay().substring(0, 10).equals(day)) {

			// 일기 등록
			DiaryDAO dao = new DiaryDAO();
			DiaryDTO dto = new DiaryDTO(id, img, day, title, content);
			// 다이어리 다시 가져와서 저장
			String user_id = request.getParameter("id");
			diarydao = new DiaryDAO();
			diaryinfo = diarydao.alldiarydate(user_id);
			int cnt = dao.diary(dto);

			if (cnt > 0) {
				System.out.println("일기등록 성공");
			MemberDAO mdao = new MemberDAO();
			ArrayList<String> diarydays = mdao.getdays(info.getUser_id());
			session.setAttribute("diarydays",diarydays);
			} else {
				System.out.println("일기등록 실패");
			}

			if (diaryinfo != null) {
				System.out.println("가져오기 성공");
				session.setAttribute("diaryinfo", diaryinfo);
			} else {
				System.out.println("가져오기 실패");
			}
			moveURL = "Main.jsp";
			writer.println("<script>alert('일기가 작성되었습니다..'); location.href='" + moveURL + "';</script>");
			writer.close();
			/* response.sendRedirect(moveURL); */

		} else if (diaryinfo.getDay().substring(0, 10).equals(day)){

			System.out.println("중복날짜 발견");

			// 다이어리 다시 가져와서 저장
			String user_id = request.getParameter("id");
			diarydao = new DiaryDAO();
			diaryinfo = diarydao.alldiarydate(user_id);

			if (diaryinfo != null) {
				System.out.println("가져오기 성공");
				session.setAttribute("diaryinfo", diaryinfo);

			} else {
				System.out.println("가져오기 실패");
			}

			moveURL = "Main.jsp";

			writer.println("<script>alert('일기가 이미 존재합니다.'); location.href='" + moveURL + "';</script>");
			writer.close();

		}

	}
}
