package AdvanceTesting;

import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertNotEquals;

import java.util.Date;
import java.util.Properties;
import java.util.regex.Pattern;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import com.teamJava4.Entity.User;
import com.teamJava4.Implementations.UserDAOIpl;

public class ForgotPasswordTest {
private UserDAOIpl userDAO = new UserDAOIpl();
	
	
	@BeforeTest
	public void welcomeToLogin() {
		System.out.println("====> Welcome to anime world!<====");
		System.out.println("============= Begin Forgot password==============");
	}
	
	
	private boolean doPostForget(User u) {
		String regexPattern = "^(.+)@(\\S+)$";
		if(!this.patternMatches(u.getEmail(), regexPattern)) {
			return false;
		}

		User user1 = userDAO.findByEmail(u);
		if (user1 == null) {
			return false;
		} else {
			user1.setPasswords("123456");
			sendEmail(user1);
			userDAO.update(user1);
			return true;
		}

	}
	private void sendEmail(User user) {
		String emailTo = user.getEmail();
		String subject = "Reset password from ANIME WEB";
		String content = "Hello " + user.getCustomer_name() + "\n Your new password is: 123456";

		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.setProperty("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.starttls.port", "587");
		properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		final String fromEmail = "kieuanhvan439999@gmail.com";
		// Mat khai email cua ban
		final String password = "uzvfdzhhcszshnel";
		Session session = Session.getInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		});
		MimeMessage msg = new MimeMessage(session);
		// set message headers
		try {
			msg.setFrom(new InternetAddress(fromEmail));
			msg.setSubject(subject, "UTF-8");
			msg.setText(content, "UTF-8");
			msg.setSentDate(new Date());
			msg.setRecipients(Message.RecipientType.TO, emailTo);
			msg.setReplyTo(msg.getFrom());
			Transport.send(msg);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public  boolean patternMatches(String emailAddress, String regexPattern) {
	    return Pattern.compile(regexPattern)
	      .matcher(emailAddress)
	      .matches();
	}
	
	

	@Test
	public void case_forgot_1() {
		String email = "kieuanhvan6@gmail.com";
		User u = new User();
		u.setEmail(email);
		assertEquals(true, this.doPostForget(u));
	}
	@Parameters( {"email"} )
	@Test
	public void case_forgot_2(String email) {
		User u = new User();
		u.setEmail(email);
		assertNotEquals(true, this.doPostForget(u));
	}
	
	@Test
	public void case_forgot_3() {
		String email = "kieuanhvan666666@gmail.com";
		User u = new User();
		u.setEmail(email);
		assertNotEquals(true, this.doPostForget(u));
	}
	
	
	
	@AfterTest
	public void farewell() {
		System.out.println("====> See you next time!<====");
		System.out.println("============= End Forgot password==============");
	}
	
}
