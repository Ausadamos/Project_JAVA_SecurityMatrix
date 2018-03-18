package Servlet;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.UpdateProfileBean;
import Dao.UpdateProfileDAO;

/**
 * Servlet implementation class ToTextServlet
 */
@WebServlet("/ToTextServlet")
public class ToTextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToTextServlet() {
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
	
		
		
		  UpdateProfileDAO  updateProfile = new  UpdateProfileDAO();
		  
		  
			 
			 
			  ArrayList<UpdateProfileBean> list2 = null;
	      
		  
		  int list3 = 0;
		  
		    list2 = updateProfile.ListAddToText();	
  		
		    
		    list3 =  updateProfile.CountUserID_TranID();
		    
			//String score[][] = new String[list3][2];
		
		
			String[] num = new String[list3];
			String num2;
			
			
			
			
			
			
			
			
			
			
			
			
			  
	        // Assigning values
	        for (int i = 0; i < list3; i++) {
	        
	        	num[i] = list2.get(i).getName();
	             			
	        	
	        	
	     //   	String[] toppings = new String[20];
	        	
	        	
	        	int num3 = num[i].length();
	        	
	        	num[i] = list2.get(i).getName();
					
	        		int count = 20-num3;
	        	
	        		
	        		for(int i2 = 0; i2 < count;i2++){
	        			
	        			
	        			
	        			num[i] = 	num[i].concat(" ");
	        			
	        			
	        			
	        			
	        			
	        		}
	        		
	        	
				
	        	
	        	
	        	
	        	num2 = list2.get(i).getCode();
	             		
	        	//String num4 = list2.get(i).getName();
	        	
	        	
	        	//num[i] = 	num[i].concat(num4);
	            
	        	num[i] = 	num[i].concat(num2);
	            
	           
	        }
	        
	        
	        
	        
	        
	    
	        
	        int io = 0;
	 
	
	 	 try {
	         FileWriter writer = new FileWriter("C:\\Project2017\\ProjectNew2017\\WebContent\\VNO.PRD.CLK.USERROLE.TEST.DAT", false);
	         
	         
	         for (int i = 0; i < num.length; i++) {
	          
	                   writer.write(num[i]);
	             
	             //this is the code that you change, this will make a new line between each y value in the array
	             writer.write("\n");   // write new line
	         }
	         writer.close();
	         
	         io = 1;
	     } catch (IOException e) {
	    	  io = 0;
	         e.printStackTrace();
	     }

	if(io == 1){
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ToText.jsp");
		
		String status = "1";
		
		request.setAttribute("status",status);
		
		
		dispatcher.forward(request, response);
		
		
	}else{
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ToText.jsp");
		
		String status = "0";
		request.setAttribute("status",status);
		
		
		dispatcher.forward(request, response);
	}
	
	 	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
