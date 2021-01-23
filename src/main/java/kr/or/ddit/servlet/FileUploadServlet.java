package kr.or.ddit.servlet;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Collection;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.util.FileUtil;


@MultipartConfig
@WebServlet("/fileUpload")
public class FileUploadServlet extends HttpServlet{
	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadServlet.class);
	//doPost : 파일 업로드화면에서 서버로 파일 업로드 요청
	//			요청 처리 후에 파일 업로드 화면으로 이동
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		logger.debug( "contentType : {} " , req.getContentType() );
		logger.debug("userid : {}", req.getParameter("id"));
		Part part = req.getPart("picture");
		
		if(part.getSize() > 0) {	// 파일이 있을 경우 업로드
			// 사용자가 업로드한 파일 이름
			String filename = FileUtil.getFileName(part.getHeader("Content-Disposition"));
			
			// 서버에 저장할 때 다른 사용자의 파일과 중복되지 않도록 생성한 파일이름
			String realFileName = UUID.randomUUID().toString();
			
			part.write("d:\\upload\\" + filename);	//인자는 파일의 저장 위치
		}
		
		logger.debug("Content-Disposition : {}", part.getHeader("Content-Disposition"));
		doGet(req,resp);
	}
}

