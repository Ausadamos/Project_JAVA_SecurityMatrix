package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.EditPersonalDAO;
import Dao.EditTranIDDAO;

/**
 * Servlet implementation class EditPersonalServlet
 */
@WebServlet("/EditPersonalServlet")
public class EditPersonalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPersonalServlet() {
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

	
		String 	IdProfile = request.getParameter("IdProfile");//IdTranID
		String getId_Company = request.getParameter("getId_Company");
		String 	EditUsername = request.getParameter("EditUsername");
		
		String 	NameUserLog = request.getParameter("NameUserLog");

		String 			OLD_USERNAME = request.getParameter("OLD_USERNAME");
		//System.out.print(IdProfile+ " " +getId_Company+ " " +EditUsername);
		 
		
		String getId_CompanyUserLogin = request.getParameter("getId_CompanyUserLogin");
		String getNamePersonal = request.getParameter("getNamePersonal");
		
		
		EditPersonalDAO  editPersonalDAO = new  EditPersonalDAO();
		
		 int result_1 = editPersonalDAO.EditUsername( Integer.parseInt(IdProfile),EditUsername,Integer.parseInt(getId_Company),NameUserLog,OLD_USERNAME,Integer.parseInt(getId_CompanyUserLogin),getNamePersonal);
	       
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
