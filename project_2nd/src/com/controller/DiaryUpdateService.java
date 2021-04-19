package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
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
import com.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/DiaryUpdateService")
public class DiaryUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("EUC-KR");

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		
		DiaryDTO diaryinfo = (DiaryDTO) session.getAttribute("diaryinfo");
		
		System.out.println(diaryinfo.getId());
		System.out.println(diaryinfo.getDay());
		System.out.println(diaryinfo.getTitle());
		System.out.println(diaryinfo.getImg());
		System.out.println(diaryinfo.getContent());
		System.out.println(diaryinfo.getNum());
		
		
		String savePath = "upload";

		int uploadFileSizeLimit = 10 * 1024 * 1024;
		String encType = "EUC-KR";

		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);



		int num = diaryinfo.getNum();
		String id = "";
		String img = null;
		String day = null;
		String title = null;
		String content = null;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // HH:mm:ss(시분초)
		Date cdate = null;
		try {
			cdate = dateFormat.parse(diaryinfo.getDay());
		} catch (ParseException e1) {
			e1.printStackTrace();
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
				System.out.print("파일 업로드 되지 않았음");
				System.out.println("기존의 이미지를 사용합니다.");
				img = diaryinfo.getImg();
				day = dateFormat.format(cdate);
				title = multi.getParameter("title");
				content = multi.getParameter("content");
			} else {
				day = dateFormat.format(cdate);
				title = multi.getParameter("title");
				content = multi.getParameter("content");
			}
		} catch (Exception e) {
			System.out.print("예외 발생 : " + e);
		}

		DiaryDAO dao = new DiaryDAO();
		DiaryDTO dto = new DiaryDTO(num, id, img, day, title, content);

		int cnt = dao.update(dto);

		if (cnt > 0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}

		// 다이어리 정보
		diaryinfo = dao.diaryReading(id, dateFormat.format(cdate));

		if (diaryinfo != null) {
			System.out.println("가져오기 성공");
			session.setAttribute("diaryinfo", diaryinfo);
			response.sendRedirect("Main.jsp");
		} else {
			System.out.println("가져오기 실패");
			response.sendRedirect("Main.jsp");

		}

	}

}
