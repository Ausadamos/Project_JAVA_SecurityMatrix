package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.EditTranIDDAO;
import Dao.EditUserDAO;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
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

	
		String IdProfile = request.getParameter("IdProfile");
		String LevelUser = request.getParameter("LevelUser");
		String IDStatus = request.getParameter("IDStatus");
		
		
		
		//System.out.print(LevelUser+"++++"+IdProfile);
		
		
       EditUserDAO  editUserDAO = new  EditUserDAO();
		
      int result_1 = editUserDAO.EditUser( Integer.parseInt(IdProfile), Integer.parseInt(LevelUser));
       
       
    
   	if(result_1 != 0){
	
	
		
		
		if(Integer.parseInt(IDStatus) == 1){
			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S1.jsp");
			String status = "1";
			request.setAttribute("status3",status);
			dispatcher.forward(request, response);
		}else if(Integer.parseInt(IDStatus) == 2){
			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S2.jsp");
			String status = "1";
			request.setAttribute("status3",status);
			dispatcher.forward(request, response);
		}else if(Integer.parseInt(IDStatus) == 3){
			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S3.jsp");
			String status = "1";
			request.setAttribute("status3",status);
			dispatcher.forward(request, response);
		}else if(Integer.parseInt(IDStatus) == 4){
			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S4.jsp");
			String status = "1";
			request.setAttribute("status3",status);
			dispatcher.forward(request, response);
		}
		   	

		
	}
   	
   	else{
	
		

	
	
		if(Integer.parseInt(IDStatus) == 1){
			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S1.jsp");
			String status = "0";
			request.setAttribute("status3",status);
			dispatcher.forward(request, response);
		}else if(Integer.parseInt(IDStatus) == 2){
			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S2.jsp");
			String status = "0";
			request.setAttribute("status3",status);
			dispatcher.forward(request, response);
		}else if(Integer.parseInt(IDStatus) == 3){
			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S3.jsp");
			String status = "0";
			request.setAttribute("status3",status);
			dispatcher.forward(request, response);
		}else if(Integer.parseInt(IDStatus) == 4){
			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S4.jsp");
			String status = "0";
			request.setAttribute("status3",status);
			dispatcher.forward(request, response);
		}
		   	
	}
       
       
       
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
