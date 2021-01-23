package kr.or.ddit.login;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceI;

@WebServlet("/login")
public class Login extends HttpServlet{
	
	private MemberServiceI service = new MemberService();
	private static final Logger logger = LoggerFactory.getLogger(Login.class);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pageParam = req.getParameter("page");
		String pageSizeParam = req.getParameter("pageSize");
		
		int page = pageParam == null ? 1 : Integer.parseInt(pageParam);
		int pageSize = pageSizeParam == null ? 5 : Integer.parseInt(pageSizeParam);
		
		// 전체 회원 수
		int cnt = service.selectAllCnt();
		
		PageVo vo = new PageVo(page, pageSize);
		
		int pagination = (int)Math.ceil((double)cnt/pageSize);
		
		List<MemberVo> memberList = service.selectPagingMember(vo);
		
		req.setAttribute("memberList", memberList);
		req.setAttribute("pagination", pagination);
		req.setAttribute("pageVo", vo);
		req.getRequestDispatcher("/member/memberList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		logger.debug("id : {}", id);
		String pass = req.getParameter("pass");
		
		MemberVo member = service.selectMember(id);
		
		if(member != null && member.getPass().equals(pass) ) {
			
			HttpSession session = req.getSession();
			session.setAttribute("S_USER", member);

			doGet(req, resp);
		} else {
			//resp.sendRedirect(req.getContextPath()+"/login.jsp");
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
			
		}
		
	}
}
