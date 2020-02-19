package joinmember;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/JoinMemberController_servlet/*")
public class JoinMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path=request.getContextPath();
		
		JoinMemberDAO dao = new JoinMemberDAO(); 
		if(uri.indexOf("list.do") != -1) {
		System.out.println("list.do 호출..");
		System.out.println(request.getRequestURI());
		System.out.println(uri.indexOf("list.do"));
		Map<String,Object> map = new HashMap<>();
		List<JoinMemberDTO> list=dao.JoinList();
		map.put("list", list);
		map.put("count", list.size());
		request.setAttribute("map", map);
		String page="/project/join_list.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request, response);
		}else if(uri.indexOf("join.do") != -1) {
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String pass1 = request.getParameter("pass1");
			String pass2 = request.getParameter("pass2");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String job = request.getParameter("job");
			JoinMemberDTO dto = new JoinMemberDTO();
			dto.setName(name);
			dto.setId(id);
			dto.setPass1(pass1);
			dto.setPass2(pass2);
			dto.setEmail(email);
			dto.setTel(tel);
			dto.setJob(job);
			dao.insert(dto);
	
	}else if(uri.indexOf("update.do") != -1) {
		String name = request.getParameter("name");
		System.out.println(name);
		String id = request.getParameter("id");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String job = request.getParameter("job");
		JoinMemberDTO dto = new JoinMemberDTO();
		dto.setName(name);
		dto.setId(id);
		dto.setPass1(pass1);
		dto.setPass2(pass2);
		dto.setEmail(email);
		dto.setTel(tel);
		dto.setJob(job);
		dao.update(dto);
		response.sendRedirect(path+"/project/mypage.jsp?message=update");
		
	}else if(uri.indexOf("login.do") != -1) {//개별 주소
		String id=request.getParameter("id");
		System.out.println(id);
		String pass1=request.getParameter("pass1");
		System.out.println(pass1);
		String name=dao.loginCheck(id, pass1);
		System.out.println(name);
		String page="/project/session_login.jsp";
		if(name!="") {//로그인 성공
			//세션 객체 생성
			HttpSession session=request.getSession();
			//세션에 값 저장
			session.setAttribute("name", name);
			page="/project/index.jsp?message=login";
			response.sendRedirect(path+page);
		}else {//로그인 실패
			response.sendRedirect(path+"/project/session_login.jsp?message=error");
			}
	} else if(uri.indexOf("logout.do") != -1) {//로그아웃 처리
			//세션객체 생성
			HttpSession session=request.getSession();
			//세션을 비움(초기화)
			session.invalidate();
			//로그인 페이지로 이동
			String page=request.getContextPath()
					+"/project/index.jsp?message=logout";
			response.sendRedirect(page);
	} else if(uri.indexOf("mypage.do")!=-1) {
		String name=request.getParameter("name");
		List<JoinMemberDTO> items=dao.mypage(name);
		System.out.println(items);
		request.setAttribute("items", items);
		String page="/project/mypage.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request, response);
	} else if(uri.indexOf("delete.do")!=-1) {
		System.out.println("삭제 시작");
		String id=request.getParameter("id");
		System.out.println(id);
		dao.delete(id);
		HttpSession session=request.getSession();
		session.invalidate();
		String page=request.getContextPath()
				+"/project/index.jsp?message=delete";
		response.sendRedirect(page);
	}else if(uri.indexOf("findid.do") != -1) {//개별 주소
		System.out.println("아이디 찾기 시작");
		String name=request.getParameter("name");
		System.out.println(name);
		String email=request.getParameter("email");
		System.out.println(email);
		String id=dao.findid(name, email);
		System.out.println(id);
		String page="/project/findid.jsp";
		request.setAttribute("id",id);
		page="/project/findid.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}else if(uri.indexOf("findpw.do") != -1) {
		System.out.println("비밀번호 찾기 시작");
		String id = request.getParameter("id");
		System.out.println(id);
		String email = request.getParameter("email");
		System.out.println(email);
		String pass1 = dao.findpw(id, email);
		System.out.println(pass1);
		String page="/project/findpw.jsp";
		request.setAttribute("pass1", pass1);
		page="/project/findpw.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);

	}
	
}		


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}

}
