package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoUpDateOkCommand implements DoInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 DoUpDateOkCommand 입니다.");
		
		// 수정처리한 정보들을 DB에 다시 업데이트 처리하고 돌오온다.
		
		request.setAttribute("message", "회원 정보가 수정 되었습니다.");
		request.setAttribute("url", "study2/mapping/Test2");
	}
}
