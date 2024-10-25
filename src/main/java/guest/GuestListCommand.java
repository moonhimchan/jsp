package guest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestListCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		
		// 1. 현재 페이지번호를 구한다.
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		// 2. 한페이지 분량을 구한다.(pageSize)
		int pageSize = request.getParameter("pageSize")==null ? 3 : Integer.parseInt(request.getParameter("pageSize"));
		
		// 3. 총 레코드 건수를 구한다 .(totRecCnt) - sql 명령어중 count함수 이용
		int totRecCnt = dao.getTotRecCnt();
		
		// 4. 총 페이지 건수를 구한다.(totPage)
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) +1;
		
		// 5. 현재페이지에서 출력되는 '시작 인덱스 번호'를 구한다.(startIndexNo)
		int startIndexNo = (pag - 1) * pageSize;
		
		// 6. 현재 표시할 화면에서 시작되는 시작번호를 구한다.(curScrStartNo)
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// 블록페이징처리...(시작브록을 0으로 처리했다.)
		// 1.블록의 크기결정(여기선 3으로 결정)
		int blockSize = 3;
		
		// 2. 현재페이지가 속한 블록의 번호를 구한다.
		int curBlock = (pag - 1) / blockSize;
		
		// 3. 마지막 블록을 구한다.
		int lastBlock = (totPage - 1 ) / blockSize; 
		
		// 한페이지에 표시할 건수만을 DB에서 가져온다.
		List<GuestVO>  vos = dao.getGuestList(startIndexNo, pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	}
}
