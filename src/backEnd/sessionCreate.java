package backEnd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class sessionCreate {
    
	
	
	public void setSession(HttpServletRequest request,String userID)
	{
		HttpSession session=request.getSession();
		session.setAttribute("user_ID", userID);
	}
	public static void sessionInvalidate(HttpServletRequest request,HttpServletResponse response)
	{
		
		HttpSession session=request.getSession();
		//response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		//response.setHeader("Pragma", "no-cache");
		//response.setHeader("Expires", "0");
		session.removeAttribute("user_ID");
		session.invalidate();
	}
	
	public String checkSession(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		if (session.getAttribute("user_ID")==null)
		{
			dispector dr=new dispector();
			dr.requestDispectorForward( request,response ,"index.html");
			return null;
		}
		else
		{
			return  (String) session.getAttribute("user_ID");
		}
		
	}
	
	
}
