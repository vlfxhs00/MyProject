package common;

import javax.servlet.http.Cookie;

public class Util {
	//useCookie�� �ڵ带 ���� �޼ҵ�ȭ�ؼ� �������� ���
	public static String getCookie(Cookie[] cookies, String name) {
		String result="";
		if(cookies!=null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals(name)) {
					result=cookies[i].getValue();
					break;
				}//if
			}//for
		}// outer if
		return result;
	}//getCookie()
}
