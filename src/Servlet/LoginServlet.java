package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.UserLogBean;


import Dao.UserLogDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		UserLogDAO cus = new UserLogDAO();
	
		
		UserLogBean userLogBean;

		String user = request.getParameter("UserName");
		String pass = request.getParameter("Password");
		
	//	System.out.print(user+pass);
		
		userLogBean = cus.loginUsers(user,pass);

		if (userLogBean.isValid()) {
			
			if(userLogBean.getStatus() == 2){
				
				
				response.sendRedirect("LoginFirst.jsp"); // logged-in page
				
				
				
			}else if(userLogBean.getStatus() == 3 || userLogBean.getStatus() == 1){
				
                HttpSession session = request.getSession(true);			  
			    session.setAttribute("userLogBean",userLogBean);
				response.sendRedirect("AddProfile_1.jsp"); // logged-in page
				
			}
			    
				
				
		} else {
			
			

				RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
			
				
				String status = "0";
				request.setAttribute("status",status);
				
		
				dispatcher.forward(request, response);
				
				
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
