package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.ListTranIDBean;
import Dao.SearchFromEditDeleteTranIDDAO;

/**
 * Servlet implementation class SearchFromEditDeleteTranID_PageAddProfile
 */
@WebServlet("/SearchFromEditDeleteTranID_PageAddProfile")
public class SearchFromEditDeleteTranID_PageAddProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchFromEditDeleteTranID_PageAddProfile() {
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
	
		String id2[] = request.getParameterValues("TranID22[]");

		
		if(id2 != null){
		

		

		int[] numbers = new int[id2.length];
		
		for(int j = 0;j < id2.length;j++)
		{
		   
		   numbers[j] = Integer.parseInt(id2[j]);
		}
		
		
		
		   
		SearchFromEditDeleteTranIDDAO  searchFromEditDeleteTranID = new  SearchFromEditDeleteTranIDDAO();
			  
		 ArrayList<ListTranIDBean> list = null;  
		 
		 
		 list = searchFromEditDeleteTranID.ListTranIDFromSearch(numbers);
		    
		 
		
			RequestDispatcher dispatcher = request.getRequestDispatcher("AddProfile_2.jsp");
			
			
			request.setAttribute("list",list);
			request.setAttribute("listoo2",id2);
			
			dispatcher.forward(request, response);
			
	 	}else{
	 		
	 		//�ó���������� 

			RequestDispatcher dispatcher = request.getRequestDispatcher("AddProfile_1.jsp");

			
		
			String statusSearchTranID = "0";
			request.setAttribute("statusSearchTranID",statusSearchTranID);
			
			
			dispatcher.forward(request, response);
			
	 		
	 		
	 		
	 		
	 		
	 		
	 		
	 	}
	}

}
