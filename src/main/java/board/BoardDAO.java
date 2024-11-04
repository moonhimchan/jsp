package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.GetConn;
import member.MemberVO;

public class BoardDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private BoardVO vo = null;
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(pstmt != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally { pstmtClose(); }
		}
	}
	
	
	public List<BoardVO> getBoardList(int startIndexNo, int pageSize) {
		List<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql = "select * from board order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setContent(rs.getString("content"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
				vo.setwDate(rs.getString("wDate"));
				vo.setClaim(rs.getString("claim"));				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 :" +e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	// 게시글 작성처리
	public int setBoardInputOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "insert into board values (default,?,?,?,?,?,?,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getHostIp());
			pstmt.setString(6, vo.getOpenSw());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 :" +e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	
	// 게시글 1개 내용 가져오기
	public BoardVO getBoardContent(int idx) {
		BoardVO vo = new BoardVO();
		try {
			sql = "select * from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();		
			
			rs.next();
			
			vo = new BoardVO();
			vo.setIdx(rs.getInt("idx"));
			vo.setMid(rs.getString("mid"));
			vo.setNickName(rs.getString("nickName"));
			vo.setTitle(rs.getString("title"));
			vo.setHostIp(rs.getString("hostIp"));
			vo.setContent(rs.getString("content"));
			vo.setOpenSw(rs.getString("openSw"));
			vo.setReadNum(rs.getInt("readNum"));
			vo.setGood(rs.getInt("good"));
			vo.setwDate(rs.getString("wDate"));
			vo.setClaim(rs.getString("claim"));			
			} catch (SQLException e) {
			System.out.println("SQL 오류 :" +e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	// 글 조회수 1씩 증가시키기
	public void setContentReadNumPlus(int idx) {
		try {
			sql = "update board set readNum = readNum +1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();		 
		} catch (SQLException e) {
			System.out.println("SQL 오류 :" +e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	
	// 게시글 삭제처리
	public int BoardDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 :" +e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	


	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			 sql = "select count(idx) as cnt from board";
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			rsClose();
		}
		return totRecCnt;
	}
	
	// 게시글 수정 철;
	public int setBoardUpdateOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "update board set nickName=?, title=?, content=?, hostIp=?, openSw=?, wDate=now() where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setString(5, vo.getOpenSw());
			pstmt.setInt(6, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
	}
	
	
}