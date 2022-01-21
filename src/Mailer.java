

import java.nio.channels.SeekableByteChannel;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Mailer {

	public static void sendMail(String to) {
		// TODO Auto-generated method stub
// Sender's email ID needs to be mentioned

		final String username="ritikanunia2001@gmail.com";
		final String password="333333333";
		String subject="Welcome user";
		String msg="your status is update";
		// Get system properties
		
		Properties props=new Properties();
		props.put("mail.smtp.host","smtp.gmail.com");
		props.put("mail.smtp.auth","true");
		props.put("mail.debug","true");
// Setup mail server

		props.put("mail.smtp.port","465");
		props.put("mail.smtp.socketFactory.port","465");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback","false");
		
// Get the default Session object.
		Session session = Session.getInstance(props, new Authenticator() {
				@Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("ritikanunia2001@gmail.com", "333333");
            }	
		});
		try{
// Create a default MimeMessage object.

			Message ms=new MimeMessage(session);
			ms.setFrom(new InternetAddress(username));
// Set From: header field of the header and set the actual message

	ms.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			ms.setSubject(subject);
			ms.setText(msg);
			Transport.send(ms);
			System.out.println("Message Successfully sent");
			
		}catch(Exception e){
			//result="Could not be send";
			System.out.println("Message Not sent");
		}
	}
}
