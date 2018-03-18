<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Bean.ListHistoryBean"%>
<%@page import="Bean.ListHistoryDateBean"%>
<%@page import="java.util.ArrayList"%>    
<%@page import="Bean.AddProfileBean"%>    
<%@page import="Bean.ListTranIDBean"%>    
<%@page import="Dao.ListTranIDDAO2"%>
<%@page import="Dao.ListTranIDDAO"%>
<%@page import="Dao.ListModuleDAO"%>
<%@page import="Dao.ListTranIDforDeletebacktopageDAO"%>
<%@page import="Bean.ListModuleBean"%>
<%@page import="Bean.AddProfileBean"%>
<%@page import="Bean.ListTranIDBean"%>
<%@page import="Dao.ListTypeHistoryDAO"%>
<%@page import="Bean.ListTypeHistoryBean"%>
<%@page import="Bean.UserLogBean"%>    
 
 <%@page import="Bean.ListPersonnelBean"%>
<%@page import="Dao.ListPersonnelDAO"%>   
  <%@page import="Dao.ListUsersDAO"%>
   <%@page import="Bean.ListusersBean"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
			UserLogBean A = null;

			try {
				A = (UserLogBean) session.getAttribute("userLogBean");
			} catch (Exception e) {
				A = null;
			}
		%>

<script src="js/jquery-1.12.4.js">					</script>

  <script >
(function($) {
    $(function() {
        $('.test').fSelect();
    });
})(jQuery);
</script>
 

 <link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">

     	

  


<link rel="stylesheet" type="text/css" href="css/bulma.css">
<link rel="stylesheet" type="text/css" href="css/bulma.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">

<link rel="stylesheet" href="dist/sweetalert.css">
 <link href="css/fSelect.css" rel="stylesheet" type="text/css">




<script src="js/jquery.dataTables.min.js">			</script>
<script src="dist/sweetalert-dev.js">				</script>
<script src="js/fSelect.js"></script>
   
<style type="text/css">
.hero-body {
	-webkit-box-flex: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	padding: 1.25rem 1.5rem;
	padding-top: 0.35rem;
	padding-right: 1.5rem;
	padding-bottom: 0.35rem;
	padding-left: 1.5rem;
}.hero.is-primary.is-bold {
  background-image: -webkit-linear-gradient(309deg, #009e6c 0%, #00d1b2 71%, #00e7eb 100%);
  background-image: linear-gradient(141deg, #57a6de 0%, #58a7df   71%, #5baadf   100%);
}
html {
   margin: 0px;
   height: 100%;
   width: 100%;
}

body {
  background-color: #F8F9F9  ;
   margin: 0px;
   min-height: 100%;
   width: 100%;
}.menu-list a.is-active {
  background-color: #AED6F1;
  color: #000;

}.fs-wrap {
    display: inline-block;
    cursor: pointer;
    line-height: 1.40;
    width: 252px;
}
  
</style>
  

  <script type="text/javascript">

function nospaces(t){

if(t.value.match(/\s/g)){

alert('Sorry, you are not allowed to enter any spaces');

t.value=t.value.replace(/\s/g,'');

}

}

</script>
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
	var Personnel = document.getElementById('Personnel').value;
	
	
	if((!Date.parse(date2)) && (!Date.parse(date1)) && (Profile == "") && (Function == 0) && (Personnel == "")){
		 alert('กรุณาเลือกเงื่อนไขอย่างน้อย 1 เงื่อนไข');
		  return false;
	}

	 if(Date.parse(date2)){
		 
		if(!Date.parse(date1)){
			  alert('กรุณาเลือก Start date ก่อน');
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
		   alert('กรุณาเลือก Finish date หลังวัน Start date');
			document.form1.dateOut.focus();
			  return false;
	   }
	
	 
	 
	 

	document.form1.submit();
}
</script> 
 
<script>

$(document).ready(function(){
	document.querySelector('#AddPasswordForNewUser').addEventListener('submit', function(e) {
	  	   
     	
 	   var OldPassword = $("#OldPassword").val();
        var NewPassword = $("#NewPassword").val();
        var ConfirmNewPassword = $("#ConfirmNewPassword").val();
        
        if (NewPassword != ConfirmNewPassword) {
           // alert("Passwords do not match.");
           
           swal(
					 '',
					 'Passwords do not match.!',
					 'error'
				  )

            e.preventDefault();
        
        }else{
       	
 	   
      	//   console.log("เข้า#form_EditTranIdServlet")
             var form = this;
             e.preventDefault();
             swal({
                 title: "Confirm to EDIT PASSWORD ?",
                 text: "",
                 type: "warning",
                 showCancelButton: true,
                 confirmButtonColor: '#d33',
                 confirmButtonText: 'Confirm',
                 cancelButtonText: "Cancel",
                 closeOnConfirm: false,
                 closeOnCancel: false
             },
             function(isConfirm) {
                 if (isConfirm) {
                     swal({
                         title: 'Deleting action ..',
                  
                         type: 'success'
                     }, function() {
                         form.submit();
                     });

                 } else {
                     swal("Cancelled");
                 }
             });
        }
        
   
         });

       document.querySelector('#from2').addEventListener('click', function(e) {
           var form = this;
           e.preventDefault();
           swal({
               title: "Confirm to Logout ?",
 
               type: "warning",
               showCancelButton: true,
               confirmButtonColor: '#DD6B55',
               confirmButtonText: 'ตกลง',
               cancelButtonText: "ยกเลิก",
               closeOnConfirm: false,
               closeOnCancel: false
           },
           function(isConfirm) {
               if (isConfirm) {
                   swal({
                       title: 'Logout Success',
                
                       type: 'success'
                   }, function() {
                       form.submit();
                   });

               } else {
                   swal("ยกเลิก");
               }
           });
       });
});
   </script>


</head>
<body  >
  
	

<form action="AddPasswordForNewUser" method="post" id="AddPasswordForNewUser" >
	<input type="hidden" name="UserName" value="<%=A.getUsername()%>">
	<input type="hidden" name="Key" value="1">

	<div id="myBtnEdit_Password"  class="modal">
	
	<br><br><br>
  <div class="modal-background"></div>
  <div class="modal-content">
    <header class="modal-card-head">
      <p class="modal-card-title"> <i class="far fa-edit"></i>EDIT PASSWORD
      
     
      </p>
     
      <span
						onclick="document.getElementById('myBtnEdit_Password').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>
      			
    </header>
    <section class="modal-card-body">
    
    
        <div class="field">
  <label class="label">	Current Password</label>
  <div class="control has-icons-left has-icons-right">
   <input onkeyup="nospaces(this)" class="input" type="password" name="OldPassword" id="OldPassword" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="ต้องประกอบด้วยตัวเลขอย่างน้อยหนึ่งตัวอักษรและตัวพิมพ์ใหญ่และตัวพิมพ์เล็กและตัวอักษรอย่างน้อย 8 ตัวขึ้นไป"  placeholder="Enter Current Password"/>
  
    <span class="icon is-small is-left">
      <i class="fas fa-key"></i>
    </span>
    
  </div>
 
 
</div>
   
        <div class="field">
  <label class="label">New Password</label>
  <div class="control has-icons-left has-icons-right">
   <input onkeyup="nospaces(this)" class="input" type="password" name="NewPassword" id="NewPassword" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="ต้องประกอบด้วยตัวเลขอย่างน้อยหนึ่งตัวอักษรและตัวพิมพ์ใหญ่และตัวพิมพ์เล็กและตัวอักษรอย่างน้อย 8 ตัวขึ้นไป"  placeholder="Enter New Password"/>
  
    <span class="icon is-small is-left">
      <i class="fas fa-key"></i>
    </span>
    
  </div>
 
 
</div>
  
    <div class="field">
  <label class="label">New Password again</label>
  <div class="control has-icons-left has-icons-right">
   
      <input onkeyup="nospaces(this)" class="input" type="password" name="ConfirmNewPassword" id="ConfirmNewPassword" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="ต้องประกอบด้วยตัวเลขอย่างน้อยหนึ่งตัวอักษรและตัวพิมพ์ใหญ่และตัวพิมพ์เล็กและตัวอักษรอย่างน้อย 8 ตัวขึ้นไป"  placeholder="Enter New Password again"/>
      
  
    <span class="icon is-small is-left">
<i class="fas fa-key"></i>
    </span>
    
  </div>
 
</div>
  
  
  
  
    </section>
    <footer class="modal-card-foot">
     
      
  <button type="submit" class="button is-success">
    <span class="icon is-small">
      <i class="fas fa-check"></i>
    </span>
    <span>Save changes</span>
  </button>
      
      <button class="button" type="reset">Reset</button>
    </footer>
  </div>
</div>
	

	


	</form>





<%
if(session.getAttribute("userLogBean")==null) {
%>
<jsp:include page="Login.jsp"></jsp:include>
<%
} else {
%>

<%String status = (String)request.getAttribute("statusSearchTranID"); %>
	
<%if(request.getAttribute("statusSearchTranID") != null){
	%>
	

<%if(Integer.parseInt(status) == 0){
	
	%>
	
	
		<script type="text/javascript">
		$(document).ready(function () {
			
		
		
		swal(
				  '',
				  'please select Module !',
				  'error'
				)
	
	});
		</script>
	<%} %>	
	        <%} %>




<%String statusAddPro = (String)request.getAttribute("statusAddPro"); %>
	
<%if(request.getAttribute("statusAddPro") != null){
	%>
	

<%if(Integer.parseInt(statusAddPro) == 1){
	
	%>
	
	
		<script type="text/javascript">
		$(document).ready(function () {
			
		
		
		swal(
				  '',
				  'successful',
				  'success'
				)
	
	});
		</script>
	<%} %>	
	        <%} %>




<style>
.navbar {
	  background-color: #58a7df;
min-height: 3.25rem;
position: relative;
}.navbar-link::after {
    border: 1px solid #111;
    border-right: 0;
    border-top: 0;
    content: " ";
    display: block;
    height: 0.5em;
    pointer-events: none;
    position: absolute;
    -webkit-transform: rotate(-45deg);
    transform: rotate(-45deg);
    width: 0.5em;
    margin-top: -0.375em;
    right: 1.125em;
    top: 50%;
  }

</style>





<nav class="navbar is-transparent">
  <div class="navbar-brand">
    <a class="navbar-item">
      <img src="img/55.jpeg" width="35px">  &nbsp;
  <img src="img/ntt2.png" width="130px"> 
    </a>
    <div class="navbar-burger burger" data-target="navbarExampleTransparentExample">
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div>

  <div id="navbarExampleTransparentExample" class="navbar-menu">
    <div class="navbar-start">
  
 
 
 
 
    </div>

    <div class="navbar-end">
      <div class="navbar-item">
        <div class="field is-grouped">
        
        
        
               <div class="navbar-item has-dropdown is-hoverable is-right" >
        <a class="navbar-link" >
    <font color="#FFFFF"> <b> <%=A.getUsername()%> </b> </font>
        </a>
        <div class="navbar-dropdown is-boxed is-right">
          <a class="navbar-item" onclick="document.getElementById('myBtnEdit_Password').style.display='block'">
          Edit Password
          </a>
          
          
          
      
          
          
          
          
          
       <form class="navbar-item is-active" action="UserLogoutServlet" method="post" id="from2">   
           Logout
          </form>
        </div>
      </div>
      
      
      
      
      
        </div>
      </div>
    </div>
  </div>
</nav>



<br>
<div class="container ">
   <div class="tile is-ancestor">
  <div class="tile is-2 is-vertical is-parent">
    <div class="tile is-child box">
    

<aside class="menu">
  
  <ul class="menu-list">
    
    <li>
      <a class="is-active">MENU</a>
      <ul>
      
       <%if (A.getStatus() == 1){%>
      <li><a class="active" href="AddTranID.jsp"><i class="fa fa-key" aria-hidden="true"></i> TranID</a></li>
      
        

  <li><a  href="USER_S1.jsp"><i class="fa fa-user" aria-hidden="true"></i> User</a></li>


        <%} %>
          
        <li><a class="active" href="AddProfile_1.jsp">  <i class="fa fa-plus-square" aria-hidden="true"></i> Profile</a></li>
        <li><a href="ShowDataSelect.jsp"><i class="fa fa-pencil" aria-hidden="true"></i> Update</a></li>
        <li><a href="DeleteProfile.jsp"><i class="fa fa-trash" aria-hidden="true"></i> Delete</a></li>
        <li><a href="Inquiry.jsp"><i class="fa fa-users" aria-hidden="true"></i> Inquiry</a></li>
          
                <li><a class="active" href="HistoryForAdminNewFile.jsp">  <i class="fa fa-history" aria-hidden="true"></i> History</a></li>
     
         <li><a href="ToText.jsp"><i class="fa fa-file-text" aria-hidden="true"></i> To File</a></li>
      </ul>
    </li>
    
  </ul>
  
</aside>




    </div>
  
  </div>
  <div class="tile is-parent">
    <div class="tile is-child box">
      <i class="fas fa-history fa-2x fa-pull-left fa-border"></i><p class="title">HISTORY</p>
      <hr>
      
   
  <div class="field">

  <p class="control">
  
  <%   int i2 = 0; %>
    
 


  

    
     <form action="HistoryServlet" method="post" name="form1" OnSubmit="return fncSubmit();">
        
        <input type="hidden" name="ID_COMPANY" value="<%=A.getId_Company()%>">
        
        
        <nav class="level">

  <div class="level-left">
      
    <h2 class="subtitle is-5">ค้นหาประวัติตามเงื่อนไข</h2>
    
		</div>
		
		
		 
        
        </nav>
        
        <div class="columns">

    
  <div class="column">
       <div class="box">
          
 
 
  <div class="field">
  
  <div class="control has-icons-left has-icons-right">
   
      <label class="label">Userlogin</label>
<div class="control has-icons-left ">
 <input onkeyup="nospaces(this)" list="browsers" maxlength="20"  name="Userlogin" id="Personnel" class="input"  placeholder="select Userlogin">
   <span class="icon is-small is-left">
<i class="far fa-id-card"></i>
    </span>
  <datalist id="browsers">
  
								<%
								ListPersonnelDAO SH123 = new ListPersonnelDAO();
	
									ArrayList<ListPersonnelBean> RB123 = new ArrayList<ListPersonnelBean>();
								%>


								<%
									
	
									RB123 = SH123.ListPersonnelprivate(A.getId_Company());
									for (int i = 0; i < RB123.size(); i++) {
								%>
    
    
    
  
    
          <option value="<%=RB123.get(i).getUsername()%>"> <%=RB123.get(i).getFname()%> <%=RB123.get(i).getLname()%> [<%=RB123.get(i).getNameCompany()%>]</option>
    
    
    <%} %>
    
    

    
    
  </datalist>
  
  </div>
    
    
  </div>
 
</div>


     
   
  </div>
  </div>

  

  
  
  
  
  
  
  
  
  
  
  <div class="column">
      <div class="box">
          
   

    
  
     <div class="field">
  <label class="label">Profile</label>
  
  <div class="control has-icons-left has-icons-right">
 
 
    
     <input onkeyup="nospaces(this)" class="input" list="browsers33" name="Profile" id="Profile"    type="text" placeholder="select profile" pattern="[A-Z 0-9 -]{5,20}" title="กรุณาใส่อักษรตัวใหญ่ภาษาอังกฤษหรือตัวเลขอย่างน้อย  5 ตัว">
<datalist id="browsers33">
  
  
  
  
								<%
								ListUsersDAO SH1288 = new ListUsersDAO();
	
									ArrayList<ListusersBean> RB1288 = new ArrayList<ListusersBean>();
								%>


								<%
									i2 = 0;
	
									RB1288 = SH1288.ListUsers2(A.getId_Company());
									for (int i = 0; i < RB1288.size(); i++) {
								%>
    
    
    
  
    
          <option value="<%=RB1288.get(i).getName()%>"> </option>
    
    
    
    <%} %>
    
    

    
    
  </datalist>
  
  <span class="icon is-small is-left">
  <i class="far fa-user"></i>
    </span>
</div>
</div>

  </div>
  </div>
 
 
  <div class="column">
       <div class="box">
          
 
 
  <div class="field">
  <label class="label">Function</label>
  <div class="control has-icons-left has-icons-right">
   
       <select name="Function" id="Function" class="test" multiple="multiple"  >
     
    <!--  <option value="0">Select Function</option>  -->  
    
    
								<%
								    ListTypeHistoryDAO SH8 = new ListTypeHistoryDAO();
	
									ArrayList<ListTypeHistoryBean> RB8 = new ArrayList<ListTypeHistoryBean>();
								%>


								<%
									 i2 = 0;
	
									RB8 = SH8.ListTypeHistory();
									for (int i = 0; i < RB8.size(); i++) {
								%>
    
    
    
  
    
          <option value="<%=RB8.get(i).getIdTypeHistory()%>"><%=RB8.get(i).getNameTypeHistory()%> </option>
    
    
    <%} %>
    
    

    </select> 
  
    
    
  </div>
 
</div>


     
   
  </div>
  </div>


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
</div>

    <div class="columns">
    
    

  
  <div class="column">
      <div class="box">
          
   

      
       <div class="field">
  <label class="label">Start date</label>
  <div class="control has-icons-left has-icons-right">
   
      <input class="input" type="date" name="dateIn" id="dateIn"  onclick="dateF()" >
      
  
    <span class="icon is-small is-left">
<i class="fas fa-calendar-alt"></i>
    </span>
    
  </div>
 
</div>



  
  </div>
  </div>
  <div class="column">
      <div class="box">
          
 

       
   
       <div class="field">
  <label class="label">Finish date</label>
  <div class="control has-icons-left has-icons-right">
   
      <input class="input" type="date" name="dateOut" id="dateOut" onchange="updatedate();" onclick="dateL()" >
      
  
    <span class="icon is-small is-left">
<i class="fas fa-calendar-alt"></i>
    </span>
    
  </div>
 
</div>
   
  </div>
  </div>
 
</div>






<div class="block">
				






  <button type="submit" class="button is-success">
    <span class="icon is-small">
      <i class="fas fa-check"></i>
    </span>
    <span>Confirm to search</span>
  </button>
  
  <button type="reset" id="reset" class="button is-danger">
    <span class="icon is-small">
      <i class="fas fa-redo-alt"></i>
    </span>
    <span>Reset</span>
  </button>
 
   
           <script type='text/javascript'>
       
         
         $("#reset").on("click", function () {
        	 
        	 location.reload();
        	});
         
        </script>

  


 
 </div>

   </form>


    </div>
   </p>
		
		<div class="block">
		<p class="field">
  <a class="button is-warning" href="HistoryAllDataServlet?ID_COMPANY=<%=A.getId_Company()%>">
    <span class="icon is-small">
      <i class="fas fa-database"></i>
    </span>
    
    <span>ALL DATA</span>
  </a>
  </p>
  
  
   
  
 </div>
		
	   <%ArrayList<ListHistoryBean> List = (ArrayList<ListHistoryBean>)request.getAttribute("list"); %>
		   <%ArrayList<ListHistoryDateBean> ListDate = (ArrayList<ListHistoryDateBean>)request.getAttribute("listDate"); %>
	
	<%if(List != null){ %>
	

				
<% 
ListHistoryBean bean;
ListHistoryDateBean bean2;
						
						     
						%>
							
	
						<script type="text/javascript">
						$(document).ready(function() {
							$('#example2').DataTable({
								scrollY : '75vh',
								scrollCollapse : true,
								paging : false
							});
							
						
								
						});
					</script>		  
				
<div class="box">
	                				<table id="example2" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>

									<th>Date And Time</th>
									<th>Action</th>
									<th>Detail</th>
									<th>Userlogin</th>
										<th>Name</th>
								</tr>
							</thead>

							<tbody>
							
							
						
				
						<% 		for (int i = 0; i < List.size(); i++) {
									bean = null;
									bean = (ListHistoryBean) List.get(i);
						%>
						
					
						
						
		
	
		
<tr>





									<td>
									<%=bean.getDate2() %>		<%=bean.getTime2() %>
			
									
								</td>


									<td>
									<%=bean.getNameTypeHistory() %>	
								
								
								
									</td>
									<td>
		
					<%if(bean.getIdTypeHistory() == 1) {%>
						<%=bean.getNewNameTranID() %>		,		<%=bean.getNewNameModule() %>	
					
						<%}else if(bean.getIdTypeHistory() == 2){ %>
						
						
						
						
				
	<%=bean.getNewNameTranID() %>		,		<%=bean.getNewNameModule() %>	
		&nbsp;&nbsp;	<i class="fa fa-arrow-circle-right" aria-hidden="true"></i>	&nbsp;&nbsp;
				
								<%=bean.getOldNameTranID() %>		,		<%=bean.getOldNameModule()%>	
				
				
				
				
							<%}else if(bean.getIdTypeHistory() == 3){ %>
						
					<%=bean.getOldNameTranID() %>		,		<%=bean.getOldNameModule()%>	
							<%}else if(bean.getIdTypeHistory() == 4){ %>
														<%=bean.getNewUserLogin() %>	
					
							<%}else if(bean.getIdTypeHistory() == 5){ %>
							<%=bean.getOldUserLogin() %>	
					
							<%}else if(bean.getIdTypeHistory() == 6){ %>
					
											<%=bean.getNewUserProfile() %>	
								
							<%}else if(bean.getIdTypeHistory() == 7){ %>
								
							
							<%if(bean.getNote().equals("AddTranID")){ %>

				USP:		<%=bean.getOldUserProfile() %>				&nbsp;<i class="fa fa-plus-circle" aria-hidden="true"></i>		&nbsp;	<%=bean.getNewNameTranID() %>		,		<%=bean.getNewNameModule() %>	
						
							<%}else{ %>
							
					
						USP:		<%=bean.getOldUserProfile() %>			&nbsp;	<i class="fa fa-trash" aria-hidden="true"></i>		&nbsp;		<%=bean.getOldNameTranID() %>		,		<%=bean.getOldNameModule()%>	
							<%} %>
						
				
						
							<%}else if(bean.getIdTypeHistory() == 8){ %>
							<%=bean.getOldUserProfile()%>	
						
						
						
						<%}else if(bean.getIdTypeHistory() == 9){ %>
						
						
							<%if(bean.getNote().equals("EditUsername")){ %>

			USL:	<%=bean.getOldUserLogin() %>	&nbsp;&nbsp;	<i class="fa fa-user" aria-hidden="true"></i><i class="fa fa-arrow-circle-right" aria-hidden="true"></i>	&nbsp;&nbsp;	<%=bean.getNewUserLogin() %>	
						
							<%}else{ %>
							
					
					USL:</i>		<%=bean.getOldUserLogin() %> 	&nbsp;&nbsp;	<i class="fa fa-key" aria-hidden="true"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i>	&nbsp;&nbsp;	<%=bean.getNewPasswordUserLogin()%>
							<%} %>
						
							
						<%} %>
					
						
						
						
						


									</td>
<td>

<%=bean.getUserLoginTodo() %>	

									</td>
							<td>
<%=bean.getNamePersonnel() %>	

									</td>
									

								</tr>



								<%
									}
								%>





							</tbody>
						</table>

	                 

						
						
						</div>
						
						
						
						
						
						
						
						
						
						
					
							
				
				
							
							
							
							
							
							
				
	
	
	<%}%>
		
	
	
<br><br><br>



</div>



    </div>
  </div>
</div>
</div>


<!--  -----------------------------   footer  - ------------------------------ -->
<%
}%>


<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
<style type="text/css">
body{


font-family: 'Source Sans Pro', sans-serif;
}
</style>


</body>
</html>