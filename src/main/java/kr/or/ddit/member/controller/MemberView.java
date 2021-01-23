package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceI;

@MultipartConfig
@WebServlet("/member")
public class MemberView extends HttpServlet {
	
	private MemberServiceI service = new MemberService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userid = req.getParameter("id");
		
		MemberVo member = service.selectMember(userid);
		
		req.setAttribute("member", member);
		
		req.getRequestDispatcher("/member/member.jsp").forward(req, resp);
	}
	
}
