package a.b.c.com.common;

public class CodeUtil {


	
	// 핸드폰 라벨
	public static final String[] hp_value = {"010", "011", "016", "017"};
		

	

	
	// 생년월일 
	public static String birth(String s) {

		
		String s0 = "";
		String s1 = "";
		String s2 = "";
		String ss = "";
		
		if (s !=null && s.length() > 0){			
			int sLen = s.length();			
			if (8 == sLen) {
				s0 = s.substring(0, 4);
				s1 = s.substring(4, 6);
				s2 = s.substring(6);				
				ss = s0 + "-" + s1 + "-" + s2;
			}
		}		
		return ss;
	}
	

	
	// 핸드폰 
	public static String hp(String s) {

		String s0 = "";
		String s1 = "";
		String s2 = "";
		String ss = "";
		
		if (s !=null && s.length() > 0){			
			int sLen = s.length();			
			if (11 == sLen) {
				s0 = s.substring(0, 3);
				s1 = s.substring(3, 7);
				s2 = s.substring(7);
				ss = s0 + "-" + s1 + "-" + s2;
			}
		}		
		return ss;
	}

	
	
	
	
	
		
	public static void main(String args[]) {
		
		// 생년월일
		String b = CodeUtil.birth("20210801");		
		System.out.println("b >>> : " + b);
		
	
		
		// 핸드폰
		String hp = CodeUtil.hp("01012341234");		
		System.out.println("hp >>> : " + hp);		
		
		
	}	
}
