package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AddPasswordForNewUserDAO;
import Dao.AddTranIDDAO;

/**
 * Servlet implementation class AddPasswordForNewUser
 */
@WebServlet("/AddPasswordForNewUser")
public class AddPasswordForNewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPasswordForNewUser() {
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

		String Key = request.getParameter("Key");
		
		String name = request.getParameter("UserName");      
		String Copy = request.getParameter("OldPassword");
		String Password = request.getParameter("NewPassword");
		String NewPassword = request.getParameter("ConfirmNewPassword");
		
		System.out.println(Copy+"  "+Password+"  "+NewPassword);
		
		if(Key.equals("0")){
			
	
		if(Password.equals(NewPassword)){
			
	System.out.print(" รหัสผ่าน ตรง");
		
		AddPasswordForNewUserDAO  addPasswordForNewUserDAO = new  AddPasswordForNewUserDAO();

        int i2 = addPasswordForNewUserDAO.AddPasswordUser(name,Copy,Password,NewPassword);
        

   	if(i2 != 0){
	
		

RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
		
		String status = "3";
		request.setAttribute("status",status);
		
		
		dispatcher.forward(request, response);
		
	//	response.sendRedirect("index5.jsp");
		
	}
   	
   	else{

		
RequestDispatcher dispatcher = request.getRequestDispatcher("LoginFirst.jsp");
		
		String status = "4";
		request.setAttribute("status",status);
		
		request.setAttribute("name_ERROR",name);
		dispatcher.forward(request, response);
		
	}
       
   	
   	
   	
   	
		}else{
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("LoginFirst.jsp");
					
					String status = "4";
					request.setAttribute("status",status);
					
					request.setAttribute("name_ERROR",name);
					dispatcher.forward(request, response);
		}
       
		
		
		
		
		}else{
			

			if(Password.equals(NewPassword)){
				
		System.out.print(" รหัสผ่าน ตรง");
			
			AddPasswordForNewUserDAO  addPasswordForNewUserDAO = new  AddPasswordForNewUserDAO();

	        int i2 = addPasswordForNewUserDAO.AddPasswordAdmin(name,Copy,Password,NewPassword);
	        

	   	if(i2 != 0){
		
			

	RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
			
			String status = "88";
			request.setAttribute("status",status);
			
			
			dispatcher.forward(request, response);
			
		//	response.sendRedirect("index5.jsp");
			
		}
	   	
	   	else{

			
	RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
			
			String status = "99";
			request.setAttribute("status",status);
			
			request.setAttribute("name_ERROR",name);
			dispatcher.forward(request, response);
			
		}
	       
	   	
	   	
	   	
	   	
			}else{
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
						
						String status = "99";
						request.setAttribute("status",status);
						
						request.setAttribute("name_ERROR",name);
						dispatcher.forward(request, response);
			}
	       
			
			
			
			
			
			
			
			
		}
		
		
		
		
		
		
		
		
		
		
	}

}
