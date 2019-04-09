package backEnd;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateAndTime {

	public String getDate()
	{
			SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			Date date=new Date();
			return sdf.format(date);
	}
}
