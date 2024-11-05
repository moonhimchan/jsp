package admin.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import member.MemberDAO;
import member.MemberVO;

public class MemberDeleteOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = (request.getParameter("level")==null || request.getParameter("level").equals("")) ? 0 : Integer.parseInt(request.getParameter("level"));
		
		MemberDAO dao = new MemberDAO();
		
		int res = dao.setMemberDeleteOk();
		
		request.setAttribute("res", res);
		
		if(res != 0) {
			request.setAttribute("message", "회원 탈퇴 되었습니다");
			request.setAttribute("url", "MemberMain.mem");
		}
		else {
			request.setAttribute("message", "회원 탈퇴 실패했습니다. 삭제는 30일 이후 부터 가능합니다.");
			request.setAttribute("url", "MemberMain.mem");
		}
	}

}
