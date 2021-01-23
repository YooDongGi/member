package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceI;
import kr.or.ddit.util.FileUtil;

@MultipartConfig
@WebServlet("/memberModify")
public class MemberModify extends HttpServlet{

	private MemberServiceI service = new MemberService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userid = req.getParameter("userid");
		
		MemberVo member = service.selectMember(userid);
		
		req.setAttribute("member", member);
		
		req.getRequestDispatcher("/member/membermodify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		String userid = req.getParameter("id");
		String usernm = req.getParameter("name");
		String pass = req.getParameter("pass");
		Date reg_dt = new Date();
		String alias = req.getParameter("alias");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String zipcode = req.getParameter("zipcode");
		String filename = "";
		String realfilename = "";
		
		Part profile = req.getPart("picture");
		if( profile.getSize() > 0 ) {		// 파일을 업로드했을 때
			filename = FileUtil.getFileName(profile.getHeader("Content-Disposition"));
			String fileExtension = FileUtil.getFileExtension(filename);
			realfilename = UUID.randomUUID().toString() + fileExtension;
			profile.write("d:\\upload\\" + realfilename);
		} else {							// 파일을 업로드하지 않았을 때
			filename = req.getParameter("filename");
			realfilename = req.getParameter("realfilename");
		}
		
		MemberVo member = new MemberVo(userid, usernm, pass, reg_dt, alias, addr1, addr2, zipcode, filename, realfilename);
		
		int updateCnt = 0;
		
		try {
			updateCnt = service.memberUpdate(member);
		} catch (Exception e) {
			updateCnt = 0;
		}
		
		if(updateCnt != 0 ) {
			resp.sendRedirect(req.getContextPath()+"/member?id="+userid);
		} else {
			doGet(req, resp);
		}
			
		
	}
}
