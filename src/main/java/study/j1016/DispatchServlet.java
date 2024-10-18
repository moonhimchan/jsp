package study.j1016;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dispatch")
public class DispatchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 응답 Content-Type 설정
        response.setContentType("text/html;charset=UTF-8");

        // 다른 서블릿이나 JSP로 요청 전달
        RequestDispatcher dispatcher = request.getRequestDispatcher("/hello");
        dispatcher.forward(request, response);
    }
}