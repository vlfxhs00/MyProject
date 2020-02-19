package board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.dao.BoardDAO;
import board.dto.BoardCommentDTO;
import board.dto.BoardDTO;
import common.Constants;
import page.Pager;


public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws 
	ServletException, IOException {
		//Ŭ���̾�Ʈ���� ��û�� �ּ�
		String url=request.getRequestURL().toString();
		//���ؽ�Ʈ �н�(��������Ʈ�� �ĺ���)
		String contextPath=request.getContextPath();
		BoardDAO dao=new BoardDAO();
		if(url.indexOf("list.do") != -1) {
			//���ڵ� ���� �Ի�
			int count=dao.count();
			//������ �����⸦ ���� ó��
			int curPage=1;
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end=pager.getPageEnd();
			
			
			//System.out.println("list.do ȣ��");
			List<BoardDTO> list=dao.list(start, end);
			request.setAttribute("list", list);
			//������ �׺���̼� ����� ���� ��������
			request.setAttribute("page", pager);
			
			String page="/project/myboardlist.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("insert.do") != -1) {
			//���Ͼ��ε� ó��
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//���ε���丮�� �������� ������
				uploadDir.mkdir();//���丮�� ����
			}
			//request�� Ȯ���Ų MultipartRequest ����
			MultipartRequest multi=new MultipartRequest(request,
					Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", 
					new DefaultFileRenamePolicy());
			//request.getParameter��� multi.getParameter�� �ٲ����.
			//MultipartRequest�� ���� ���� request��ü�� Ȯ���
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();//Ŭ���̾�Ʈ�� ip�ּ�
			String filename=" ";//���� 1��
			int filesize=0;
			try {
				//÷�������� ����
				Enumeration files=multi.getFileNames();
				//���� ��Ұ� ������
				while(files.hasMoreElements()) {
					//÷�������� �̸�
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();//���� ������ ����
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			BoardDTO dto=new BoardDTO();
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			//���� ÷�θ� ���� ���� ���
			//trim() ���ڿ��� �¿� ���� ����
			if(filename == null || filename.trim().equals("")) {
				filename="-";
			}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			
			dao.insert(dto);
			String page="/board_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("download.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			String filename=dao.getFileName(num);
			System.out.println("÷������ �̸�:"+filename);
			
			//�ٿ�ε��� ���� ���
			String path=Constants.UPLOAD_PATH+filename;
			byte b[]=new byte[4096];//����Ʈ�迭 ����
			//������ ����� ������ �б� ���� ��Ʈ�� ����
			FileInputStream fis=new FileInputStream(path);
			//mimeType(������ ����-img, mp3, txt..��)
			String mimeType=getServletContext().getMimeType(path);
			if(mimeType==null) {
				mimeType="application/octet-stream;charset=utf-8";
			}
			//���� �̸��� �ѱ��� ���Ե� ��� header ���� ������ �Ǵµ�
			//header���� �ѱ��̳� Ư�����ڰ� �� �� ���� ������
			//8859_1(���������)�� utf-8�� ��ȯ�ؼ�
			//�ѱ�,Ư������ ó���� �ؾ���.
			filename = 
					new String(filename.getBytes("utf-8"),"8859_1");
			//http header
			response.setHeader("Content-Disposition", 
					"attachment;filename="+filename);
			//OutputStream ����(�������� Ŭ���̾�Ʈ�� ����)
			ServletOutputStream out=response.getOutputStream();
			int numRead;
			while(true) {
				numRead = fis.read(b,0,b.length);//������ ����
				if(numRead == -1) break; //�� �̻� ������ ������
				out.write(b,0,numRead);//������ ����
			}
			//���� ó�� ���� ���ҽ� ����
			out.flush();
			out.close();
			fis.close();
			//�ٿ�ε� Ƚ�� ���� ó��
			dao.plusDown(num);
		}else if(url.indexOf("view.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			//��ȸ�� ���� ó��
			dao.plusReadCount(num, session);
			BoardDTO dto=dao.viewReplace(num);
			
			//BoardDTO dto=dao.view(num);
			request.setAttribute("dto", dto);
			String page="/project/myboardview.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("commentList.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("����� ���� �Խù���ȣ:"+num);
			//��� ��� ����
			List<BoardCommentDTO> list=dao.commentList(num);
			request.setAttribute("list", list);
			//��� ������ �̵�
			String page="/project/myboardcomment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("comment_add.do") != -1) {
			BoardCommentDTO dto=new BoardCommentDTO();
			//�Խù� ��ȣ
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			String writer=request.getParameter("writer");
			String content=request.getParameter("content");
			dto.setBoard_num(board_num);
			dto.setWriter(writer);
			dto.setContent(content);
			dao.commentAdd(dto);
			//�̰��� ��׶���� ����Ǳ� ������ page�̵��� ���ʿ�
		}else if(url.indexOf("reply.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			BoardDTO dto=dao.view(num);
			dto.setContent("===�Խù��� ����===\n"+dto.getContent());
			request.setAttribute("dto", dto);
			String page="/project/myboardreply.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("insertReply.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			BoardDTO dto=dao.view(num);
			int ref=dto.getRef();//�亯 �׷� ��ȣ
			int re_step=dto.getRe_step()+1;//��¼���
			int re_level=dto.getRe_level()+1;//�亯 �ܰ�
			String writer=request.getParameter("writer");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String passwd=request.getParameter("passwd");
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setRef(ref);
			dto.setRe_level(re_level);
			dto.setRe_step(re_step);
			//÷������ ���� ����
			dto.setFilename("-");
			dto.setFilesize(0);
			dto.setDown(0);
			//��� ���� ����
			dao.updateStep(ref, re_step);
			//��� ����
			dao.reply(dto);
			//������� �̵�
			String page="/board_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("pass_check.do") != -1) {
			//�Խù� ��ȣ
			int num=Integer.parseInt(request.getParameter("num"));
			//��й�ȣ
			String passwd=request.getParameter("passwd");
			//��� check
			String result=dao.passwdCheck(num, passwd);
			String page="";
			if(result != null) {//��й�ȣ�� ������
				page="/project/myboardedit.jsp";
				request.setAttribute("dto", dao.view(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {//��й�ȣ�� Ʋ����
				page=contextPath+"/board_servlet/view.do?num="
			+num+"&message=error";
				response.sendRedirect(page);
			}//else
		}else if(url.indexOf("update.do") != -1) {
			//���Ͼ��ε� ó��
			//���丮�� ������ ����
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//���ε���丮�� �������� ������
				uploadDir.mkdir();//���丮�� ����
			}
			//request�� Ȯ���Ų MultipartRequest ����
			MultipartRequest multi=new MultipartRequest(request,
					Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", 
					new DefaultFileRenamePolicy());
			//request.getParameter��� multi.getParameter�� �ٲ����.
			//MultipartRequest�� ���� ���� request��ü�� Ȯ���
			int num=Integer.parseInt(multi.getParameter("num"));
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();//Ŭ���̾�Ʈ�� ip�ּ�
			String filename=" ";//���� 1��
			int filesize=0;
			try {
				//÷�������� ����
				Enumeration files=multi.getFileNames();
				//���� ��Ұ� ������
				while(files.hasMoreElements()) {
					//÷�������� �̸�
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();//���� ������ ����
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			BoardDTO dto=new BoardDTO();
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			//���� ÷�θ� ���� ���� ���
			//trim() ���ڿ��� �¿� ���� ����
			if(filename == null || filename.trim().equals("")) {
				//���ο� ÷�������� ���� ��(���̺��� ���������� ������)
				BoardDTO dto2=dao.view(num);
				String fName=dto2.getFilename();
				int fSize=dto2.getFilesize();
				int fDown=dto2.getDown();
				//�߰� ����(2020-01-23)
				dto.setFilename(fName);
				dto.setFilesize(fSize);
				dto.setDown(fDown);
			}else {
				//���ο� ÷�������� ���� ��
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			
			//÷������ ���� ó��
			String fileDel=multi.getParameter("fileDel");
			//üũ�ڿ� üũ�Ǿ�����, value���� ��� ������ on�� ����Ʈ�� ��
			if(fileDel != null && fileDel.equals("on")) {
				String fileName=dao.getFileName(num);
				File f=new File(Constants.UPLOAD_PATH+fileName);
				f.delete();//���� ����
				//÷������ ������ ����
				dto.setFilename("-");
				dto.setFilesize(0);
				dto.setDown(0);
			}
			//���ڵ� ����
			dao.update(dto);
			//������ �̵�
			String page="/board_servlet/list.do";
			response.sendRedirect(contextPath+page);
	
		}else if(url.indexOf("delete.do") != -1) {
			//���Ͼ��ε带 �Ⱦ����� MultipartRequest ó���� �ؾ��Ѵ�.
			MultipartRequest multi=new MultipartRequest(request,
					Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, 
					"utf-8", new DefaultFileRenamePolicy());
			//������ �Խù� ��ȣ
			int num=Integer.parseInt(multi.getParameter("num"));
			dao.delete(num);
			//������ �̵�
			String page="/board_servlet/list.do";
			response.sendRedirect(contextPath+page);
			
		}else if(url.indexOf("search.do") != -1) {
			//�˻��ɼǰ� �˻� Ű����
			String search_option=request.getParameter("search_option");
			String keyword=request.getParameter("keyword");
			
			List<BoardDTO> list=dao.searchList(search_option, keyword);
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			String page="/project/myboardsearch.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
