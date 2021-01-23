package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.common.model.PageVo_S;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceI;

@WebServlet("/searchMember")
public class MemberSearch extends HttpServlet{
	
	private MemberServiceI service = new MemberService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageParam = req.getParameter("page");
		String pageSizeParam = req.getParameter("pageSize");
		String searchType = req.getParameter("sT");
		String keyword = req.getParameter("kW");
		
		int page = pageParam == null ? 1 : Integer.parseInt(pageParam);
		
		int pageSize = pageSizeParam.equals("") ? 5 : Integer.parseInt(pageSizeParam);
		
		Map<String,Object> map = null;
		
		PageVo_S vo = new PageVo_S(page, pageSize, keyword);
		
		if(keyword.equals("") || searchType.equals("")) {
			resp.sendRedirect(req.getContextPath() + "/login?page="+page+"&pageSize="+pageSize);
		} else { 
		
			if(searchType.equals("i")) {
				map = service.searchMemberid(vo);
				
			} else if(searchType.equals("n")) {
				
				map = service.searchMembernm(vo);
				
			} else if(searchType.equals("a")) {
				map = service.searchMemberalias(vo);
			} 
			
			List<MemberVo> memberList = (List<MemberVo>)map.get("memberList");
			int cnt = (int)map.get("cnt");
			
			int pagination = (int)Math.ceil((double)cnt/pageSize);
			
			req.setAttribute("memberList", memberList);
			req.setAttribute("pagination", pagination);
			req.setAttribute("pageVo", vo);
			
			req.getRequestDispatcher("/member/memberList.jsp").forward(req, resp);
		}
	}
}
