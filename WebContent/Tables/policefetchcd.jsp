
<%@page import="java.sql.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Police Report</title>
</head>
<body>

<center>
<table border="1">
<tbody>
<c:forEach>
<tr style="background-color: black; color: white; font-weight: bold;">
<td>Complain Id</td>
<td>Name</td>
<td>Email</td>
<td>Mobile Number</td>
<td>Address</td>
<td>Complain Type</td>
<td>Complain Description</td>
<td>Time of Crime</td>
<td>Date of Crime</td>
<td>Crime Location</td>
<td>status</td>
	
</tr>

<%   



     Connection conn=null;
     Statement st=null;
     ResultSet rs=null;
     try
     {
    	 
    	 
    	 Class.forName("com.mysql.jdbc.Driver");
    	 conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
    	 st=conn.createStatement();
    	 
    	 String query="select * from CrimeDetail2";
    	 rs=st.executeQuery(query);
    	 while(rs.next())
    	 {
        %>
    		<tr>
    		<td><%=rs.getString(1) %></td>
    		<td><%=rs.getString(2) %></td>
    		<td><%=rs.getString(3) %></td>
    		<td><%=rs.getString(4) %></td>
    		<td><%=rs.getString(5) %></td>
    		<td><%=rs.getString(6) %></td>
    		<td><%=rs.getString(7) %></td>
    		<td><%=rs.getString(8) %></td>
    		<td><%=rs.getString(9) %></td>
    		<td><%=rs.getString(10) %></td>
   
                    <td>
                    <form action='updateInfo'>
                    <select name="status" style="width:370px;">
							<option value="">--select--</option>
							<option value="inprocess">inprocess </option>
							<option value="pending">pending</option>
							<option value="solve">solve</option>
						</select>
						<input type="hidden" name="email" value="<%=rs.getString(3) %>" />
						<input type="hidden" name="cid" value="<%=rs.getString(1) %>" />
						<input type="submit" value="update" name ="abc"  />
						<!-- <a href="email.java"></a>  -->
                    </form>
                        
					</td>
		
</tr>
  
<% 
    	 }
    	 
     }
     
    
    catch(Exception ex){
        }
    
 %>

</c:forEach>
</tbody>
</table>
</center> 

<%
/* String complainid = request.getParameter("cid");
String status = request.getParameter("status");


int i;

if(request.getParameter("abc")!=null)
{

	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
        System.out.println("hello");
		Statement sta=con.createStatement();
		//System.out.println("enter reg_name, reg_email, reg_pass");
	  //String reg_name = sc.nextLine();
		//reg_email = sc.nextLine();
		//reg_pass = sc.nextLine();
		
				String query="update CrimeDetail3 set status='"+status+"' WHERE complainid='"+complainid+"'";
				System.out.println(query);
		i=sta.executeUpdate(query);
        //i=executeUpdate(query);
       
    	 
        if(i>0)
	   
		{
        
        	
       
        	
        System.out.println("your details successfully update");
		}
    	   
	}
	catch(Exception e){
		e.printStackTrace();
	}
} */


%> 


</body>
</html>