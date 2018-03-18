<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<script language="javascript">
function fncSubmit()
{

	if(document.form1.txtUsername.value == "")
	{
		alert('Please input Username');
		document.form1.txtUsername.focus();
		return false;
	}	

	if(document.form1.txtPassword.value == "")
	{
		alert('Please input Password');
		document.form1.txtPassword.focus();		
		return false;
	}	

	if(document.form1.txtConPassword.value == "")
	{
		alert('Please input Confirm Password');
		document.form1.txtConPassword.focus();		
		return false;
	}	

	if(document.form1.txtPassword.value != document.form1.txtConPassword.value)
	{
		alert('Confirm Password Not Match');
		document.form1.txtConPassword.focus();		
		return false;
	}	

	if(document.form1.txtName.value == "")
	{
		alert('Please input Name');
		document.form1.txtName.focus();		
		return false;
	}	

	document.form1.submit();
}
</script>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<form name="form1" method="post" action="save_register.php" OnSubmit="return fncSubmit();">
  Register Form <br>
  <table width="400" border="1" style="width: 400px">
    <tbody>
      <tr>
        <td width="125"> &nbsp;Username</td>
        <td width="180">
          <input  type="text" id="txtUsername" size="20">
        </td>
      </tr>
      <tr>
        <td> &nbsp;Password</td>
        <td><input name="txtPassword" type="password" id="txtPassword">
        </td>
      </tr>
      <tr>
        <td> &nbsp;Confirm Password</td>
        <td><input name="txtConPassword" type="password" id="txtConPassword">
        </td>
      </tr>
      <tr>
        <td>&nbsp;Name</td>
        <td><input name="txtName" type="text" id="txtName" size="35"></td>
      </tr>
      <tr>
        <td> &nbsp;Status</td>
        <td>
          <select name="ddlStatus" id="ddlStatus">
            <option value="ADMIN">ADMIN</option>
            <option value="USER">USER</option>
          </select>
</td>
      </tr>
    </tbody>
  </table>
  <br>
  <input type="submit" name="Submit" value="Save">
</form>

</body>
</html>