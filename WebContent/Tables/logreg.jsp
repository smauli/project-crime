<%@page import="javax.websocket.SendResult"%>
<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Scanner"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="log.css"/>
<title>User SignIn/Up</title>
</head>
<body>
<h2>Sign in/up Form</h2>
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="#">
			<h1>Create Account</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>or use your email for registration</span>
			<input type="text" placeholder="Name" name="name"  pattern="[A-Za-z]{1,32}" title="Please enter the valid name " required/>
			<input type="email" placeholder="Email"  name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Please enter the valid email " required/>
			<input type="password" placeholder="Password" name="pass" pattern ="(?=.*\d)(?=.*[A-Z])(?=.*[a-z]).{8,}"title="Please enter the valid password " required/>
			<button name="signup">Sign Up</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="#">
			<h1>Sign in</h1>
			<div class="social-container">
				<div class="icon">
				<i class="fa fa-facebook"></i>
				</div>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>or use your account</span>
			<input type="email" placeholder="Email" name="semail" />
			<input type="password" placeholder="Password"  name="spass"/>
			<a href="#">Forgot your password?</a>
			<button name="signin">Sign In</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Already Have an Account!</h1>
				<p>Simply login to your account by clicking the login button</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Din't Have an Account!</h1>
				<p>Simply Create your account by clicking the Signup Button</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>
<script src="log.js"></script>

<%
String name= request.getParameter("name");
String email= request.getParameter("email");
String password= request.getParameter("pass");
int i;
Scanner sc=new Scanner(System.in);
	
if(request.getParameter("signup")!=null)
{
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
		
		Statement st=con.createStatement();
		//System.out.println("enter reg_name, reg_email, reg_pass");
	//	String reg_name = sc.nextLine();
		//reg_email = sc.nextLine();
		//reg_pass = sc.nextLine();
		
		String query="insert into register values('"+name+"','"+email+"','"+password+"')";
		
		i=st.executeUpdate(query);
		if(i>0)
		{
			
			
			System.out.println("registration successfully");
		}
		}
	catch(Exception e){}
	}
	
%>
	
<%
String semail=request.getParameter("semail");
String spassword=request.getParameter("spass");

if(request.getParameter("signin")!=null)
{
	
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
		Statement st=con.createStatement();
		
		String Query="select * from register where email='"+semail+"' AND password='"+spassword+"' ";
		System.out.println(Query);
		ResultSet rs = st.executeQuery(Query);
		while(rs.next())
		{	password=rs.getString(3);
			email=rs.getString(2);
		
			System.out.println(""+email+" "+password);
		}
		if(semail.equals(email) && spassword.equals(password))
		{
	    System.out.println("Login successful");
	    
	    
		//<jsp:forward page="CrimeDetails.jsp"></jsp:forward>
		response.sendRedirect("CrimeDetails.jsp");
	    }
		else 
		{
		out.println("<script>alert('not successful')</script>");
	    }
		} catch (Exception e) {
		
	}

	
}
%>


<footer>
	<p>
		
	</p>
</footer>

</body>
</html>