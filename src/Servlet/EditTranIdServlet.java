package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AddTranIDDAO;
import Dao.EditTranIDDAO;

/**
 * Servlet implementation class EditTranIdServlet
 */
@WebServlet("/EditTranIdServlet")
public class EditTranIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTranIdServlet() {
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

	
		String PK_TranID = request.getParameter("PK_TranID");//IdTranID
		String CodeNew = request.getParameter("CodeNew");
		String 	selectModule = request.getParameter("selectModule");
		
		String 	NameUserLog = request.getParameter("NameUserLog");//WhoDo
		//-----------------------------------------------------------
		String 	id3[] = request.getParameterValues("id3[]");
		
		String getId_Company = request.getParameter("getId_Company");
		String getNamePersonal = request.getParameter("getNamePersonal");
		
		
		
		
       EditTranIDDAO  editTranIDDAO = new  EditTranIDDAO();
		
      int result_1 = editTranIDDAO.EditTranID( Integer.parseInt(PK_TranID),CodeNew,Integer.parseInt(selectModule),NameUserLog,Integer.parseInt(getId_Company),getNamePersonal);
       
       
   	if(result_1 == 0){
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("AddTranID.jsp");
		
		String status = "1";
		request.setAttribute("status3",status);
		request.setAttribute("listoo",id3);
		
		dispatcher.forward(request, response);
		
		

		
	}
   	
   	else{
	
		

	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("AddTranID.jsp");
		
		String status = "0";
		request.setAttribute("status3",status);
		request.setAttribute("listoo",id3);
		
		dispatcher.forward(request, response);
		
	}
       
       
       
		
		
		
		
		
		
		
		
	}

}
