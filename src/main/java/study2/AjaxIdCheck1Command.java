package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxIdCheck1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		StudyDAO dao = new StudyDAO();
		
		String name = dao.getIdSearch(mid);
		
		if(name.equals("")) {
			name = "찾는 아이디가 없습니다.";
		}		
			response.getWriter().write(name);
		}
}
