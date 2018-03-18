
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="Bean.AddProfileBean"%>
<%@page import="Bean.AddUserBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.AddUserDAO"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>


    <link rel="stylesheet" href="css/radio_New.css">
    
    
    
    
<link rel="stylesheet" type="text/css" href="css/w3.css">

<link rel="stylesheet" type="text/css" href="fonts/Mat_font.css">
<link rel="stylesheet" type="text/css" href="css/bulma.css">
<link rel="stylesheet" type="text/css" href="css/bulma.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="fonts/fontawesome-webfont.woff2">
<link rel="stylesheet" href="dist/sweetalert.css">


<script src="js/jquery-1.12.4.js">					</script>
<script src="js/jquery.dataTables.min.js">			</script>
<script src="dist/sweetalert-dev.js">				</script>



<script>

$(document).ready(function(){
	

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
	
					swal('', 'User duplicate !', 'error')
	
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
	
					swal('', 'Error Level ', 'error')
	
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
		

	<section class="hero  is-primary is-bold">
	<div class="hero-body">


  <nav class="level">
  <!-- Left side -->
  <div class="level-left">
      
   <img src="img/ntt2.png" width="130px">
    
		</div>
		
		
		 <div class="level-right">
 
<p class="level-item">	<font color="#FFFFF"><B>USER : <%=A.getUsername()%></B></font></p>
<p class="level-item">  <form action="UserLogoutServlet" method="post" id="from2">


 <button type="submit" class="button is-danger">Logout</button>



 </form> </p>

  </div>
</nav>

	</div>
	</section>


	<br>
	<div class="container ">





		<div class="tile is-ancestor">


			<div class="tile is-2 is-vertical is-parent">
				<div class="tile is-child box">

					<aside class="menu">

					<ul class="menu-list">

						<li><a class="is-active">Menu</a>
							<ul>
							
							
   <%if (A.getStatus() == 1){%>
								<li><a class="active" href="AddTranID.jsp"><i
										class="fa fa-key" aria-hidden="true"></i> TranID</a></li>

        

  <li><a  href="USER_S1.jsp"><i class="fa fa-key" aria-hidden="true"></i> User</a></li>


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
								<li><a href="ToText.jsp"><i class="fa fa-file-text"
										aria-hidden="true"></i> To File</a></li>
							</ul></li>

					</ul>

					</aside>
				</div>

			</div>
			
			<div class="tile is-vertical is-parent">
				<div class="tile is-child box">
					<p class="title is-4">Add User</p>


					<form action="AddUserServlet" method="post">
								<input type="hidden" value="<%=A.getUsername()%>" name="getUsername">	
					<input type="hidden" value="<%=A.getStatus()%>" name="IDStatus">
					
						<div class="field">

							<p class="control">
							<div class="columns">
								<div class="column is-1">
									<span class="icon is-large"> <i class="fa fa-user"
										aria-hidden="true"></i>


									</span>

								</div>
								<div class="column is-one-third">





									<%
										String name_ERROR = (String) request.getAttribute("name_ERROR");
									%>

									<%
										if (request.getAttribute("name_ERROR") != null) {
									%>

									<input class="input " value="<%=name_ERROR%>" name="name"
										type="text" placeholder="Enter Username" maxlength="20"
										required pattern="[A-Z0-9 -]{5,20}"
										title="Please enter at least 5 English letters or numbers.">


									<%
										} else {
									%>

									<input class="input " name="name" type="text"
										placeholder="Enter Username" maxlength="20" required
										pattern="[A-Z0-9 -]{5,20}"
										title="Please enter at least 5 English letters or numbers. ">


									<%
										}
									%>
<br><br>
<div class="box">
<span class="tag is-rounded is-light is-medium">sucurity to use</span>

<br><br>
  <div class="field">
   <input class="is-radio " id="exampleRadio3" type="radio" name="LevelUser" value="3" >
  <label for="exampleRadio3">Level 3</label>
</div>

<div class="field">
  <input class="is-radio is-success" id="exampleRadio4" type="radio" name="LevelUser" value="4"  checked >
  <label for="exampleRadio4">Level 4</label>
  
  
  
  
</div>

</div>

								</div>
							</div>




							<div class="block">


								<button type="submit" class="button is-success">Confirm To Add</button>

								<button type="reset" class="button is-danger">Reset</button>




							</div>

						</div>


					</form>
				</div>
				<div class="tile is-child box">
					<h4 class="title is-4">Edit & Delete USER</h4>





					<script type="text/javascript">
						$(document).ready(function() {
							$('#example').DataTable({
								scrollY : '75vh',
								scrollCollapse : true,
								paging : false
							});
						});
					</script>

					<form action="DeleteUserServlet" method="post">
						<input type="hidden" value="<%=A.getStatus()%>" name="IDStatus">
						<table id="example" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>

									<th>User Name</th>
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
	
									RB = SH.ListUser();
									for (int i = 0; i < RB.size(); i++) {
								%>




								<tr>





									<td>
									
									


        <div class="b-checkbox is-danger  is-circular">
        
        
        
        <%if(RB.get(i).getUsername().equals(A.getUsername()) ){%>
        
        
                       <input id="checkbox<%=i%>" name="TranID[]" class="styled" type="checkbox" disabled="disabled"	value="<%=RB.get(i).getIdProfile()%>">
            
            <label for="checkbox<%=i%>">
              <%=RB.get(i).getUsername()%> (Your UserName)
            </label>
            
            
            
        
      <%   }else if(RB.get(i).getStatus() ==  1 || RB.get(i).getStatus() ==  2 ){ %>
               <input id="checkbox<%=i%>" name="TranID[]" class="styled" type="checkbox" disabled="disabled"	value="<%=RB.get(i).getIdProfile()%>">
                
            <label for="checkbox<%=i%>">
              <%=RB.get(i).getUsername()%>
            </label>
            
            
            
            
               <%   }else{ %>
               <input id="checkbox<%=i%>" name="TranID[]" class="styled" type="checkbox" 	value="<%=RB.get(i).getIdProfile()%>">
                
            <label for="checkbox<%=i%>">
              <%=RB.get(i).getUsername()%>
            </label>
            
            
            
           
            
        
           
										
										
										
										
										
										
        </div>


									
									
									
								</td>

 <%} %>
									<td>





										<center>

<%if( RB.get(i).getStatus() <= A.getStatus() ){  %>

	<a
												onclick="document.getElementById('myBtn2_<%=i%>').style.display='block'"><font
												color="red"> <span class="icon is-medium"><i
														class="fa fa-ban" aria-hidden="true"></i></span></font></a><span class="tag is-rounded  is-light"><%=RB.get(i).getStatus()%></span>
														
														
<%} else{%>
					<a
												onclick="document.getElementById('myBtn2_<%=i%>').style.display='block'"><font
												color="#2ECC71"> <span class="icon is-medium"><i
														class="fa fa-pencil-square" aria-hidden="true"></i></span></font></a><span class="tag is-rounded  is-light"><%=RB.get(i).getStatus()%></span>
																				
														
			<%} %>											
										
														
														
														
										</center>
									</td>


								</tr>



								<%
									}
								%>





							</tbody>
						</table>





						<br>


						<button type="submit" class="button is-success">Confirm
							To Delete</button>

						<button type="reset" class="button is-danger">Reset</button>


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
									AddUserDAO SH2 = new AddUserDAO();
	
									ArrayList<AddUserBean> RB2 = new ArrayList<AddUserBean>();
								%>


								<%
								
	
									RB2 = SH2.ListUser();
									for (int i = 0; i < RB2.size(); i++) {
								%>

		    
        <%if(RB2.get(i).getUsername().equals(A.getUsername()) ){%>
        
          <%   }else if(RB2.get(i).getStatus() <= A.getStatus()  ) { %>
            
            
        
      <%   }else{ %>
          
	<form action="EditUserServlet" method="post">
<input type="hidden" value="<%=A.getStatus()%>" name="IDStatus">
		<div id="myBtn2_<%=i%>" class="w3-modal">
			<br> <br> <br>
			<div class="w3-modal-content">
				<div class="w3-container">
					<span
						onclick="document.getElementById('myBtn2_<%=i%>').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>

					<center>




						<input type="hidden" name="IdProfile"
							value="<%=RB2.get(i).getIdProfile()%>"> <br> <span
							class="icon is-large"> <i class="fa fa-pencil"></i><%=RB2.get(i).getUsername()%></span> 
						<br> Enter edit Level
						<div class="column is-one-quarter">
						
						
      

<%if (RB2.get(i).getStatus() == 3){ %>

  
    <div class="field">
   <input class="is-radio " id="exampleRadio33<%=i%>" type="radio" name="LevelUser" value="3" checked >
  <label for="exampleRadio33<%=i%>">Level 3</label>
</div>
  
  <div class="field">
  <input class="is-radio is-success" id="exampleRadio44<%=i%>" type="radio" name="LevelUser" value="4"   >
  <label for="exampleRadio44<%=i%>">Level 4</label>
  
</div>

<%}else if(RB2.get(i).getStatus() == 4){ %>

    <div class="field">
   <input class="is-radio " id="exampleRadio33<%=i%>" type="radio" name="LevelUser" value="3">
  <label for="exampleRadio33<%=i%>">Level 3</label>
</div>
  
  <div class="field">
  <input class="is-radio is-success" id="exampleRadio44<%=i%>" type="radio" name="LevelUser" value="4" checked  >
  <label for="exampleRadio44<%=i%>">Level 4</label>
  
</div>
			
       <%} %>   
            
            
            
     
            
        
           							
						
							
										
										
										
										
										
										
										
										
						</div>





						<button type="submit" class="button is-success">Confirm
							To Edit</button>

						<button type="reset" class="button is-danger">Reset</button>
						<br> <br> <br>



					</center>


				</div>

			</div>
		</div>



	</form>

	<%
		}
	%>
       <%} %>

<%
}%>




	<!--  -----------------------------   footer  - ------------------------------ -->

</body>

<script type="text/javascript" src="js/materialize.min.js"></script>
</html>