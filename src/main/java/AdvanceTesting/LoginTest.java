package AdvanceTesting;

import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertNotEquals;

import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.teamJava4.Entity.User;
import com.teamJava4.Implementations.UserDAOIpl;

public class LoginTest {
	private UserDAOIpl userDAO = new UserDAOIpl();
	
	
	@BeforeTest
	public void welcomeToLogin() {
		System.out.println("====> Welcome to anime world!<====");
		System.out.println("============= Begin Login==============");
	}
	
	

	@Test
	public void case_login_1() {
		String username = "johndoe@example.com";
		String password = "password123";
		User u = new User();
		u.setEmail(username);
		u.setPasswords(password);
		assertNotEquals(null, userDAO.login(u));
	}
	
	
	@Test
	public void case_login_2() {
		String username = "johndoe@example.com1";
		String password = "password1231";
		User u = new User();
		u.setEmail(username);
		u.setPasswords(password);
		assertEquals(null, userDAO.login(u));
	}
	
	
	@Test
	public void case_login_3() {
		String username = "johndoe@example.com11";
		String password = "password123";
		User u = new User();
		u.setEmail(username);
		u.setPasswords(password);
		assertEquals(null, userDAO.login(u));
	}
	
	
	@Test
	public void case_login_4() {
		String username = "johndoe@example.com";
		String password = "password12311";
		User u = new User();
		u.setEmail(username);
		u.setPasswords(password);
		assertEquals(null, userDAO.login(u));
	}
	
	
	
	@AfterTest
	public void farewell() {
		System.out.println("====> See you next time!<====");
		System.out.println("============= End Login==============");
	}
	
	
}
