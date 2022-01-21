

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateInfo
 */
@WebServlet("/updateInfo")
public class UpdateInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in updateInfo");
		String complainid = request.getParameter("cid");
		String status = request.getParameter("status");
		String to=request.getParameter("email");

		int i;

		if(request.getParameter("abc")!=null)
		{

			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
		        System.out.println("hello");
				Statement sta=con.createStatement();
				//System.out.println("enter reg_name, reg_email, reg_pass");
			  //String reg_name = sc.nextLine();
				//reg_email = sc.nextLine();
				//reg_pass = sc.nextLine();
				
						String query="update CrimeDetail4 set status='"+status+"' WHERE complainid='"+complainid+"'";
						System.out.println(query);
				i=sta.executeUpdate(query);
				Mailer.sendMail(to);
		        //i=executeUpdate(query);
		       
		    	 
		        if(i>0)
			   
				{
		        
		        	
		       
		        	
		        System.out.println("your details successfully update");
		        RequestDispatcher rd=request.getRequestDispatcher("policefetchcd.jsp");
		        rd.forward(request, response);
				}
		    	   
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
	}

}
