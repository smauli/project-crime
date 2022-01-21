<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
<link
rel="stylesheet"
href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
integrity="sha384-50oBHUEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
crossorigin="anonymous"
/>

<link rel="stylesheet" href="CriminalReport.css"/>

<title>CriminalReport</title>
</head>
<body>
<form action="">

<table>
<h1>Criminal Report</h1>
<tr>
<td>Criminal Id </td><td><input type="text" placeholder="Enter Criminal Id" name="criminalid" style="width:170px;"></td>
</tr>
<tr>
<td> Criminal Name</td><td><input type="text" placeholder="Enter Criminal's Name" name="criminalname" style="width:170px;"></td>
</tr>
<tr>
<td>Father's name </td><td><input type="text" placeholder="Enter Father's Name" name="fathername" style="width:170px;"></td>
</tr>
<tr>
<td>Police District </td><td><input type="text" placeholder="Enter Police District " name="policedistrict" style="width:170px;"></td>
</tr>
<tr>
<td> Gender </td><td><input type="text" placeholder="Enter Criminal gender" name="gender" style="width:170px;"></td>
</tr>
<td>Criminal type</td><td><input type="text" placeholder="Enter Criminal type" name="criminaltype" style="width:170px;"></td>
</tr>
<tr>
<td>Police Station</td><td><input type="text" placeholder="Enter police station" name="policestation" style="width:170px;"></td>
</tr>

<td><td><input type="submit" value="SAVE" name="save"> </td></td>
</table>
		</form>
		
<% 
String criminalid = request.getParameter("criminalid");
String criminalname = request.getParameter("criminalname");
String fathername = request.getParameter("fathername");
String policedistrict = request.getParameter("policedistrict");
String gender = request.getParameter("gender");
String criminaltype = request.getParameter("criminaltype");
String policestation = request.getParameter("policestation");

int i;
Scanner sc=new Scanner(System.in);

if(request.getParameter("save")!=null)
{
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
		
		Statement st=con.createStatement();
		//System.out.println("enter reg_name, reg_email, reg_pass");
	//	String reg_name = sc.nextLine();
		//reg_email = sc.nextLine();
		//reg_pass = sc.nextLine();
		
		String query="insert into CriminalReport values('"+criminalid+"','"+criminalname+"','"+fathername+"','"+policedistrict+"','"+gender+"','"+criminaltype+"','"+policestation+"')";
		System.out.println(query);
		i=st.executeUpdate(query);
		if(i>0)
		{
			
			
			System.out.println("your details successfully saved");
		}
		
		
	    
		}
	catch(Exception e){}
	}


%>		
</body>
</html>
