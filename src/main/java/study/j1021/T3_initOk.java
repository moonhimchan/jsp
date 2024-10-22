package study.j1021;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/1021/T3_initOk")
public class T3_initOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 /1021/T3_initOk");
		
		String logoName = getServletContext().getInitParameter("logoName");
		String homeAdrress = getServletContext().getInitParameter("homeAdrress");		
		
		HttpSession session = request.getSession();
		
//		session.setAttribute("sLogoName", "그린 주식회사");
//		session.setAttribute("sHomeAddress", "www.green.com");
		session.setAttribute("sLogoName", logoName);
		session.setAttribute("sHomeAddress", homeAdrress);
		
		response.sendRedirect(request.getContextPath()+"/study/1021_xml/t3_init.jsp");
	}
}
