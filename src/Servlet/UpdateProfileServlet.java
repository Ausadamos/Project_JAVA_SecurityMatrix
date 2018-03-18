package Servlet;

import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.UpdateProfileBean;



import Dao.UpdateProfileDAO;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

	
		String name = request.getParameter("name");
	
		String getId_Company = request.getParameter("getId_Company");

	    
		
		 
		  
		  
		  
		  ArrayList<UpdateProfileBean> list = null;

			
		  UpdateProfileDAO  updateProfile = new  UpdateProfileDAO();
		  
		  
		 int name2 = updateProfile.SearchUserID(name , Integer.parseInt(getId_Company));
		
		 String name3 = String.valueOf(name2);
				
		// System.out.print("name2 : " +name2);
		 
		
            if(name2 != 0){
            	
        		list = updateProfile.ListAdd(name, Integer.parseInt(getId_Company));
           
        		
        		 
				RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDataSelect_2.jsp");
				request.setAttribute("list",list);
				request.setAttribute("IdUser",name3);
				request.setAttribute("nameUser",name);
				
				
				
				dispatcher.forward(request, response);
				
				
				
				
			}else{
	
		    	
				RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDataSelect.jsp");
			
			
				String status = "0";
				
				
				request.setAttribute("status",status);
				request.setAttribute("name_ERROR",name);
				
				dispatcher.forward(request, response);
			}

			
		
       
		
		
		
		
	}

}
