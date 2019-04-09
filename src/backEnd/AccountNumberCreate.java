package backEnd;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
public class AccountNumberCreate {

	
	public static String CreateID() throws NoSuchAlgorithmException 
	{
		 SecureRandom prng = SecureRandom.getInstance("SHA1PRNG");
	      long randomNum = Integer.valueOf(prng.nextInt());
	      if(randomNum<0)
	    	  randomNum=randomNum*(-1);
	      String id="000602";
	      return id=id+String.valueOf(randomNum);
	}
	
}
