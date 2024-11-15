package common;

import java.util.Calendar;

public class JavaGroupProcess {
	
	public String getTimeBasedFileName() {
		// 파일명 중복방지(날짜로 처리)
		Calendar cal = Calendar.getInstance();
		int yy = cal.get(Calendar.YEAR);
		int mm = cal.get(Calendar.MONTH) + 1;
		int dd = cal.get(Calendar.DAY_OF_MONTH);
		int hh = cal.get(Calendar.HOUR_OF_DAY);
		int mi = cal.get(Calendar.MINUTE);
		int ss = cal.get(Calendar.MILLISECOND);
		
		String strMM=mm+"", strDD=dd+"", strHH=hh+"", strMI=mi+"", strSS=ss+"", temp="";
		
		if(mm < 10) strMM = "0" + mm;
		if(dd < 10) strDD = "0" + dd;
		if(hh < 10) strHH = "0" + hh;
		if(mi < 10) strMI = "0" + mi;
		if(ss < 10) strSS = "0" + ss;
		
		temp = yy + strMM + strDD + strHH + strMI + strSS;
		//System.out.println("날짜 : " + yy + strMM + strDD + strHH + strMI + strSS);
		return temp;
	}
}
