package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsTotalDownCommand implements PdsInterface {

	@SuppressWarnings("resource")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		// idx로 DB에 저장된 파일의 정보(업로드시파일명/서버저장파일명)를 가져온다.
		PdsDAO dao = new PdsDAO();
		PdsVO vo = dao.getPdsContent(idx);
		
		// 원본파일명과 서버저장파일명을 각각 분리시켜준다.
		String[] fNames = vo.getfName().split("/");
		String[] fSNames = vo.getfSName().split("/");
		
//		int i = 0;
//		for(String fName : fNames) {
//			System.out.print((i+1) + ". 원본파일 : " + fName + " , ");
//			System.out.println("서버파일 : " + fSNames[i]);
//			i++;
//		}
		
		// 파일 압축 다운로드시 필요한 객체를 준비.
		FileInputStream fis = null;
		FileOutputStream fos = null;
		ZipOutputStream zos = null;
		ServletOutputStream sos = null;
		
		// 작업에 필요한 경로 설정 / 저장시킬 압축파일명설정
		String realPath = request.getServletContext().getRealPath("/images/pds/");
		String zipPath = request.getServletContext().getRealPath("/images/pds/temp/");
		String zipName = vo.getTitle() + ".zip";
		
		// 원본파일을 압축/저장시킬 객체 생성
		fos = new FileOutputStream(zipPath + zipName);
		zos = new ZipOutputStream(fos);
		
		byte[] buffer = new byte[2048];
		int size = 0;
		
		// zip파일 만들기...  각각의 파일을 압축처리하기위한 각 fis을 생성후 zos에 처리한다.
		for(int i=0; i<fSNames.length; i++) {
			File file = new File(realPath + fSNames[i]);
			fis = new FileInputStream(file);
			zos.putNextEntry(new ZipEntry(fNames[i]));	// zip파일에 넣을때는 원본이름으로 넣어준다.
			
			while((size = fis.read(buffer)) != -1) {
				zos.write(buffer, 0, size);
			}
			zos.flush();
			zos.closeEntry();
			fis.close();
		}
		zos.close();
		
		// 서버에서의 압축작업이 완료되면, 서버의 압축파일을 클라이언트로 전송하고, 서버에 존재하는 압축파일은 삭제시킨다.
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downLoadName = new String(zipName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(zipName.getBytes("EUC-KR"), "8859_1");
		}
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		fis = new FileInputStream(zipPath + zipName);
		sos = response.getOutputStream();
		
		while((size = fis.read(buffer)) != -1) {
			sos.write(buffer, 0, size);
		}
		sos.flush();
		sos.close();
		fis.close();
		
		// 전송이 끝나면 서버의 압축파일을 삭제처리한다.
		new File(zipPath + zipName).delete();
		
		// 다운로드수 증가처리
		dao.setPdsDownNumCheck(idx);
	}

}
