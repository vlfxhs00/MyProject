package product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.dao.ProductDAO;
import product.dto.ProductDTO;


@WebServlet("/Product_servlet/*")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		System.out.println(uri);
		ProductDAO dao = new ProductDAO();
		if(uri.indexOf("list.do") != -1) {
			/*
			 * //검색옵션과 검색키워드 String searchkey=request.getParameter("searchkey"); String
			 * search=request.getParameter("search");
			 * 
			 * if(searchkey==null) searchkey="p_name"; if(search==null) search="";
			 * 
			 * System.out.println("searchkey"+searchkey);
			 * System.out.println("search"+search);
			 */
			
			List<ProductDTO> items=dao.getList();//방명록 리스트
			request.setAttribute("list", items);
			String page="/product/productlist.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("insert.do") != -1) {
			System.out.println("상품등록시작");
			int idx = Integer.parseInt(request.getParameter("idx"));
			String p_name = request.getParameter("p_name");
			int price = Integer.parseInt(request.getParameter("price"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			String intro = request.getParameter("intro");
			String img = request.getParameter("img");
			ProductDTO dto = new ProductDTO();
			dto.setIdx(idx);
			dto.setPrice(price);
			dto.setP_name(p_name);
			dto.setAmount(amount);
			dto.setIntro(intro);
			dto.setImg(img);
			dao.pdInsert(dto);
			String add_message="상품이 등록되었습니다.";
			String url = "/Product_servlet/list.do?message"+add_message;
			response.sendRedirect(request.getContextPath()+url);			
		} else if(uri.indexOf("pro_list.do") != -1) {
			String pro=request.getParameter("pro");
			List<ProductDTO> items=dao.getPro_List(pro);//방명록 리스트
			request.setAttribute("pro_list", items);
			String page="/product/productlist.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
				
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
