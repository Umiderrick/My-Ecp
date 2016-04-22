package pb.login;

import java.io.IOException;


import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RegServlet implements javax.servlet.Servlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String usertype = request.getParameter("usertype");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		Userdealer userd = new Userdealer();
		boolean insertSuccess = userd.insert(username, password,usertype,address,phone);
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
		
	}

	@Override
	public ServletConfig getServletConfig() {
		return null;
	}

	@Override
	public String getServletInfo() {
		return null;
	}

	@Override
	public void init(ServletConfig arg0) throws ServletException {
		
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
