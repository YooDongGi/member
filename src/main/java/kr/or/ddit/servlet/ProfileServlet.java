package kr.or.ddit.servlet;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceI;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet{

	private MemberServiceI userService = new MemberService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 기술하지 않아도 브라우저에서 해석해주긴 한다.
		resp.setContentType("image");		
		
		// userid 파라미터를 이용하여
		// userService 객체를 통해 사용자의 사진 파일 이름을 획득
		// 파일 입출력을 통해 사진을 읽어들여 resp객체의 outputStream으로 응답 생성
		String userid = req.getParameter("userid");
		MemberVo memVo = userService.selectMember(userid);
		
		String path = "";
		if(memVo.getRealfilename() == null) {		
			// DB에 사진이 등록되지않았을 경우 image에 있는 unknown.png로 보여준다
			path = getServletContext().getRealPath("./resources/images/unknown.png");
		} else {
			path = "d:\\upload\\" + memVo.getRealfilename();
		}
		FileInputStream fis = new FileInputStream(path);
		ServletOutputStream sos = resp.getOutputStream();
		
		byte[] buff = new byte[512];
		
		while(fis.read(buff) != -1) {
			sos.write(buff);
		}
		fis.close();
		sos.close();
		
	}
}
