package backEnd;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;

public class QRCodeGenerator {
	
	public void  setQRcode(String Orgin, String Destination,String date) throws IOException, NoSuchAlgorithmException
	{
		
		String name=Orgin;
		String details="Orgin="+Orgin+" Destination="+Destination+" Date="+date;
		ByteArrayOutputStream out=QRCode.from(details).to(ImageType.JPG).stream();
		File f=new File("F:\\Metro Train\\QR_Picture\\"+name+".jpg");
		FileOutputStream fos=new FileOutputStream(f);
		fos.write(out.toByteArray());
		fos.flush();
		fos.close();
	
		
	}
	
}
