<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>criminalfetch</title>
</head>
<body>
<center>
<table border="1">
<tr style="background-color: black; color: white; font-weight: bold;">
<td>Criminal Id </td>
<td>Criminal Name</td>
<td>Father's name </td>
<td>Police District </td>
<td>Gender </td>
<td>Criminal type</td>
<td>Police Station</td>

	
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
    	 
    	 String query="select * from CriminalReport";
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
    		
   
                    
		
</tr>
  
<% 
    	 }
    	 
     }
     
    
    catch(Exception ex){
        }
    
 %>

</table>
</center> 

</body>
</html>