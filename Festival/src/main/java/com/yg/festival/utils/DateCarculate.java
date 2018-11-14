package com.yg.festival.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 * 날짜 계산 class
 * @author "CSG"
 *
 */
public class DateCarculate {

	
	/**
	 * 데이터 수정일시를 가져와서 오늘과 몇일 차이 나는지 알려준다.
	 * @param updDt
	 * @return
	 */
	public static int getDays(String updDt){
		
		long d1,d2; 
		
		//오늘 날짜 생성
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date ( );
		String today = formatter.format ( currentTime );
		
		int tYear = Integer.parseInt(today.split("-")[0]);
		int tMonth = Integer.parseInt(today.split("-")[1]);
		int tDay = Integer.parseInt((today.split("-")[2].split(" ")[0]));
		
		//수정일자 split
		int uYear = Integer.parseInt(updDt.split("-")[0]);
		int uMonth = Integer.parseInt(updDt.split("-")[1]);
		int uDay = Integer.parseInt((updDt.split("-")[2].split(" ")[0]));

		//오늘
		Calendar cT = Calendar.getInstance();
		//수정일
		Calendar cU = Calendar.getInstance(); 

		// 날짜 지정 
		cT.set(tYear,tMonth,tDay); 
		cU.set(uYear,uMonth,uDay); 

		// MilliSecond 로 변환 
		d1 = cT.getTime().getTime(); 
		d2 = cU.getTime().getTime(); 

		// 날짜 차이 계산 
		int days =(int)((d1-d2)/(1000*60*60*24)); 
		
		return days;
		
	}
	
}
