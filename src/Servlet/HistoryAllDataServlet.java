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
import Dao.ListHistoryDao;

/**
 * Servlet implementation class HistoryAllDataServlet
 */
@WebServlet("/HistoryAllDataServlet")
public class HistoryAllDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoryAllDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		 ArrayList<ListHistoryBean> list = null;  
		
		 ListHistoryDao  listHistoryDao = new  ListHistoryDao(); 
			String ID_COMPANY = request.getParameter("ID_COMPANY");
		 list = listHistoryDao.SearchHistoryAllData(Integer.parseInt(ID_COMPANY));
		
		

			RequestDispatcher dispatcher = request.getRequestDispatcher("HistoryForAdminNewFile.jsp");
			request.setAttribute("list",list);
	
			dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
	}

}
