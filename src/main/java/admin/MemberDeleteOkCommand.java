package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class MemberDeleteOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = (request.getParameter("level")==null || request.getParameter("level").equals("")) ? 0 : Integer.parseInt(request.getParameter("level"));
		
		MemberDAO dao = new MemberDAO();
		
		int res = dao.setMemberDeleteOk();
		
		if(res != 0) {
			request.setAttribute("message", "회원 탈퇴 확정입니다. 30일 후 회원이 탈퇴됩니다..");
			request.setAttribute("url", "MemberMain.mem");
		}
		else {
			request.setAttribute("message", "회원 탈퇴 실패~~~");
			request.setAttribute("url", "MemberMain.mem");
		}
	}

}
