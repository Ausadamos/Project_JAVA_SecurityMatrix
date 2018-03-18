package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AddProfileDAO;
import Dao.DeleteProfileDAO;
import Dao.UpdateProfileDAO;

/**
 * Servlet implementation class DeleteProfileServlet
 */
@WebServlet("/DeleteProfileServlet")
public class DeleteProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProfileServlet() {
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

	
		String name = request.getParameter("name");
	
		
		
		
		String 	NameUserLog = request.getParameter("NameUserLog");
		String getId_Company = request.getParameter("getId_Company");
		
		
		String getId_CompanyUserLogin = request.getParameter("getId_CompanyUserLogin");
		String getNamePersonal = request.getParameter("getNamePersonal");
		
		
		//System.out.print(NameUserLog);
	       AddProfileDAO addProfile = new AddProfileDAO();
	       
		//int name2  = Integer.parseInt(name);
		
		  DeleteProfileDAO  deleteProfileDAO = new  DeleteProfileDAO();
		  UpdateProfileDAO  updateProfile = new  UpdateProfileDAO();
		  //-------------เอา ไอดี จาก เนม---------------------
			 int name8 = updateProfile.SearchUserID(name, Integer.parseInt(getId_Company));
				
			 //String name9 = String.valueOf(name8);
		//--------------------------------------------------			
			 
		// int checkDelete = addProfile.DeleteForUpdateSelectTranUser(name8);
		  
		  
			 
			 int name55 = deleteProfileDAO.CheckUser(name, Integer.parseInt(getId_Company)); 
			 
		if(name55 == 1)	 {
			 int name3 = deleteProfileDAO.removeUserID_TranID(name8);
			 int name4 = deleteProfileDAO.removeUserID(name8,NameUserLog,name,Integer.parseInt(getId_CompanyUserLogin),getNamePersonal);
				if(name3 == 1 && name4 == 1){
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("DeleteProfile.jsp");
			
					String status = "1";
					request.setAttribute("status",status);
					
					
					dispatcher.forward(request, response);
					
					
				}else{

					RequestDispatcher dispatcher = request.getRequestDispatcher("DeleteProfile.jsp");
					
					String status = "0";
					request.setAttribute("status",status);
					
					request.setAttribute("name_ERROR",name);
					dispatcher.forward(request, response);
					
				}
			
		}
			 
		
		
	else{

		RequestDispatcher dispatcher = request.getRequestDispatcher("DeleteProfile.jsp");
		
		String status = "00";
		request.setAttribute("status",status);
		
		request.setAttribute("name_ERROR",name);
		dispatcher.forward(request, response);
			
		}
		
		
		
		
		
		
	}

}
