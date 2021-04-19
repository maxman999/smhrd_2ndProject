package com.controller;

import java.io.IOException;


import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String id = request.getParameter("id");
      String pw = request.getParameter("pw");
      System.out.println(id);
      System.out.println(pw);
      
      MemberDTO dto = new MemberDTO(id, pw);
      MemberDAO dao = new MemberDAO();
      boolean result = dao.loginCheck(dto);
      
      PrintWriter out = response.getWriter();
      out.print(result);
      
   }


}