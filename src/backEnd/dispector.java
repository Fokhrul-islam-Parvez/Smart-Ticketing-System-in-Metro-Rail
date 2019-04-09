package backEnd;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dispector {

	
public void requestDispectorInclude(HttpServletRequest request, HttpServletResponse response ,String url) {
		
		RequestDispatcher rd=request.getRequestDispatcher(url);  
        try {
			try {
				rd.include(request, response);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		} catch (ServletException e) {
			
			e.printStackTrace();
		}  
	}

public void requestDispectorForward(HttpServletRequest request, HttpServletResponse response ,String url) {
	
	RequestDispatcher rd=request.getRequestDispatcher(url);  
    try {
		try {
			rd.forward(request, response);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	} catch (ServletException e) {
		
		e.printStackTrace();
	}  
}



}
