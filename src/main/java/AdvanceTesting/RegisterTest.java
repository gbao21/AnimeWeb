package AdvanceTesting;

import static org.testng.Assert.assertEquals;

import java.util.regex.Pattern;

import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import com.teamJava4.Entity.User;
import com.teamJava4.Implementations.UserDAOIpl;

public class RegisterTest {
private UserDAOIpl userDAO = new UserDAOIpl();
	
	
	@BeforeTest
	public void welcomeToRegister() {
		System.out.println("====> Welcome to anime world!<====");
		System.out.println("============= Begin Register==============");
	}
	
	

	@Test
	public void case_Register_1() {
		long time = System.currentTimeMillis();
		String email = "teo@example.com"+time;
		String password = "password123";
		String username = "teoga588" ;
	
		User u = new User();
		u.setEmail(email);
		u.setPasswords(password);
		u.setCustomer_name(username);
		u.setIsActive(true);
		u.setIsAdmin(false);
		boolean isRegister = doPostSignUp(u);
		assertEquals(true, isRegister);
	}
	
	@Parameters( {"email","password","username"} )
	@Test
	public void case_Register_2(String email , String password , String username) {

		User u = new User();
		u.setEmail(email);
		u.setPasswords(password);
		u.setCustomer_name(username);
		u.setIsActive(true);
		u.setIsAdmin(false);
		boolean isRegister = doPostSignUp(u);
		assertEquals(false, isRegister);
	}
	
	
	@Test
	public void case_Register_3() {
		String email = "teo3@example.com";
		String password = "123";
		String username = "teoga588";
		User u = new User();
		u.setEmail(email);
		u.setPasswords(password);
		u.setCustomer_name(username);
		u.setIsActive(true);
		u.setIsAdmin(false);
		boolean isRegister = doPostSignUp(u);
		assertEquals(false, isRegister);
	}
	
	
	@Test
	public void case_Register_4() {
		String email = "teo3example.com";
		String password = "123";
		String username = "teoga588";
		User u = new User();
		u.setEmail(email);
		u.setPasswords(password);
		u.setCustomer_name(username);
		u.setIsActive(true);
		u.setIsAdmin(false);
		boolean isRegister = doPostSignUp(u);
		assertEquals(false, isRegister);
	}
	
	
	

	private boolean doPostSignUp(User u) {
		String regexPattern = "^(.+)@(\\S+)$";
		if(u.getCustomer_name().length() < 5) {
			return false;
		}else if(u.getPasswords().length() < 5) {
			return false;
		}else if(!this.patternMatches(u.getEmail(), regexPattern)) {
			return false;
		}
		
		
		User user = userDAO.findByEmail(u);
		if (user == null) {
			if (userDAO.create(u)) {
				return true;
			} 
		} 
		return false;

	}
	public  boolean patternMatches(String emailAddress, String regexPattern) {
	    return Pattern.compile(regexPattern)
	      .matcher(emailAddress)
	      .matches();
	}
	
	
	@AfterTest
	public void farewell() {
		System.out.println("====> See you next time!<====");
		System.out.println("============= End Register==============");
	}
}
