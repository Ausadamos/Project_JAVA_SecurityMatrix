package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.ListHistoryBean;
import Bean.ListHistoryDateBean;
import Bean.ListTranIDBean;
import Dao.ListHistoryDao;
import Dao.ListTranIDDAO;

/**
 * Servlet implementation class HistoryServlet
 */
@WebServlet("/HistoryServlet")
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoryServlet() {
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
		
		String Profile = request.getParameter("Profile");
		String dateIn = request.getParameter("dateIn");
		String dateOut = request.getParameter("dateOut");
		String Userlogin = request.getParameter("Userlogin");

	String Function[] = request.getParameterValues("Function");

	
	String ID_COMPANY = request.getParameter("ID_COMPANY");
	//	String id2[] = request.getParameterValues("TranID[]");
		
		
		/*if(Function != null){
		Function = request.getParameterValues("Function");
			
		}*/
		
	//	System.out.print("Function"+ Function);
		
		
		
		
		 ArrayList<ListHistoryBean> list = null;  
		 ArrayList<ListHistoryDateBean> listDate = null;  
		
		 ListHistoryDao  listHistoryDao = new  ListHistoryDao(); 
		
		
		 if(Function != null){
			 int[] Function2 = new int[Function.length];

				for(int j = 0;j < Function.length;j++)
				{
				   
					Function2[j] = Integer.parseInt(Function[j]);
				}
			 
				 list = listHistoryDao.SearchHistory(Profile,dateIn,dateOut,Function2,Userlogin,Integer.parseInt(ID_COMPANY));
				 listDate = listHistoryDao.SearchHistoryForGetDate(Profile,dateIn,dateOut,Function2,Userlogin,Integer.parseInt(ID_COMPANY));

		 }else{
			 list = listHistoryDao.SearchHistory(Profile,dateIn,dateOut,null,Userlogin,Integer.parseInt(ID_COMPANY));
			 listDate = listHistoryDao.SearchHistoryForGetDate(Profile,dateIn,dateOut,null,Userlogin,Integer.parseInt(ID_COMPANY));

		 }
		
		 
		 
		 
		
	
			RequestDispatcher dispatcher = request.getRequestDispatcher("HistoryForAdminNewFile.jsp");
			request.setAttribute("list",list);
			request.setAttribute("listDate",listDate);
			dispatcher.forward(request, response);
			
		
		    
		 
		 
		 
		 
		 
		 
		 
		 
		
	}

}
