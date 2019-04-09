package backEnd;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class alert
 */
@WebServlet("/alert")
public class alert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter(); 
		 /*out.println("bangladesh");
		 out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>");
		 out.println(" <script src=\"https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.js\"></script>");
		 out.println("<script>");
		 out.println("$(document).ready(function(){");
		 out.println("  swal(  "); 
		 out.println("  'Good job!',");
		 out.println("  'You clicked the button!', " );
		 out.println("  'success' ");
		 out.println(")");
		 out.println("});");
		 out.println("</script>");*/
		 out.println("<script type=\"text/javascript\">");
		   out.println("alert('User or password incorrect');");
		   //out.println("location='index.jsp';");
		   out.println("</script>");
		  out.println("<meta http-equiv='refresh' content='3;URL=index.jsp'>");//redirects after 3 seconds
		   out.println("<p style='color:red;'>User or password incorrect!</p>");
		   
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
