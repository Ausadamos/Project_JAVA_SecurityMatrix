
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@page import="java.util.ArrayList"%>


<%@page import="Dao.ListTranIDDAO"%>
<%@page import="Dao.ListModuleDAO"%>


<%@page import="Dao.ListTranIDforDeletebacktopageDAO"%>
<%@page import="Bean.ListModuleBean"%>
<%@page import="Bean.AddProfileBean"%>
<%@page import="Bean.ListTranIDBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>


<link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bulma.css">
<link rel="stylesheet" type="text/css" href="css/bulma.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" href="dist/sweetalert.css">


<script src="js/jquery-1.12.4.js">					</script>
<script src="js/jquery.dataTables.min.js">			</script>
<script src="dist/sweetalert-dev.js">				</script>


  <script type="text/javascript">

function nospaces(t){

if(t.value.match(/\s/g)){

alert('Sorry, you are not allowed to enter any spaces');

t.value=t.value.replace(/\s/g,'');

}

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
	//------------------------------
       document.querySelector('#from2').addEventListener('click', function(e) {
           var form = this;
           e.preventDefault();
           swal({
               title: "Confirm to logout ?",
 
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
                       title: 'Logout Successful',
                
                       type: 'success'
                   }, function() {
                       form.submit();
                   });

               } else {
                   swal("Cancelled");
               }
           });
       });
});
   </script>
   

    <link rel="stylesheet" href="css/bulma-radio-checkbox.css">



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
}
body{
 background-color: #F8F9F9  ;
}html {
   margin: 0px;
   height: 100%;
   width: 100%;
}

body {
   margin: 0px;
   min-height: 100%;
   width: 100%;
}.menu-list a.is-active {
  background-color: #AED6F1;
  color: #000;
}.hero.is-primary.is-bold {
  background-image: -webkit-linear-gradient(309deg, #009e6c 0%, #00d1b2 71%, #00e7eb 100%);
  background-image: linear-gradient(141deg, #57a6de 0%, #58a7df   71%, #5baadf   100%);
}
#wrapper {
background:#fff;
margin:10px auto;
width:960px;
border:1px solid #dfdfdf;
min-height: 700px;
}

</style>

<%
				String statusSearchTranID = (String) request.getAttribute("statusSearchTranID");

                String id3[] = (String[]) request.getAttribute("listoo2");	
			%>


<%

if(id3 != null){
	
int[] numbers = new int[id3.length];

for(int j = 0;j < id3.length;j++)
{
   
   numbers[j] = Integer.parseInt(id3[j]);
}


  
    
    
}
    %>




			<%
				if (request.getAttribute("statusSearchTranID") != null) {
			%>
			

			<%
				if (Integer.parseInt(statusSearchTranID) == 0) {
			%>


			<script type="text/javascript">
				$(document).ready(function() {
	
					swal('', 'please checkbox module!', 'error')
	
				});
			</script>
			<%
				}
			%>
			
			
			<%
				}
			%>
			
			
			
			
			
			
			
			
			

<%
				String status = (String) request.getAttribute("status");
			%>

			<%
				if (request.getAttribute("status") != null) {
			%>
			<%
				if (Integer.parseInt(status) == 1) {
			%>

			<script type="text/javascript">
				$(document).ready(function() {
	
					swal("", "successful", "success")
	
				});
			</script>




			<%
				}
			%>

			<%
				if (Integer.parseInt(status) == 0) {
			%>


			<script type="text/javascript">
				$(document).ready(function() {
	
					swal('', 'TranID duplicate', 'error')
	
				});
			</script>
			<%
				}
			%>
			<%
				if (Integer.parseInt(status) == 2) {
			%>


			<script type="text/javascript">
				$(document).ready(function() {
	
					swal('', 'please select module!', 'error')
	
				});
			</script>
			<%
				}
			%>
			
			<%
				}
			%>

			<%
				String status2 = (String) request.getAttribute("status2");
			%>

			<%
				if (request.getAttribute("status2") != null) {
			%>
			<%
				if (Integer.parseInt(status2) == 1) {
			%>

			<script type="text/javascript">
				$(document).ready(function() {
	
					swal("", "successful!", "success")
	
				});
			</script>




			<%
				}
			%>

			<%
				if (Integer.parseInt(status2) == 0) {
			%>


			<script type="text/javascript">
				$(document).ready(function() {
	
					swal('', 'Please select items to delete!', 'error')
	
				});
			</script>
			<%
				}
			%>
			<%
				}
			%>

			<%
				String status3 = (String) request.getAttribute("status3");
			%>

			<%
				if (request.getAttribute("status3") != null) {
			%>
			<%
				if (Integer.parseInt(status3) == 1) {
			%>

			<script type="text/javascript">
				$(document).ready(function() {
	
					swal("", "successful", "success")
	
				});
			</script>




			<%
				}
			%>

			<%
				if (Integer.parseInt(status3) == 0) {
			%>


			<script type="text/javascript">
				$(document).ready(function() {
	
					swal('', 'Duplicate TranID!', 'error')
	
				});
			</script>
			<%
				}
			%>
			<%
				}
			%>

</head>
<body>


<%
if(session.getAttribute("userLogBean")==null) {
%>
<jsp:include page="Login.jsp"></jsp:include>
<%
} else {
%>


<%@page import="Bean.UserLogBean"%>
<%
			UserLogBean A = null;

			try {
				A = (UserLogBean) session.getAttribute("userLogBean");
			} catch (Exception e) {
				A = null;
			}
		%>
		




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
   <input class="input" onkeyup="nospaces(this)" type="password" name="OldPassword" id="OldPassword" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="ต้องประกอบด้วยตัวเลขอย่างน้อยหนึ่งตัวอักษรและตัวพิมพ์ใหญ่และตัวพิมพ์เล็กและตัวอักษรอย่างน้อย 8 ตัวขึ้นไป"  placeholder="Enter Current Password"/>
  
    <span class="icon is-small is-left">
      <i class="fas fa-key"></i>
    </span>
    
  </div>
 
 
</div>
   
        <div class="field">
  <label class="label">New Password</label>
  <div class="control has-icons-left has-icons-right">
   <input class="input" onkeyup="nospaces(this)" type="password" name="NewPassword" id="NewPassword" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="ต้องประกอบด้วยตัวเลขอย่างน้อยหนึ่งตัวอักษรและตัวพิมพ์ใหญ่และตัวพิมพ์เล็กและตัวอักษรอย่างน้อย 8 ตัวขึ้นไป"  placeholder="Enter New Password"/>
  
    <span class="icon is-small is-left">
      <i class="fas fa-key"></i>
    </span>
    
  </div>
 
 
</div>
  
    <div class="field">
  <label class="label">New Password again</label>
  <div class="control has-icons-left has-icons-right">
   
      <input class="input" onkeyup="nospaces(this)" type="password" name="ConfirmNewPassword" id="ConfirmNewPassword" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
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
      <img src="img/55.jpeg" width="25px">  &nbsp;
  <img src="img/ntt2.png" width="120px"> 
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

						<li><a class="is-active">MENU</a>
							<ul>
							
							 <%if (A.getStatus() == 1){%>
								<li><a class="active" href="AddTranID.jsp"><i
										class="fa fa-key" aria-hidden="true"></i> TranID</a></li>
 
        

  <li><a  href="USER_S1.jsp"><i class="fa fa-user" aria-hidden="true"></i> User</a></li>


        <%} %>
     
     
								<li><a class="active" href="AddProfile_1.jsp"> <i
										class="fa fa-plus-square" aria-hidden="true"></i> Profile
								</a></li>
								<li><a href="ShowDataSelect.jsp"><i
										class="fa fa-pencil" aria-hidden="true"></i> Update</a></li>
								<li><a href="DeleteProfile.jsp"><i class="fa fa-trash"
										aria-hidden="true"></i> Delete</a></li>
										
										
										
										
										
								<li><a href="Inquiry.jsp"><i class="fa fa-users"
										aria-hidden="true"></i> Inquiry</a></li>
										
										
										    <%if (A.getStatus() == 1){%>
                        <li><a class="active" href="HistoryForAdminNewFile.jsp">  <i class="fa fa-history" aria-hidden="true"></i> History</a></li>
        
         <%} %>
         
         
								<li><a href="ToText.jsp"><i class="fa fa-file-text"
										aria-hidden="true"></i> To File</a></li>
							</ul></li>

					</ul>

					</aside>
				</div>

			</div>
			
			<div class="tile is-vertical is-parent">
				<div class="tile is-child box">
					<i class="fas fa-plus fa-1x fa-pull-left fa-border"></i><p class="title is-4">ADD TRANID</p><hr>

<script>

$(document).ready(function(){
	
   
	   //----------------------------
	   
       document.querySelector('#from_AddTranIDServlet').addEventListener('submit', function(e) {
    	   
    	   
    	   
           var form = this;
           e.preventDefault();
           swal({
               title: "Confirm to ADD TRANID ? ",
 				text:  "",
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
                       title: 'Adding action ..',
                
                       type: 'success'
                   }, function() {
                       form.submit();
                   });

               } else {
                   swal("Cancelled");
               }
           });
       });
       
       //--------------------------
       

       document.querySelector('#from_DeleteTranIDServlet').addEventListener('submit', function(e) {
    	   
    	
    	   if( $('input[type=search]').val() != ""){
	    		  alert("กรุณาล้างค่าการค้นหา !");
	    	
	    		        e.preventDefault();
	    		 
	    		  
	    	  }else{
	    		  
	    	  
           var form = this;
           e.preventDefault();
           swal({
               title: "Confirm to DELETE TRANID ?",
       		text:  "",
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
       //-------------------------------
       



var count  = $("#countEdit").val();
        
       for(let i = 0;i<count;i++){
    	   
    	   
           document.querySelector('#form_EditTranIdServlet_'+i).addEventListener('submit', function(e) {
        	   
        	   
        	//   console.log("เข้า#form_EditTranIdServlet")
               var form = this;
               e.preventDefault();
               swal({
                   title: "Confirm to EDIT TRANID ?",
           		text:  "",
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
                           title: 'Editing action ..',
                    
                           type: 'success'
                       }, function() {
                           form.submit();
                       });

                   } else {
                       swal("Cancelled");
                   }
               });
           });
    	   
       }
       //----------------------------
   	   
  	    
     
       
       
     
       //----------------------------------
});
   </script>
  <script type="text/javascript">

function nospaces(t){

if(t.value.match(/\s/g)){

alert('Sorry, you are not allowed to enter any spaces');

t.value=t.value.replace(/\s/g,'');

}

}

</script>
  
  
  
  
  
  



					<form action="AddTranIDServlet" method="post" id="from_AddTranIDServlet">
					<input type="hidden" name="NameUserLog" value="<%=A.getUsername()%>"> 
					<input type="hidden" name="getId_Company" value="<%=A.getId_Company()%>"> 
					
					<input type="hidden" name="getNamePersonal" value="<%=A.getFname()%> <%=A.getLname()%>">
					
					         
						<div class="field">

							<p class="control">
							<div class="columns">
								
								<div class="column is-one-third">





									<%
										String name_ERROR = (String) request.getAttribute("name_ERROR");
									%>

									<%
										if (request.getAttribute("name_ERROR") != null) {
									%>
  <label class="label">TranID</label>
  

								
<div class="control has-icons-left has-icons-right">
									<input class="input" value="<%=name_ERROR%>" name="name"
										type="text" placeholder="Enter your TranID" maxlength="4"
										required pattern="[A-Z0-9 -]{4}" onkeyup="nospaces(this)"
										title="กรุณากรอกภาษาอังกฤษตัวใหญ่หรือตัวเลข จำนวน 4ตัว">
	   <span class="icon is-small is-left">
	    <i class="far fa-list-alt"></i>

    </span>
	
	</div>





    <label class="label">Module</label>
    
    
    <div class="control has-icons-left ">
								
  <div class="select">
    <select name="selectModule" required>
      <option>Select Module</option>
    
    
								<%
									ListModuleDAO SH8 = new ListModuleDAO();
	
									ArrayList<ListModuleBean> RB8 = new ArrayList<ListModuleBean>();
								%>


								<%
									int i2 = 0;
	
									RB8 = SH8.ListTranID();
									for (int i = 0; i < RB8.size(); i++) {
								%>
    
    
    
  
    
          <option value="<%=RB8.get(i).getIdModule()%>"><%=RB8.get(i).getNameModule()%> </option>
    
    
    <%} %>
    
    
  
    </select>
  </div>


	   <span class="icon is-small is-left">
<i class="fas fa-archive"></i>     
    </span>
	
	</div>
    
    



									<%
										} else {
									%>
    <label class="label">TranID</label>
							
										
						<div class="control has-icons-left has-icons-right">
											<input class="input " name="name" type="text"
										placeholder="Enter your TranID" maxlength="4" required
										pattern="[A-Z0-9 -]{4}"onkeyup="nospaces(this)"
										title="กรุณากรอกภาษาอังกฤษตัวใหญ่หรือตัวเลข จำนวน 4ตัว">
	   <span class="icon is-small is-left">
      <i class="far fa-list-alt"></i>
    </span>
	
	</div>				
										

    <label class="label">Module</label>
    
    <div class="control has-icons-left">
								 <div class="select">
    <select name="selectModule">
      <option>Select Module</option>
    
    
								<%
									ListModuleDAO SH8 = new ListModuleDAO();
	
									ArrayList<ListModuleBean> RB8 = new ArrayList<ListModuleBean>();
								%>


								<%
									int i2 = 0;
	
									RB8 = SH8.ListTranID();
									for (int i = 0; i < RB8.size(); i++) {
								%>
    
    
    
  
    
          <option value="<%=RB8.get(i).getIdModule()%>"><%=RB8.get(i).getNameModule()%> </option>
    
    
    <%} %>
    
    
    
    
    
    
    
    
    
    </select>
  </div>




	   <span class="icon is-small is-left">
   <i class="fas fa-archive"></i>     
    </span>
	
	</div>
	
 















									<%
										}
									%>







								</div>
							</div>









							<div class="block">


							

  <button type="submit" class="button is-success">
    <span class="icon is-small">
      <i class="fas fa-check"></i>
    </span>
    <span>Save</span>
  </button>
  
  <button type="reset" class="button is-danger">
    <span class="icon is-small">
      <i class="fas fa-redo-alt"></i>
    </span>
    <span>Reset</span>
  </button>
  
  


							</div>

						</div>


					</form>
				</div>
				
				
<script type="text/javascript">

    function do_this(){

        var checkboxes = document.getElementsByName('TranID22[]');
        var button = document.getElementById('toggle');

        if(button.value == 'Select All'){
            for (var i in checkboxes){
                checkboxes[i].checked = 'FALSE';
            }
            button.value = 'Deselect'
        }else{
            for (var i in checkboxes){
                checkboxes[i].checked = '';
            }
            button.value = 'Select All';
        }
    }
</script>
			
<script type="text/javascript">

    function do_this2(){

        var checkboxes = document.getElementsByName('TranID[]');
        var button = document.getElementById('toggle');

        if(button.value == 'Select All'){
            for (var i in checkboxes){
                checkboxes[i].checked = 'FALSE';
            }
            button.value = 'Deselect'
        }else{
            for (var i in checkboxes){
                checkboxes[i].checked = '';
            }
            button.value = 'Select All';
        }
    }
</script>
				<div class="tile is-child box">
		<i class="fas fa-edit fa-1x fa-pull-left fa-border"></i>			<h4 class="title is-4">EDIT & DELETE TRANID</h4><hr>
					    
       <form action="SearchFromEditDeleteTranID" method="post">
        
        <nav class="level">

  <div class="level-left">
      
    <h2 class="subtitle is-5">Select to search Module</h2>
    
		</div>
		
		
		 <div class="level-right">
        
        
<input  class="button is-small is-info is-outlined" type="button" id="toggle" value="Select All" onClick="do_this()" />
        
    </div>
        
        </nav>
        
        
        
        
        <div class="columns">
					
					


        
        
    
    

        
        
        

  
	<%
									ListModuleDAO SH9 = new ListModuleDAO();
	
									ArrayList<ListModuleBean> RB9 = new ArrayList<ListModuleBean>();
								%>


								<%
									int i2 = 0;
	
									RB9 = SH9.ListTranID();
									for (int i = 0; i < RB9.size(); i++) {
								%>
								
								<%if(i<6){ %>
								  <div class="column">
    <div class="field">
    <p class="control">
        <div class="b-checkbox is-success ">

               <input id="checkbox8888<%=i%>" name="TranID22[]" class="styled" type="checkbox" 	value="<%=RB9.get(i).getIdModule()%>">
            <label for="checkbox8888<%=i%>">
      <span class="tag is-light is-medium">      <%=RB9.get(i).getNameModule()%> </span>   
            </label>
            
     		        
        						
										
        </div>
    </p>
</div>
			  </div>
    
    <%} %>
    <%} %>
    


	
       

 
</div>
         <div class="columns">

    

        
        
        

  
	<%
									ListModuleDAO SH10 = new ListModuleDAO();
	
									ArrayList<ListModuleBean> RB10 = new ArrayList<ListModuleBean>();
								%>


								<%
								
	
									RB10 = SH10.ListTranID();
									for (int i = 0; i < RB10.size(); i++) {
								%>
								
								<%if(i>=6){ %>
								  <div class="column">
    <div class="field">
    <p class="control">
        <div class="b-checkbox is-success ">

               <input id="checkbox8889<%=i%>" name="TranID22[]" class="styled" type="checkbox" 	value="<%=RB10.get(i).getIdModule()%>">
            <label for="checkbox8889<%=i%>">
      <span class="tag is-light is-medium"><%=RB10.get(i).getNameModule()%> </span>   
            </label>
            
     		        
        						
										
        </div>
    </p>
</div>
			  </div>
    
    <%} %>
    <%} %>
    


	
       

 
</div>     






 
  <button type="submit" class="button is-success is-outlined">
    <span class="icon is-small">
      <i class="fas fa-chevron-circle-right"></i>
    </span>
    <span>Next</span>
  </button>
				



</form> 

<br>

<%
	


            		
            		
            		
            		
String id2[] = (String[]) request.getAttribute("listoo");
			
		%>
		
		
		<%if((id2 != null)){ %>
		<div class="box">

  
	<%
	ListTranIDforDeletebacktopageDAO SH12 = new ListTranIDforDeletebacktopageDAO();
	ArrayList<ListTranIDBean> RB12 = new ArrayList<ListTranIDBean>();
	ListTranIDforDeletebacktopageDAO SH16 = new ListTranIDforDeletebacktopageDAO();
	ArrayList<ListTranIDBean> RB16 = new ArrayList<ListTranIDBean>();
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

								<%
								int[] numbers = new int[id2.length];
								
								for(int j = 0;j < id2.length;j++)
								{
								   
								   numbers[j] = Integer.parseInt(id2[j]);
								}
								   %>
								  
							
								   
							
						
		
		
					<form action="DeleteTranIDServlet" method="post" id="from_DeleteTranIDServlet">
					
					
					<input type="hidden" name="NameUserLog" value="<%=A.getUsername()%>" >  
					
					<input type="hidden" name="getId_Company" value="<%=A.getId_Company()%>"> 
					
					<input type="hidden" name="getNamePersonal" value="<%=A.getFname()%> <%=A.getLname()%>">
					        
					<% for (String s : id2) {%>
  <input value="<%=s%>" name="id3[]" type="hidden"/>
<%}%>
					
			 
<input  class="button is-small is-info is-outlined" type="button" id="toggle" value="Select All" onClick="do_this2()" />		
						<table id="example2" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>

									<th>TRAN ID</th>
									<th>MODULE</th>
									<th>EDIT</th>
								</tr>
							</thead>

							<tbody>
							
							
									   <% 
							
								
	
									RB12 = SH12.ListTranIDforDeletebacktopage(numbers);
									
									
									for (int i = 0; i < RB12.size(); i++) {
								%>
		
		
	
		
<tr>





									<td>
								      
<%if(!(RB12.get(i).getCode().equals("SSSN") || RB12.get(i).getCode().equals("SSSF") || RB12.get(i).getCode().equals("SSSR"))){ %>	
									
<div class="field">
    <p class="control">
        <div class="b-checkbox is-danger  is-circular">
        
        
  
               <input id="checkboxp<%=i%>" name="TranID[]" class="styled" type="checkbox" 	value="<%=RB12.get(i).getIdTranID()%>">
            
            
      
            
            <label for="checkboxp<%=i%>">

    	<%=RB12.get(i).getCode()%>
              	
            </label>
            
            
            
           
										
										
										
										
										
										
        </div>
    </p>
</div>
				      <%}else{%>					
						&nbsp;&nbsp;&nbsp;&nbsp;<%=RB12.get(i).getCode()%>		
							
							<%} %>		
								</td>


									<td>
									<%=RB12.get(i).getNameModule()%>
									</td>
									<td>





										<center>

<%if(!(RB12.get(i).getCode().equals("SSSN") || RB12.get(i).getCode().equals("SSSF") || RB12.get(i).getCode().equals("SSSR"))){ %>




											<a
												onclick="document.getElementById('myBtn2_<%=i%>').style.display='block'"><font
												color="#DC7633 "> <span class="icon is-medium"><i
														class="fa fa-pencil-square" aria-hidden="true"></i></span></font></a>
										</center>
										
										<%} %>
									</td>


								</tr>



								<%
									}
								%>





							</tbody>
						</table>





						<br>


						<button type="submit" class="button is-success">
						
						<span class="icon is-small">
      <i class="fas fa-check"></i>
    </span>
    <span> Confirm to delete</span>
    
   </button>

						<button type="reset" class="button is-danger">
						
						<span class="icon is-small">
      <i class="fas fa-redo-alt"></i>
    </span>
    <span>Reset</span>
    
    </button>


					</form>



					<!-- The Modal -->


				</div>
			</div>
		</div>


	</div>
	<br>
	<br>
	<br>
	
	<%
									ListModuleDAO SH99 = new ListModuleDAO();
	
									ArrayList<ListModuleBean> RB99 = new ArrayList<ListModuleBean>();
            		
            		                RB99 = SH99.ListTranID();
            		                
            		                int i = 0;
								%>
   
	
									   <% 

									   
									   
									RB16 = SH16.ListTranIDforDeletebacktopage(numbers);

									for ( i = 0; i < RB16.size(); i++) {
								%>
		
		

	<form action="EditTranIdServlet" method="post"  id="form_EditTranIdServlet_<%=i%>">
	
	<input type="hidden" name="getId_Company" value="<%=A.getId_Company()%>"> 
					
					<input type="hidden" name="getNamePersonal" value="<%=A.getFname()%> <%=A.getLname()%>">
					
		<input type="hidden" name="NameUserLog" value="<%=A.getUsername()%>">       
<input type="hidden" name="PK_TranID" value="<%=RB12.get(i).getIdTranID()%>">
	<% for (String s : id2) {%>
  <input value="<%=s%>" name="id3[]" type="hidden"/>
<%}%>




  
	
	<div id="myBtn2_<%=i%>"  class="modal">
	
	<br><br><br><br>	<br><br>
  <div class="modal-background"></div>
  <div class="modal-content">
    <header class="modal-card-head">
      <p class="modal-card-title"> <i class="far fa-edit"></i>EDIT TRANID
      

     
  
  
        </p>
  
  

   
      	<span
						onclick="document.getElementById('myBtn2_<%=i%>').style.display='none'"
						class="delete" ></span>
						
    </header>
    <section class="modal-card-body">
   
       
       
       <div class="field">
  <label class="label">TranID</label>
  <div class="control has-icons-left has-icons-right">
  
  
  <input class="input" type="text" name="CodeNew"
								value="<%=RB12.get(i).getCode()%>" maxlength="4" required pattern="[A-Z0-9 -]{4}"
										title="กรุณากรอกภาษาอังกฤษตัวใหญ่หรือตัวเลข จำนวน 4ตัว" onkeyup="nospaces(this)">
										
										
    <span class="icon is-small is-left">
     <i class="far fa-list-alt"></i>
    </span>
    
  </div>
 
 
</div>
  
    <div class="field">
  <label class="label">Module</label>
  <div class="control has-icons-left has-icons-right">
   
     
  <div class="select">
    <select name="selectModule" class="input">
  
    
    
							


						
								<%
								
								
									for (int i99 = 0; i99 < RB99.size(); i99++) {
										
										
										if(RB12.get(i).getIdModule() == RB99.get(i99).getIdModule()){
								%>
								
								
								
								
    
    
          
    
    
    
          <option  selected="selected"  value="<%=RB99.get(i99).getIdModule()%>"><%=RB99.get(i99).getNameModule()%></option>
    
    
    
    
    
    
    
    <% }else{
    	%>
    	   <option value="<%=RB99.get(i99).getIdModule()%>"><%=RB99.get(i99).getNameModule()%></option>
    
    <% 
    
    }   }        
    %>
    </select>
  </div>
    <span class="icon is-small is-left">
<i class="fas fa-archive"></i>
    </span>
    
  </div>
 
</div>
  
    </section>
    <footer class="modal-card-foot">
      <button  type="submit"      class="button is-success">
      
      
       <span class="icon is-small">
      <i class="fas fa-check"></i>
    </span>
    <span>  Save changes</span>
    
  </button>
      <button class="button" type="reset">Reset</button>
    </footer>
  </div>
</div>
  
  
  


	</form>

	<%
		}
	%>		
		
	<input type="hidden" value="<%=i%>" id="countEdit">
		
				</div>
		
		<% } %>
		

<%if(((ArrayList<ListTranIDBean>)request.getAttribute("list") != null) ) {%>
<div class="box">
					<script type="text/javascript">
						$(document).ready(function() {
							$('#example').DataTable({
								scrollY : '75vh',
								scrollCollapse : true,
								paging : false
							});
							
						
								
						});
					</script>



     	<%ArrayList<ListTranIDBean> List2 = (ArrayList<ListTranIDBean>)request.getAttribute("list"); %>
										
     	<%ArrayList<ListTranIDBean> List = (ArrayList<ListTranIDBean>)request.getAttribute("list"); %>

 
<input  class="button is-small is-info is-outlined" type="button" id="toggle" value="Select All" onClick="do_this2()" />
				
				
				
					<form action="DeleteTranIDServlet" method="post" id="from_DeleteTranIDServlet">
					
	<input type="hidden" name="getId_Company" value="<%=A.getId_Company()%>"> 
					
					<input type="hidden" name="getNamePersonal" value="<%=A.getFname()%> <%=A.getLname()%>">
					
						<input type="hidden" name="NameUserLog" value="<%=A.getUsername()%>">   
	
					<% for (String s : id3) {%>
  <input value="<%=s%>" name="id3[]" type="hidden"/>
<%}%>
					
					
						<table id="example" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>

									<th>TRAN ID</th>
									<th>MODULE</th>
									<th>EDIT</th>
								</tr>
							</thead>

							<tbody>


	<%
						

	ListTranIDBean bean;

							for (int i = 0; i < List2.size(); i++) {
								bean = null;
								bean = (ListTranIDBean) List2.get(i);
								
						
							     
							     
							     
						%>



								<tr>





									<td>
							<%if(!(bean.getCode().equals("SSSN") || bean.getCode().equals("SSSF")|| bean.getCode().equals("SSSR"))){ %>		
									
<div class="field">
    <p class="control">
        <div class="b-checkbox is-danger  is-circular">
        

               <input id="checkboxp<%=i%>" name="TranID[]" class="styled" type="checkbox" value="<%=bean.getIdTranID()%>">
          
            
            
            
            <label for="checkboxp<%=i%>">

          <%=bean.getCode()%>   
              	
            </label>
            
            
            
           
										
										
										
										
										
										
        </div>
    </p>
</div>
				  <%}else{%>	
				  
				       			&nbsp;&nbsp;&nbsp;&nbsp;<%=bean.getCode()%>   
				  
				  
				  <%} %>				
									
									
								</td>


									<td>
									    <%=bean.getNameModule()%>   
									</td>
									<td>



<%if(!(bean.getCode().equals("SSSN") || bean.getCode().equals("SSSF")  || bean.getCode().equals("SSSR") )){ %>

										<center>






											<a
												onclick="document.getElementById('myBtn2_<%=i%>').style.display='block'"><font
												color="#DC7633 "> <span class="icon is-medium"><i
														class="fa fa-pencil-square" aria-hidden="true"></i></span></font></a>
										</center>
										
										<%} %>
										
									</td>


								</tr>



								<%
									}
								%>





							</tbody>
						</table>





						<br>


						<button type="submit" class="button is-success">
						
						<span class="icon is-small">
      <i class="fas fa-check"></i>
    </span>
    <span> Confirm to delete</span>
    
   </button>

						<button type="reset" class="button is-danger">
						
						<span class="icon is-small">
      <i class="fas fa-redo-alt"></i>
    </span>
    <span>Reset</span>
    
    </button>

					</form>



					<!-- The Modal -->


				</div>
			</div>
		</div>



	</div>
	<br>
	<br>
	<br>

     
	<%
									ListModuleDAO SH100 = new ListModuleDAO();
	
									ArrayList<ListModuleBean> RB100 = new ArrayList<ListModuleBean>();
            		
            		                RB100 = SH100.ListTranID();
            		            	int i = 0;		
								%>
								
	<%
						



							for ( i = 0; i < List.size(); i++) {
								bean = (ListTranIDBean) List.get(i);
						%>

	<form action="EditTranIdServlet" method="post" id="form_EditTranIdServlet_<%=i%>">
<input type="hidden" name="getId_Company" value="<%=A.getId_Company()%>"> 
					
					<input type="hidden" name="getNamePersonal" value="<%=A.getFname()%> <%=A.getLname()%>">
					
<input type="hidden" name="PK_TranID"
							value="<%=bean.getIdTranID()%>">
	<input type="hidden" name="NameUserLog" value="<%=A.getUsername()%>">       
	
	<% for (String s : id3) {%>
  <input value="<%=s%>" name="id3[]" type="hidden"/>
<%}%>
	
  
  
  
	
	<div id="myBtn2_<%=i%>"  class="modal">
	
	<br><br><br><br>	<br><br>
  <div class="modal-background"></div>
  <div class="modal-content">
    <header class="modal-card-head">
      <p class="modal-card-title"> <i class="far fa-edit"></i>EDIT TRANID
      

     
  
  
        </p>
  
  

   
      	<span
						onclick="document.getElementById('myBtn2_<%=i%>').style.display='none'"
						class="delete" ></span>
						
    </header>
    <section class="modal-card-body">
   
       
       
       <div class="field">
  <label class="label">TranID</label>
  <div class="control has-icons-left has-icons-right">
  
  
  <input class="input" type="text" name="CodeNew"
								value="<%=bean.getCode()%>" maxlength="4" required pattern="[A-Z0-9 -]{4}"
										title="กรุณากรอกภาษาอังกฤษตัวใหญ่หรือตัวเลข จำนวน 4ตัว" onkeyup="nospaces(this)">
										
										
    <span class="icon is-small is-left">
     <i class="far fa-list-alt"></i>
    </span>
    
  </div>
 
 
</div>
  
    <div class="field">
  <label class="label">Module</label>
  <div class="control has-icons-left has-icons-right">
   
     
  <div class="select">
    <select name="selectModule" class="input">
  
    
    
							


								<%
								
								
									for (int i100 = 0; i100 < RB100.size(); i100++) {
										
										
										if(bean.getIdModule() == RB100.get(i100).getIdModule()){
								%>
								
								
								
    
    
          
    
    
          <option  selected="selected"  value="<%=RB100.get(i100).getIdModule()%>"><%=RB100.get(i100).getNameModule()%></option>
    
    
    
    
    
    
    
    <% }else{
    	%>
    	   <option value="<%=RB100.get(i100).getIdModule()%>"><%=RB100.get(i100).getNameModule()%></option>
    
    <% 
    
    }   }        
    %>
    </select>
  </div>
    <span class="icon is-small is-left">
<i class="fas fa-archive"></i>
    </span>
    
  </div>
 
</div>
  
    </section>
    <footer class="modal-card-foot">
      <button  type="submit"      class="button is-success">
      
      <span class="icon is-small">
      <i class="fas fa-check"></i>
    </span>
    <span> Save changes</span>
      
      
     </button>
      <button class="button" type="reset">Reset</button>
    </footer>
  </div>
</div>
  
  
  
  
  
  


	</form>

	<%
		}
	%>
	<input type="hidden" value="<%=i%>" id="countEdit">
</div>

<%
}%>




				</div>
			</div>
		</div>



	</div>
	

<%
}%>




	<!--  -----------------------------   footer  - ------------------------------ -->

<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
<style type="text/css">
body{


font-family: 'Source Sans Pro', sans-serif;
}
</style>

</body>

<script type="text/javascript" src="js/materialize.min.js"></script>
</html>