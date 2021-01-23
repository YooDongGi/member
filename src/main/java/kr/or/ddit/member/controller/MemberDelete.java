package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceI;

@WebServlet("/memberDelete")
public class MemberDelete extends HttpServlet{
	
	private MemberServiceI service = new MemberService();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userid = req.getParameter("userid");
		
		int deleteCnt = 0;
		
		try {
			deleteCnt = service.memberDelete(userid);
			
		} catch (Exception e) {
			deleteCnt = -1;
		}
		
		if(deleteCnt > 0) {
			resp.sendRedirect(req.getContextPath()+"/login");
		} else {
			resp.sendRedirect(req.getContextPath()+"/member?id="+ userid);
		}
		
	}
}
