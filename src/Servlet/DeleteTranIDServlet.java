package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AddProfileDAO;
import Dao.DeleteProfileDAO;
import Dao.DeleteTranIDDAO;
import Dao.UpdateProfileDAO;

/**
 * Servlet implementation class DeleteTranIDServlet
 */
@WebServlet("/DeleteTranIDServlet")
public class DeleteTranIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTranIDServlet() {
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
		
		String 	id3[] = request.getParameterValues("id3[]");
	
		String 	NameUserLog = request.getParameter("NameUserLog");
		String getId_Company = request.getParameter("getId_Company");
		String getNamePersonal = request.getParameter("getNamePersonal");
		
		/*
		
		if(id3 == null){
			System.out.println("id3 «Ë“ßßßßß");
		}else{
			
			
			int[] numbers = new int[id3.length];

			for(int j = 0;j < id3.length;j++)
			{
			   
			   numbers[j] = Integer.parseInt(id3[j]);
			   System.out.println("numbers[j]"+numbers[j]);
			}

	
			
		}*/

		
		
		if(id2 != null){
		

		

		int[] numbers = new int[id2.length];
		
		for(int j = 0;j < id2.length;j++)
		{
		   
		   numbers[j] = Integer.parseInt(id2[j]);
		   
		   System.out.println("‰Õ¥’∑√“π = "+numbers[j]);
		}
		
		
		
		   
		   DeleteTranIDDAO  deleteTranIDDAO = new  DeleteTranIDDAO();
			  
			  
		 num = deleteTranIDDAO.DeleteTranIDSelect(numbers,NameUserLog,Integer.parseInt(getId_Company),getNamePersonal);
		    
		
		//-----------------------------
	       
	     //  addProfile.addbook(Integer.parseInt(numroom), Integer.parseInt(addProfile.getLastAddTranID()));
	       
	 	}
	       
		
		
		
		
		
	
	
		
		  
		//  int name3 = deleteProfileDAO.removeUserID_TranID(name8);
		
			 
		if(num == 1)	 {
			
			
				
					RequestDispatcher dispatcher = request.getRequestDispatcher("AddTranID.jsp");
					
					String status = "1";
					
					request.setAttribute("status2",status);
					
					request.setAttribute("listoo",id3);
					
					
					
					
					dispatcher.forward(request, response);
					
				}else{

					RequestDispatcher dispatcher = request.getRequestDispatcher("AddTranID.jsp");
					
					String status = "0";
					request.setAttribute("status2",status);
					
					request.setAttribute("listoo",id3);
					
					dispatcher.forward(request, response);
					
				}
			
		}
			 
		
	
		
		
		
		
		


}
