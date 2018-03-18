package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.EditPersonalDAO;

/**
 * Servlet implementation class EditPasswordPersonalServlet
 */
@WebServlet("/EditPasswordPersonalServlet")
public class EditPasswordPersonalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPasswordPersonalServlet() {
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

	
		String 	NewPassword = request.getParameter("NewPassword");//IdTranID
		String NewPasswordagain = request.getParameter("NewPasswordagain");
		String 	IdProfile = request.getParameter("IdProfile");
		
		String 	getUsername = request.getParameter("getUsername");
		String 		NameUserLog = request.getParameter("NameUserLog");
	
		String getId_CompanyUserLogin = request.getParameter("getId_CompanyUserLogin");
		String getNamePersonal = request.getParameter("getNamePersonal");
		
		EditPersonalDAO  editPersonalDAO = new  EditPersonalDAO();
		
		 int result_1 = editPersonalDAO.EditPassword(NewPassword,NewPasswordagain,Integer.parseInt(IdProfile),getUsername,NameUserLog,Integer.parseInt(getId_CompanyUserLogin),getNamePersonal);
	       
		if(result_1 != 0) {
			//สำเร็จ
			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S1.jsp");
			
			String status = "1";
			request.setAttribute("status_editPersonal",status);
		
			
			dispatcher.forward(request, response);
			
			
		}{
			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S1.jsp");
			
			String status = "0";
			request.setAttribute("status_editPersonal",status);
			
			
			dispatcher.forward(request, response);
			
			
			
			
		}
		
		
		
		
		
		
	}

}
