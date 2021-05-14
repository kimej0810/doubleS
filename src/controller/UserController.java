package controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserDAO;
import service.UserVO;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String uri = request.getRequestURI();//������Ʈ�� ���� �ּҸ� ��ü ��Ÿ����.
		System.out.println("���� uri >"+uri);//�ش� uri�� �˱� ���ؼ� Console�� ���
		int uriLength = request.getContextPath().length();//uri�ȿ� ������Ʈ���� �����ϱ� ���ؼ� �ش� ���̸�ŭ�� int�� ����
		String url = uri.substring(uriLength);//uri���� �ش� ������Ʈ�� ���̸�ŭ�� substring�� ���� ���� url�� ����
		System.out.println("���� url >"+url);//�ش� url �˱� ���� ���
		if(url.equals("/main.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/main.jsp");
			rd.forward(request, response);
		}else if(url.equals("/home.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/index.jsp");
			rd.forward(request, response);
		}else if(url.equals("/login.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/login.jsp");
			rd.forward(request, response);
		}else if(url.equals("/userJoin.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/userJoin.jsp");
			rd.forward(request, response);
		}else if(url.equals("/userJoinAction.do")){
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			String userName = request.getParameter("userName");
			String birthyear = request.getParameter("birthyear");
			String userEmail = request.getParameter("userEmail");
			String userPhone = request.getParameter("userPhone");
			UserDAO ud = new UserDAO();
			int joinUd = ud.userJoin(userId, userPwd, userName, birthyear, userEmail, userPhone);
			if(joinUd>0){
				response.sendRedirect(request.getContextPath()+"/home.do");
				System.out.println("���Ե�.");
			}else{
				response.sendRedirect(request.getContextPath()+"/main.do");
				System.out.println("���Խ���.");
			}
		}else if(url.equals("/loginCheck.do")){
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			UserDAO ud = new UserDAO();
			String result = ud.loginCheck(userId, userPwd);
			String[] results = result.split("/");
			int result1 = Integer.parseInt(results[0]);
			int result2 = Integer.parseInt(results[1]);
			if(result2>0){
				HttpSession session = request.getSession();
				session.setAttribute("user",userId);
				response.sendRedirect(request.getContextPath()+"/home.do");
				System.out.println("user"+userId+"���� �α��� �Ͽ����ϴ�.");
			}else{
				response.sendRedirect(request.getContextPath()+"/login.do");
				System.out.println("�α����� ���� �Ͽ����ϴ�.");
			}
		}else if(url.equals("/logoutAction.do")){
			HttpSession session = request.getSession();
			session.invalidate();
			PrintWriter out = response.getWriter();
			out.println("<script>alert('�α׾ƿ� �Ǿ����ϴ�.');document.location.href='"+request.getContextPath()+"/home.do';</script>");
			System.out.println("�α׾ƿ�");
		}
		//ȸ������ �� �������� �ε��� �޼ҵ�
		else if(url.equals("/info.do")){
			UserDAO ud = new UserDAO();
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("user");
			System.out.println("userId��??"+userId);
			//UserVO uv = ud.getUserVO(userId);
			//request.setAttribute("uv", uv);
			//0513����
			
			UserVO uv = (UserVO)request.getAttribute("uv");
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/info.jsp");
			rd.forward(request, response);
		}
		//ȸ������ ����
		else if(url.equals("/infoAction.do")) {
			UserDAO ud = new UserDAO();
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("user");
			String userPwd = request.getParameter("userPwd");
			int result = ud.userUpdate(userPwd, userId);
			if(result>0) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('��й�ȣ�� ����Ǿ����ϴ�.');document.location.href='"+request.getContextPath()+"/home.do';</script>");
			}else {
				response.sendRedirect(request.getContextPath()+"/info.do");
			}
		}
		//��й�ȣ�� ����Ȯ�� �ϱ�
		else if(url.equals("/who.do")) {
			UserDAO ud = new UserDAO();
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("user");
			UserVO uv = ud.getUserVO(userId);
			request.setAttribute("uv", uv);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pwdCheck.jsp");
			rd.forward(request, response);
		}
		else if(url.equals("/whoAction.do")) {
			UserDAO ud = new UserDAO();
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("user");
			System.out.println("userId��??"+userId);
			UserVO uv = ud.getUserVO(userId);
			String userPwdCh = request.getParameter("userPwd");
			if(uv.getUserPwd()==userPwdCh) {
				request.setAttribute("uv", uv);
				System.out.println("����Ϸ�");
				response.sendRedirect(request.getContextPath()+"/home.do");
			}else {
				System.out.println("�������");
				response.sendRedirect(request.getContextPath()+"/who.do");
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
