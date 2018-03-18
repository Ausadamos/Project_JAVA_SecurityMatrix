

<%@page import="Bean.UserLogBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="Bean.AddProfileBean"%>
<%@page import="Bean.AddUserBean"%>

<%@page import="java.util.ArrayList"%>
<%@page import="Dao.AddUserDAO"%>
<%@page import="Bean.ListPersonnelBean"%>
<%@page import="Dao.ListPersonnelDAO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">
 
 
<link rel="stylesheet" href="css/radio_New.css">

<link rel="stylesheet" type="text/css" href="css/bulma.css">
<link rel="stylesheet" type="text/css" href="css/bulma.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">

<link rel="stylesheet" href="dist/sweetalert.css">


<script src="js/jquery-1.12.4.js">					</script>
<script src="js/jquery.dataTables.min.js">			</script>
<script src="dist/sweetalert-dev.js">				</script>


					<script type="text/javascript">
						$(document).ready(function() {
							$('#example').DataTable({
								scrollY : '75vh',
								scrollCollapse : true,
								paging : false
							});
						});
					</script>

<script>

$(document).ready(function(){


		

	       document.querySelector('#form_AddUserServlet').addEventListener('submit', function(e) {
	    	   
	    	   
	    	   
	           var form = this;
	           e.preventDefault();
	           swal({
	               title: "Confirm to Add USERLOGIN ?",
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
	       
	    /*   onMyCalClearClick(){
	    	    delete this.dataTableComponent.filters.myFilterProp; // work around to clear custom filter
	    	   // here I force the datatable to refresh, bu maintaining the other filters if it has.
	    	} */
	       
	    	
	    	
	
    	   
	       
	       document.querySelector('#form_DeleteUserServlet').addEventListener('submit', function(e) {
	    	   
	    
	    	   
	    	    
	    	  if( $('input[type=search]').val() != ""){
	    		  alert("กรุณาล้างค่าการค้นหา !");
	    	
	    		        e.preventDefault();
	    		 
	    		  
	    	  }else{
	
	    
	   
	    	  
	    	   
	           var form = this;
	           e.preventDefault();
	           swal({
	               title: "Confirm to DELETE USERLOGIN ?",
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
	       
	       //--------------------------

       document.querySelector('#from2').addEventListener('click', function(e) {
           var form = this;
           e.preventDefault();
           swal({
               title: "Confirm to Logout ?",
 
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
                       title: 'Logout Success',
                
                       type: 'success'
                   }, function() {
                       form.submit();
                   });

               } else {
                   swal("Cancel");
               }
           });
       });
	       
	       
	       

       
       


       var count  = $("#countEditPersonal").val();
               
              for(let i = 0;i<count;i++){
           	   
           	   
                  document.querySelector('#form_EditPersonal_'+i).addEventListener('submit', function(e) {
               	   
               	   
               	//   console.log("เข้า#form_EditTranIdServlet")
                      var form = this;
                      e.preventDefault();
                      swal({
                          title: "Confirm to EDIT USERNAME ?",
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
           	   //-------------
           	   
                  document.querySelector('#form_EditPasswordPersonal_'+i).addEventListener('submit', function(e) {
                  	   
                  	
                	   var password = $("#NewPassword"+i).val();
                       var confirmPassword = $("#NewPasswordagain"+i).val();
                       
                       if (password != confirmPassword) {
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
               
           	   //----------------------------
           	   
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
               
           	   //----------------------------
              
                  
                  
                  //-----------
              }
              
       
       
	       
});
   </script>
   

    <link rel="stylesheet" href="css/bulma-radio-checkbox.css">



<style type="text/css">

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

</style>


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
	
					swal('', 'User duplicate or Personnel duplicate  !', 'error')
	
				});
			</script>
			<%
				}
			%>
			<%
				}
			%>





<%
				String status_editPersonal = (String) request.getAttribute("status_editPersonal");
			%>

			<%
				if (request.getAttribute("status_editPersonal") != null) {
			%>
			<%
				if (Integer.parseInt(status_editPersonal) == 1) {
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
				if (Integer.parseInt(status_editPersonal) == 0) {
			%>


			<script type="text/javascript">
				$(document).ready(function() {
	
					swal('', 'duplicate Username !', 'error')
	
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
	
					swal("", "successful", "success")
	
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
	
					swal('', 'Error Level', 'error')
	
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
		

  <script language="javascript">
function fncSubmit()
{

	

	if(document.form1.NewPassword.value != document.form1.ConfirmNewPassword.value)
	{
		alert('Confirm  New Password Not Match');
		document.form1.ConfirmNewPassword.focus();		
		return false;
	}	


	document.form1.submit();
}
</script>
 </script>
  <script type="text/javascript">

function nospaces(t){

if(t.value.match(/\s/g)){

alert('Sorry, you are not allowed to enter any spaces');

t.value=t.value.replace(/\s/g,'');

}

}

</script>

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





<nav class="navbar is-transparent ">
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


			<div class="tile is-2 is-vertical is-parent ">
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
			<i class="fas fa-plus fa-1x fa-pull-left fa-border"></i>		<p class="title  is-4">ADD USERLOGIN</p><hr>


					<form action="AddUserServlet" method="post" id="form_AddUserServlet">
					<input type="hidden" name="getId_CompanyUserLogin" value="<%=A.getId_Company()%>"> 
					
<input type="hidden" name="getNamePersonal" value="<%=A.getFname()%> <%=A.getLname()%>">
					
					<input type="hidden" value="<%=A.getStatus()%>" name="IDStatus">
					<input type="hidden" value="<%=A.getUsername()%>" name="getUsername">	
					
					
					<input type="hidden" name="NameUserLog" value="<%=A.getUsername()%>">       
						
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
									
  <label class="label">Username</label>
  	
<div class="control has-icons-left has-icons-right">
									<input class="input" onkeyup="nospaces(this)" value="<%=name_ERROR%>" name="name"
										type="text" placeholder="Enter Username" maxlength="20"
										required pattern="[A-Z0-9 -]{5,20}"
										title="Please enter at least 5 English letters or numbers.">
	   <span class="icon is-small is-left">
      <i class="fa fa-user"></i>
    </span>
	
	</div>
	  <label class="label">Password</label>
<div class="control has-icons-left has-icons-right">
									<input onkeyup="nospaces(this)" class="input" name="Password" type="password"
										placeholder="Enter Password" maxlength="20" required
										pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters ">
   <span class="icon is-small is-left">
<i class="fas fa-key"></i>
    </span>

	</div>
	
	  <label class="label">Personnel</label>
<div class="control has-icons-left ">
 <input list="browsers" onkeyup="nospaces(this)" name="browser" class="input" required  placeholder="select Personnel">
   <span class="icon is-small is-left">
<i class="far fa-id-card"></i>
    </span>
  <datalist id="browsers">
  
								<%
								ListPersonnelDAO SH123 = new ListPersonnelDAO();
	
									ArrayList<ListPersonnelBean> RB123 = new ArrayList<ListPersonnelBean>();
								%>


								<%
									int i2 = 0;
	
									RB123 = SH123.ListTranID();
									for (int i = 0; i < RB123.size(); i++) {
								%>
    
    
    
  
    
          <option value="<%=RB123.get(i).getIdNTT()%>"> <%=RB123.get(i).getFname()%> <%=RB123.get(i).getLname()%> [<%=RB123.get(i).getNameCompany()%>]</option>
    
    
    <%} %>
    
    

    
    
  </datalist>
  
  </div>
									<%
										} else {
									%>
  <label class="label">Username</label>
  
  <div class="control has-icons-left has-icons-right">
									<input onkeyup="nospaces(this)" class="input " name="name" type="text"
										placeholder="Enter Username" maxlength="20" required
										pattern="[A-Z0-9 -]{5,20}"
										title="Please enter at least 5 English letters or numbers. ">
										    <span class="icon is-small is-left">
      <i class="fa fa-user"></i>
    </span>
    </div>
								
										  <label class="label">Password</label>
<div class="control has-icons-left has-icons-right">
									<input onkeyup="nospaces(this)" class="input " name="Password" type="password"
										placeholder="Enter Password" maxlength="20" required
										pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters ">
										    <span class="icon is-small is-left">
<i class="fas fa-key"></i>
    </span>
    </div>


  <label class="label">Personnel</label>
  <div class="control has-icons-left ">

 <input onkeyup="nospaces(this)" class="input" list="browsers" name="browser" required   placeholder="select Personnel">
 			 <span class="icon is-small is-left">
<i class="far fa-id-card"></i>
    </span>  
  <datalist id="browsers">
  
  
  
  
  
								<%
								ListPersonnelDAO SH123 = new ListPersonnelDAO();
	
									ArrayList<ListPersonnelBean> RB123 = new ArrayList<ListPersonnelBean>();
								%>


								<%
									int i2 = 0;
	
									RB123 = SH123.ListTranID();
									for (int i = 0; i < RB123.size(); i++) {
								%>
    
    
    
  
    
          <option value="<%=RB123.get(i).getIdNTT()%>"> <%=RB123.get(i).getFname()%> <%=RB123.get(i).getLname()%> [<%=RB123.get(i).getNameCompany()%>]</option>
    
    
    <%} %>
    
    

    
    
  </datalist>
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
    <span>Confirm to add</span>
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
				<div class="tile is-child box">
				
				
								
<script type="text/javascript">

    function do_this(){

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
				
				
		
				<i class="fas fa-edit fa-1x fa-pull-left fa-border"></i>	<h4 class="title is-4">EDIT & DELETE USER</h4><hr>


		<input  class="button is-small is-info is-outlined" type="button" id="toggle" value="Select All" onClick="do_this()" />
				
					<form action="DeleteUserServlet" method="post" id="form_DeleteUserServlet">
					
					
				<input type="hidden" name="getId_CompanyUserLogin" value="<%=A.getId_Company()%>"> 
					
<input type="hidden" name="getNamePersonal" value="<%=A.getFname()%> <%=A.getLname()%>">
			<input type="hidden" name="NameUserLog" value="<%=A.getUsername()%>">       
				
					
						<input type="hidden" value="<%=A.getStatus()%>" name="IDStatus">
						<table id="example" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>

									<th>USERNAME</th>
										<th>CODE</th>
									    <th>NAME</th>
										<th>COMPANY</th>
										<th>EDIT</th>
								</tr>
							</thead>

							<tbody>




								<%
									AddUserDAO SH = new AddUserDAO();
	
									ArrayList<AddUserBean> RB = new ArrayList<AddUserBean>();
								%>


								<%
									int i2 = 0;
	
									RB = SH.ListUserButAdmin();
									for (int i = 0; i < RB.size(); i++) {
								%>




								<tr>





									<td>
									
									


        <div class="b-checkbox is-danger  is-circular">
        
        
        
        <%if(RB.get(i).getUsername().equals(A.getUsername()) ){%>
        
        
                       <input id="checkbox<%=i%>" name="TranID[]" class="styled" type="checkbox" disabled="disabled"	value="<%=RB.get(i).getIdProfile()%>">
            
            <label for="checkbox<%=i%>">
              <%=RB.get(i).getUsername()%> 
            </label>
            
            
            
        
      <%   }else if (RB.get(i).getStatus() == A.getStatus()){ %>
               <input id="checkbox<%=i%>" name="TranID[]" class="styled" type="checkbox" disabled="disabled"	value="<%=RB.get(i).getIdProfile()%>">
                
            <label for="checkbox<%=i%>">
              <%=RB.get(i).getUsername()%>
            </label>
           <%   }  else{ %>
               <input id="checkbox<%=i%>" name="TranID[]" class="styled" type="checkbox" 	value="<%=RB.get(i).getIdProfile()%>">
                
            <label for="checkbox<%=i%>">
              <%=RB.get(i).getUsername()%>
            </label>
            
            
            
            
           
            
        
           
										
										
										
										
										
										
        </div>


									
									
									
								</td>
								
								
							

 <%} %>
 
 
 

 <td>	<%=RB.get(i).getIdNTT()%></td>
 
 <td> <%=RB.get(i).getFname()%> <%=RB.get(i).getLname()%>  </td>
 
<td>
						
								  	  	
							
								<%=RB.get(i).getNameCompany()%>
								   
										
								</td>
 <td>
 
 







											<a
												onclick="document.getElementById('myBtn222_<%=i%>').style.display='block'"><font
												color="#3498DB "> <span class="icon is-medium"><i class="fas fa-user fa-lg"style="background:#EBF5FB"></i></span></font></a>
															<a 
												onclick="document.getElementById('myBtn223_<%=i%>').style.display='block'"><font
												color="#DC7633 "> <span class="icon is-medium"><i class="fas fa-key fa-lg" style="background:MistyRose"></i></span></font></a>
										
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
    <span>Confirm to delete</span>
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
									AddUserDAO SH22 = new AddUserDAO();
	
									ArrayList<AddUserBean> RB22 = new ArrayList<AddUserBean>();
								%>


								<%
									int i = 0;
	
									RB22 = SH22.ListUserButAdmin();
									for ( i = 0; i < RB22.size(); i++) {
								%>
	<form name="formEditpasswordPer<%=i%>" action="EditPersonalServlet" method="post" id="form_EditPersonal_<%=i%>">
<input type="hidden" name="getId_CompanyUserLogin" value="<%=A.getId_Company()%>"> 
					
<input type="hidden" name="getNamePersonal" value="<%=A.getFname()%> <%=A.getLname()%>">


 <input type="hidden" name="IdProfile" value="<%=RB22.get(i).getIdProfile()%>"> 
  <input type="hidden" name="getId_Company" value="<%=RB22.get(i).getId_Company()%>">   
	 <input type="hidden" name="IdProfile" value="<%=RB22.get(i).getIdProfile()%>"> 
	 
	<input type="hidden" name="NameUserLog" value="<%=A.getUsername()%>" >   
	 
	 <input type="hidden" name="OLD_USERNAME" value="<%=RB22.get(i).getUsername()%>" > 
	
	<div id="myBtn222_<%=i%>"  class="modal">
	
	<br><br><br><br>	<br><br><br><br>
  <div class="modal-background"></div>
  <div class="modal-content">
    <header class="modal-card-head">
      <p class="modal-card-title"> <i class="far fa-edit"></i>EDIT USERNAME
      
      <span class=" tag is-warning is-medium"><%=RB22.get(i).getUsername()%></span>
      </p>
     
      
      	<span
						onclick="document.getElementById('myBtn222_<%=i%>').style.display='none'"
						class="delete" ></span>
						
    </header>
    <section class="modal-card-body">
    
   
    
       
       
       <div class="field">
  <label class="label">Username</label>
  <div class="control has-icons-left has-icons-right">
    <input class="input is-success" onkeyup="nospaces(this)" type="text" name="EditUsername"
								value="<%=RB22.get(i).getUsername()%>" maxlength="20" required pattern="[A-Z0-9 -]{5,20}"
										title="Please enter at least 5 English letters or numbers.">

  
    <span class="icon is-small is-left">
      <i class="fa fa-user"></i>
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
		}
	%>


	<input type="hidden" value="<%=i%>" id="countEditPersonal">




								<%
									AddUserDAO SH23 = new AddUserDAO();
	
									ArrayList<AddUserBean> RB23 = new ArrayList<AddUserBean>();
								%>


								<%
									 i = 0;
	
									RB23 = SH23.ListUserButAdmin();
									for ( i = 0; i < RB23.size(); i++) {
								%>
	<form action="EditPasswordPersonalServlet" method="post" id="form_EditPasswordPersonal_<%=i%>" >
<input type="hidden" name="getId_CompanyUserLogin" value="<%=A.getId_Company()%>"> 
					
<input type="hidden" name="getNamePersonal" value="<%=A.getFname()%> <%=A.getLname()%>">
<input type="hidden" name="getUsername" value="<%=RB23.get(i).getUsername()%>"> 
     <input type="hidden" name="IdProfile" value="<%=RB23.get(i).getIdProfile()%>"> 
	 <input type="hidden" name="NameUserLog" value="<%=A.getUsername()%>" >    
	
	<div id="myBtn223_<%=i%>"  class="modal">
	
	<br><br><br><br>	<br><br>
  <div class="modal-background"></div>
  <div class="modal-content">
    <header class="modal-card-head">
      <p class="modal-card-title"> <i class="far fa-edit"></i>EDIT PASSWORD
      

     
  <span class=" tag is-warning is-medium"><%=RB23.get(i).getUsername()%></span>
  
        </p>
  
  

   
      	<span
						onclick="document.getElementById('myBtn223_<%=i%>').style.display='none'"
						class="delete" ></span>
						
    </header>
    <section class="modal-card-body">
    
  
    
       
       
       <div class="field">
  <label class="label">New Password</label>
  <div class="control has-icons-left has-icons-right">
   <input class="input" onkeyup="nospaces(this)" type="password" name="NewPassword" id="NewPassword<%=i%>" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters "  placeholder="Enter New Password"/>
  
    <span class="icon is-small is-left">
      <i class="fas fa-key"></i>
    </span>
    
  </div>
 
 
</div>
  
    <div class="field">
  <label class="label">New Password again</label>
  <div class="control has-icons-left has-icons-right">
   
      <input class="input" onkeyup="nospaces(this)" type="password" name="NewPasswordagain" id="NewPasswordagain<%=i%>" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters "  placeholder="Enter New Password "/>
      
  
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
		}
	%>


	<input type="hidden" value="<%=i%>" id="countEdit_key">











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