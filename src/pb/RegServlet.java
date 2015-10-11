package pb;

import java.io.IOException;
import pb.Userdealer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RegServlet implements javax.servlet.Servlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");// 取得用户名
		String password = request.getParameter("password");// 取得密码
		String usertype = request.getParameter("usertype");
		System.out.println("username:" + username);
		System.out.println("password:" + password);
		Userdealer userd = new Userdealer();
		boolean insertSuccess = userd.insert(username, password,usertype);
		if (insertSuccess) {
				response.sendRedirect("regist_ok.html");
			} else {
				response.sendRedirect("regerr.jsp");
			}
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void init(ServletConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		HttpServletRequest rq = (HttpServletRequest) request;
		HttpServletResponse rs = (HttpServletResponse) response;
		String method = rq.getMethod();
		if ("post".equalsIgnoreCase(method)) {
			doPost(rq, rs);
		} else if ("get".equalsIgnoreCase(method)) {
			doGet(rq, rs);
		}
		
	}
	}
