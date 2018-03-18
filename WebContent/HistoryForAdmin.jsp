<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="js/jquery-1.12.4.js">					</script>
<%@page import="Dao.ListTypeHistoryDAO"%>
<%@page import="Bean.ListTypeHistoryBean"%>
<%@page import="java.util.ArrayList"%>
</head>
<body>



<link rel="stylesheet" type="text/css" href="css/w3.css">

<link rel="stylesheet" type="text/css" href="fonts/Mat_font.css">
<link rel="stylesheet" type="text/css" href="css/bulma.css">
<link rel="stylesheet" type="text/css" href="css/bulma.min.css">
<link rel="stylesheet" type="text/css"
	href="css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="fonts/fontawesome-webfont.woff2">
<link rel="stylesheet" href="dist/sweetalert.css">


<script src="js/jquery-1.12.4.js">					</script>
<script src="js/jquery.dataTables.min.js">			</script>
<script src="dist/sweetalert-dev.js">				</script>




<script language="javascript">









function updatedate() {
	
	
	
    var firstdate = document.getElementById("dateIn").value;
    
    //------------------------Today---------------------------
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!

    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd;
    } 
    if(mm<10){
        mm='0'+mm;
    } 
    var today = yyyy+'-'+mm+'-'+dd;
    //-------------------------------------------
    
    
    console.log(today);
    console.log(firstdate);
    

	var date1 = document.getElementById('dateIn').value;
	
	/*if(Date.parse(date1)){
		
		    document.getElementById("dateOut").value = "";
		    document.getElementById("dateOut").setAttribute("min",firstdate);
		    document.getElementById("dateOut").setAttribute("max",today);
		    
	}*/
   
    
  }
//------------------------------------



function dateF()
{
	
	//------------------------Today---------------------------
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!

	var yyyy = today.getFullYear();
	if(dd<10){
	    dd='0'+dd;
	} 
	if(mm<10){
	    mm='0'+mm;
	} 
	var today = yyyy+'-'+mm+'-'+dd;
	//-------------------------------------------



	document.getElementById("dateIn").value = "";
	document.getElementById("dateIn").setAttribute("max",today);
	
	
	
}


function dateL()
{
	

	//------------------------Today---------------------------
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!

	var yyyy = today.getFullYear();
	if(dd<10){
	    dd='0'+dd;
	} 
	if(mm<10){
	    mm='0'+mm;
	} 
	var today = yyyy+'-'+mm+'-'+dd;
	//-------------------------------------------

 var firstdate = document.getElementById("dateIn").value;

	document.getElementById("dateOut").value = "";
	document.getElementById("dateOut").setAttribute("max",today);
    document.getElementById("dateOut").setAttribute("min",firstdate);
    
	document.form1.dateOut.focus();
	
}




function fncSubmit()
{
	
	var date1 = document.getElementById('dateIn').value;
	var date2 = document.getElementById('dateOut').value;
	var Profile = document.getElementById('Profile').value;
	var Function = document.getElementById('Function').value;
	var UserLogin = document.getElementById('UserLogin').value;
	
	
	if((!Date.parse(date2)) && (!Date.parse(date1)) && (Profile == "") && (Function == 0) && (UserLogin == "")){
		 alert('เลือก สักอัน ==!');
		  return false;
	}

	 if(Date.parse(date2)){
		 
		if(!Date.parse(date1)){
			  alert('เลือก วันที่ 1 ก่อนสิ');
			  return false;
		}
	}
	 
	 
	 document.form1.dateIn.focus();
	 var firstValue = date1.split('-');
	 var secondValue = date2.split('-');

	
	 
	 
	 
	  var firstDate=new Date();
	  firstDate.setFullYear(firstValue[0],(firstValue[1] - 1 ),firstValue[2]);

	  var secondDate=new Date();
	  secondDate.setFullYear(secondValue[0],(secondValue[1] - 1 ),secondValue[2]);     

	   if (firstDate > secondDate)
	   {
		   alert('เลือกให้หลังวันนี้สิ');
			document.form1.dateOut.focus();
			  return false;
	   }
	
	 
	 
	 

	document.form1.submit();
}
</script>





  

  
<form name="form1" method="post" action="HistoryServlet" OnSubmit="return fncSubmit();">


<div class="tile is-parent">
    <article class="tile is-child box">
         <h5 class="title is-5">UserLogin</h5>
         
         <input type="text"  class="input is-info"
					name="UserLogin" id="UserLogin">
      
    </article>
  </div>
  
  

<div class="tile is-parent">
    <article class="tile is-child box">
         <h5 class="title is-5">Profile</h5>
         
         <input type="text"  class="input is-info"
					name="Profile" id="Profile">
      
    </article>
  </div>
  
  
 <div class="tile is-parent">
    <article class="tile is-child box">
         <h5 class="title is-5">ค้นหาจากวันที่</h5>
         
         <input type="date"  class="input is-info"
					name="dateIn" id="dateIn"  onclick="dateF()" >
      
    </article>
  </div>
  
  
  <div class="tile is-parent">
    <article class="tile is-child box">
        <h5 class="title is-5">ถึงวันที่</h5>
        <input
					type="date" name="dateOut" id="dateOut" onchange="updatedate();" onclick="dateL()" class="input is-info">  
					
    </article>
  </div>
  
  
  <br><br>
  <script>
(function($) {
    $(function() {
        $('.test').fSelect();
    });
})(jQuery);
</script>

 
  <script src="js/fSelect.js"></script>
  <link href="css/fSelect.css" rel="stylesheet">
     
       
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
 <div class="tile is-parent">
 
    <select name="Function" id="Function"class="test" multiple="multiple"  >
     
    <!--  <option value="0">Select Function</option>  -->  
    
    
								<%
								    ListTypeHistoryDAO SH8 = new ListTypeHistoryDAO();
	
									ArrayList<ListTypeHistoryBean> RB8 = new ArrayList<ListTypeHistoryBean>();
								%>


								<%
									int i2 = 0;
	
									RB8 = SH8.ListTypeHistory();
									for (int i = 0; i < RB8.size(); i++) {
								%>
    
    
    
  
    
          <option value="<%=RB8.get(i).getIdTypeHistory()%>"><%=RB8.get(i).getNameTypeHistory()%> </option>
    
    
    <%} %>
    
    

    </select>

  </div>
   <br><br>
<input type="submit" name="Submit" value="Save"><input type="reset"  value="Reset">


					
					
</form>

  
<form method="post" action="#" >
<input type="submit"  value="All Data">
</form>

</body>
</html>