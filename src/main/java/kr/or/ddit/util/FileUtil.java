package kr.or.ddit.util;

public class FileUtil {
	// filename이 있을 경우 filename에 해당하는 값을 반환해주는 메소드
	public static String getFileName(String contentDisposition) {
		//ex] contentDisposition = "form-data; name="file"; filename="brown.png"";

		String[] attrs = contentDisposition.split("; ");
		
		for(String attr : attrs) {
			if(attr.startsWith("filename=")) {
				attr = attr.replace("filename=", "");
				
				return attr.substring(1, attr.length()-1);
			}
		}
		//데이터에 filename이 없는 경우도 있다
		//ex] contentDisposition = "form-data; name="file"; 
		return "";
	}
	// filename = brown.png
	// 확장자를 알아오기 위한 메소드
	public static String getFileExtension(String filename) {
		// 확장자가 없는 파일이 올 경우
		if( filename.indexOf(".") == -1 ) {
			return "";
		}
		// 파일명에 .이 포함될 수 있어서 lastIndexOf를 사용
		return "."+filename.substring(filename.lastIndexOf(".") + 1);
	}
}
