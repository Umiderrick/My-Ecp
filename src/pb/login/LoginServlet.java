package pb.login;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pb.db.TableValues;

public class LoginServlet implements javax.servlet.Servlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");// 取得用户名
		String password = request.getParameter("password");// 取得密码
		String checkcode = request.getParameter("checkCode");
		Userdealer userd = new Userdealer();
		HttpSession session = request.getSession();
		session.setAttribute("userName", username);
		if (userd.canlogin(username, password)) {// 根据登陆情况，跳转页面
			if (checkcode.equals("") || checkcode == null) {
				System.out.println("请输入验证码");
			} else {
				TableValues tv = userd.typejudge(username);
				Object o = tv.getValues()[0][0];
				String type = o.toString();
				if (type.equals("10-会员")) {
					if (!checkcode.equalsIgnoreCase((String) session.getAttribute("randCheckCode"))) {
						response.sendRedirect("../fail/fail.jsp");
						System.out.println("验证码不正确,请重新输入");
					} else {
						response.sendRedirect("../index.jsp");
						System.out.println("登录成功");
					}
				} else if (type.equals("20-管理员")) {
					if (!checkcode.equalsIgnoreCase((String) session.getAttribute("randCheckCode"))) {
						response.sendRedirect("../fail/fail.jsp");
						System.out.println("验证码不正确,请重新输入");
					} else {
						response.sendRedirect("../management.jsp");
						System.out.println("管理员登录成功");
					}
				} else {
					response.sendRedirect("../fail/fail.jsp");
					System.err.println("系统错误");
				}
				
			}
		} else {
			response.sendRedirect("../fail/fail.jsp");
			System.err.println("输入正确的用户名和密码");
		}

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		if (!username.isEmpty())
			request.getSession().removeAttribute("userName");
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