<%@page import="javax.websocket.SendResult"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-us">
<head>;
<meta charset="ISO-8859-1">



<link rel="stylesheet" href="crimedetails.css"/>
<title>Insert title here</title>
</head>

<body>


<form action="">
<h1>Crime Report</h1>
<div class="container" id="container">		

			<table>


<tr>
<td>Complain Id </td><td><input type="text" placeholder="Enter Complain Id" name="cid" style="width:170px;" required/></td>
</tr>
<tr>
<td>Name</td><td><input type="text" placeholder="Enter Complainant's Name" name="name" style="width:170px;" pattern="[A-Za-z]{1,32}" title="Please enter the valid name " required/></td>
</tr>
<tr>
<td>Email </td><td><input type="text" placeholder="Enter Complainant's Email" name="email" style="width:170px;" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Please enter the valid email " required/></td>
</tr>
<tr>
<td>Mobile Number </td><td><input type="text" placeholder="Enter Complainant's Mobile Number"  id="mobilenumber" name="mobilenumber" style="width:170px;" pattern=[7-9]{1}[0-9]{9} required title="Please enter the valid contact no "required/>

</td>
</tr>
<tr>
<td> Address </td><td><input type="text" placeholder="Enter Complainant's Address" name="address" style="width:170px;" required/></td>
</tr>
<tr>
<td>Complain Type</td>
                    <td>
                        <select name="complaintype" style="width:200px;" >
						<option value="">Select Crime Type</option>
						<option value="Antisocial behaviour">Antisocial behaviour</option>
						<option value="Arson">Arson</option>
						<option value="Burglary">Burglary</option>
						<option value="Childhood abuse">Childhood abuse</option>
						<option value="Crime abroad">Crime abroad</option>
						<option value="Cyber crime">Cyber crime</option>
						<option value="Domestic abuse">Domestic abuse</option>
						<option value="Fraud">Fraud</option>
						<option value="Hate Crime">Hate Crime</option>
						<option value="Modern Slavery">Modern Slavery</option>
						<option value="Murder or manslaughter">Murder or manslaughter</option>
						<option value="Rape and sexual assault">Rape and sexual assault</option>
						<option value="Robbery">Robbery</option>
						<option value="Stalking and harassment">Stalking and harassment</option>
						<option value="Terrorism">Terrorism</option>
						<option value="Violent crime">Violent crime</option>
						<option value="Other">Other</option>
						</select>
</td>
</tr>
<tr>
<td>Complain Description</td><td><input type="text" placeholder="Enter Complain Description" name="cdes" style="width:170px;" required/></td>
</tr>
<tr>
<td>Time of Crime</td><td><input type="time" placeholder="Enter crime time" name="ctime" style="width:170px;" required/></td>
</tr>
<tr>
<td>Date of Crime</td><td><input type="date" placeholder="Enter Crime date" name="cdate" min="2015-01-01" max="2019-07-21" style="width:170px;" required/></td>
</tr>
<tr>
<td>Crime Location</td><td><input type="text" placeholder="Enter Crime location" name="cloc" style="width:170px;" required/></td>
</tr>
<td><td><input type="submit" value="ADD" name="save"> </td></td>
<td><td><input type="submit" value="update" name="update"> </td></td>


</table>
		</form>
	
<% 
String complainid = request.getParameter("cid");
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobilenumber = request.getParameter("mobilenumber");
String address = request.getParameter("address");
String complaintype = request.getParameter("complaintype");
String complaindescription = request.getParameter("cdes");
String crimetime = request.getParameter("ctime");
String crimedate = request.getParameter("cdate");
String crimelocation = request.getParameter("cloc");
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
		
		String query="insert into CrimeDetail4 (complainid, name, email, mobilenumber, address, complaintype, complaindescription, crimetime, crimedate, crimelocation) values('"+complainid+"','"+name+"','"+email+"','"+mobilenumber+"','"+address+"','"+complaintype+"','"+complaindescription+"','"+crimetime+"','"+crimedate+"','"+crimelocation+"')";
		System.out.println(query);
		i=st.executeUpdate(query);
		if(i>0)
		{
			
			
			System.out.println("your details successfully save");
			
		}
				
	    
	}
	catch(Exception e){}
	}


%>
<% 
String complainid1=request.getParameter("cid");
String name1 = request.getParameter("name");
String email1 = request.getParameter("email");
String mobilenumber1 = request.getParameter("mobilenumber");
String address1 = request.getParameter("address");
String complaintype1 = request.getParameter("complaintype");
String complaindescription1 = request.getParameter("cdes");
String crimetime1 = request.getParameter("ctime");
String crimedate1 = request.getParameter("cdate");
String crimelocation1 = request.getParameter("cloc");

if(request.getParameter("update")!=null)
{
	
	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
		
		Statement st=con.createStatement();
		//System.out.println("enter reg_name, reg_email, reg_pass");
	  //String reg_name = sc.nextLine();
		//reg_email = sc.nextLine();
		//reg_pass = sc.nextLine();
		
		String query="update CrimeDetail4 set complainid='"+complainid1+"',name='"+name+"',email='"+email1+"',mobilenumber='"+mobilenumber1+"',address='"+address1+"', complaintype='"+complaintype1+"', complaindescription='"+complaindescription1+"', crimetime='"+crimetime1+"', crimedate='"+crimedate1+"', crimelocation='"+crimelocation1+"'  where complainid='"+complainid+"'";		
		System.out.println(query);
		i=st.executeUpdate(query);
		System.out.println("ghjk");
		System.out.print(i);
		if(i>0)
        {
		   out.println("your details successfully update");
	}
	}
	catch(Exception e){
		e.printStackTrace();
	}
		
	}
		
%>
<%
//String complainid2 = request.getParameter("cid");
//String complaintype2 = request.getParameter("ctype");
//String complaindescription2 = request.getParameter("cdes");
//String crimetime2 = request.getParameter("ctime");
//String crimedate2 = request.getParameter("cdate");
//String crimelocation2 = request.getParameter("cloc");


//if(request.getParameter("select")!=null)
//try {
   	//Class.forName("com.mysql.jdbc.Driver");
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
	//Statement st=con.createStatement();
	//String Query = "select * from CrimeDetails ";
    //int i = st.executeQuery(Query);
    
    
//}

//catch(Exception e)
//{
	//e.printStackTrace();
//}
//%>
 

	

</body>
</html>