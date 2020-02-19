package config;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//���� : ��û�� �ռ� ó���Ǵ� �ڵ� ����
//�α�(log)�ڷḦ ����� ���ؼ� ���, ��ŷ, ��������, �ڷ�������� ��
//url pattern : /* ��� ��û
//���� : *.* /*.do

@WebFilter("/*")
public class EncodingFilter implements Filter {
	private String charset="utf-8";
	
    
	//���� ����(������ ���� ��)
	public void destroy() {
		System.out.println("���Ͱ� ���ŵǾ����ϴ�.");
	}

	//��û�� ���� �� ���İ��� �ڵ�
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("���Ͱ� ����Ǿ����ϴ�.");
		request.setCharacterEncoding(charset);
		chain.doFilter(request, response);
	}

	
	//���� �ʱ�ȭ(������ ������ �� �����)
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("���Ͱ� �ʱ�ȭ�Ǿ����ϴ�.");
	}

}
