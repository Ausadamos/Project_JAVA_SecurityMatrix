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
import Bean.UpdateProfileBean;
import Dao.AddTranID_ForProfile_DAO;
import Dao.ListTranIDDAO;
import Dao.SearchFromEditDeleteTranIDDAO;
import Dao.UpdateProfileDAO;

/**
 * Servlet implementation class SearchFromInquiry
 */
@WebServlet("/SearchFromInquiry")
public class SearchFromInquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchFromInquiry() {
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

	
		String IdUser = request.getParameter("IdUser");
		
		
		String nameUser = request.getParameter("nameUser");

        String Module[] = request.getParameterValues("TranID22[]");

		
		if(Module != null){
		

			int[] TranID2 = new int[Module.length];
			
			for(int j = 0;j < Module.length;j++)
			{
			   
				TranID2[j] = Integer.parseInt(Module[j]);
			}
			

			//SearchFromEditDeleteTranIDDAO  searchFromEditDeleteTranID = new  SearchFromEditDeleteTranIDDAO();
			
		    ListTranIDDAO  listTranIDDAO = new  ListTranIDDAO(); 
		    
			 ArrayList<ListTranIDBean> list = null;  
			 
			 
			 list = listTranIDDAO.ListTranIDInquiry(TranID2,Integer.parseInt(IdUser));
			 
				RequestDispatcher dispatcher = request.getRequestDispatcher("Inquiry_2.jsp");

			    request.setAttribute("list_Iquire",list);
			 
			    request.setAttribute("nameUser",nameUser);
				request.setAttribute("IdUser",IdUser);
				
				String status = "1";
				
				request.setAttribute("statusInquire",status);
				dispatcher.forward(request, response);
			 
		
		}else{
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Inquiry_2.jsp");
		
			
			request.setAttribute("nameUser",nameUser);
			request.setAttribute("IdUser",IdUser);
			
			String status = "0";
			
			request.setAttribute("statusInquire",status);
			dispatcher.forward(request, response);
			
		}
		
		
		
             
        
        
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
