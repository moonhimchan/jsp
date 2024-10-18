package study.j1016;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;


@SuppressWarnings("serial")
@WebServlet("/1016/T03Ok2")
public class T03Ok2 extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			
			String name = request.getParameter("name")==null ? "" : request.getParameter("name");
			int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender");
			String[] hobbys = request.getParameterValues("hobby");
			String job = request.getParameter("job");
			String[] mountains = request.getParameterValues("mountain");
			String content = request.getParameter("content")==null ? "" : request.getParameter("content");
			
			String hobby = "";
      if (hobbys != null) {
          for (String h : hobbys) {
              hobby += h + "/";
          }
          hobby = hobby.substring(0, hobby.length() - 1);
      }
      
      String mountain = "";
      if (mountains != null) {
          for (String m : mountains) {
              mountain += m + "/";
          }
          mountain = mountain.substring(0, mountain.length() - 1);
      }
      
      content = content.replace("\n", "<br/>");
      String fName = request.getParameter("fName") == null ? "" : request.getParameter("fName");
           
			request.setAttribute("name", name);
			request.setAttribute("age", age);
			request.setAttribute("gender", gender);
			request.setAttribute("hobby", hobby);
			request.setAttribute("job", job);
			request.setAttribute("mountain", mountain);
			request.setAttribute("content", content);		
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/study/1016/t03_FormResult2.jsp");
			dispatcher.forward(request, response);
	}
}
