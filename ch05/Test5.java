package ch05;

import java.util.Calendar;

// 코드로 관리할 것과 enum 으로 관리할 것 구분 
public class Test5 {

	public static void main(String[] args) {
		// enum
		Week today = null;
		
		Calendar cal = Calendar.getInstance();
		int week = cal.get(Calendar.DAY_OF_WEEK); //1~7 (일, 월~ 토)
		System.out.println(week);
		
		switch(week) {
		case 1: today = Week.SUNDAY; break;
		case 2: today = Week.MONDAY; break;
		case 3: today = Week.TUSEDAY; break;
		case 4: today = Week.WEDNESDAY; break;
		case 5: today = Week.THURSDAY; break;
		case 6: today = Week.FRIDAY; break;
		case 7: today = Week.SATURDAY; break;
		}
		
		System.out.println(today);
		

	}

}
