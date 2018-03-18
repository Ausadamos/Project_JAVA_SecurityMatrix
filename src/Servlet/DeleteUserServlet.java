package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DeleteTranIDDAO;
import Dao.DeleteUserDAO;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserServlet() {
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

		int num = 0;
	
		String id2[] = request.getParameterValues("TranID[]");
		String IDStatus = request.getParameter("IDStatus");
		
		String 	NameUserLog = request.getParameter("NameUserLog");
		
		String getId_CompanyUserLogin = request.getParameter("getId_CompanyUserLogin");
		String getNamePersonal = request.getParameter("getNamePersonal");
		
		if(id2 != null){
		

		

		int[] numbers = new int[id2.length];
		
		for(int j = 0;j < id2.length;j++)
		{
		   
		   numbers[j] = Integer.parseInt(id2[j]);
		}
	
		   DeleteUserDAO  deleteUserDAO = new  DeleteUserDAO();
		   num = deleteUserDAO.DeleteUserSelect(numbers,NameUserLog,Integer.parseInt(getId_CompanyUserLogin),getNamePersonal);
		
	 	}
	   
		if(num == 1)	 {
			
			
					if(Integer.parseInt(IDStatus) == 1){

						RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S1.jsp");
						String status = "1";
						request.setAttribute("status2",status);
						dispatcher.forward(request, response);
						
					}else if(Integer.parseInt(IDStatus) == 2){

						RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S2.jsp");
						String status = "1";
						request.setAttribute("status2",status);
						dispatcher.forward(request, response);
						
					}else if(Integer.parseInt(IDStatus) == 3){

						RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S3.jsp");
						String status = "1";
						request.setAttribute("status2",status);
						dispatcher.forward(request, response);
						
					}else if(Integer.parseInt(IDStatus) == 4){

						RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S4.jsp");
						String status = "1";
						request.setAttribute("status2",status);
						dispatcher.forward(request, response);
						
					}
					   	
					
					
					
					
					
					
					
					
				}else{

				
					if(Integer.parseInt(IDStatus) == 1){
						RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S1.jsp");
						String status = "0";
						request.setAttribute("status2",status);
						dispatcher.forward(request, response);
					}else if(Integer.parseInt(IDStatus) == 2){
						RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S2.jsp");
						String status = "0";
						request.setAttribute("status2",status);
						dispatcher.forward(request, response);
					}else if(Integer.parseInt(IDStatus) == 3){
						RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S3.jsp");
						String status = "0";
						request.setAttribute("status2",status);
						dispatcher.forward(request, response);
					}else if(Integer.parseInt(IDStatus) == 4){
						RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S4.jsp");
						String status = "0";
						request.setAttribute("status2",status);
						dispatcher.forward(request, response);
					}
					   	
					
					
					
					
					
					
					
					
				}
			
		
			 
		
	
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
