package backEnd;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class CheckEmailAndPassword {

	public int checkEmail(ResultSet rs , String UserEmail)
	{
		 try {
			 while(rs.next())
				{
				   String email;
					email = rs.getString(2);
					if(email.equals(UserEmail))
					{
						
						return 1;
					}
					
				}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		 return 0;
	}
	public int checkPassword(ResultSet rs , String UserPass,HttpServletRequest request)
	{
		 try {
				
					
					   String password;
					
					   password = rs.getString(3);
						if(UserPass.equals(password))
						{
							sessionCreate sc=new sessionCreate();
							sc.setSession(request,rs.getString(1));
							return 1;
						}
						
					
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			 return 0;
	}
}
