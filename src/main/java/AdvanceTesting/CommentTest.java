package AdvanceTesting;


import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertNotEquals;

import java.sql.Timestamp;

import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import com.teamJava4.Entity.Comments;
import com.teamJava4.Entity.User;
import com.teamJava4.Entity.Video;
import com.teamJava4.Implementations.CommentDAOIpl;

public class CommentTest {
	CommentDAOIpl daoComment = new CommentDAOIpl();
	
	@BeforeTest
	public void welcomeToLogin() {
		System.out.println("====> Welcome to anime world!<====");
		System.out.println("============= Begin Login==============");
	}
	

	
	@Test
	public void case_comment_1() {
		Comments cm = new Comments();
		User u = new User();
		u.setCustomer_id(2L);
		Video video = new Video();
		video.setVideo_id(2L);
		cm.setContent("i am superhero haha");
		cm.setUser(u);
		cm.setVideo(video);
		cm.setIsActive(true);
		cm.setCreated_at(new Timestamp(System.currentTimeMillis()));
		cm.setUpdate_by(null);
		assertNotEquals( false, daoComment.create(cm));
	}
	
	@Parameters( {"video_id","customer_id"})
	@Test
	public void case_comment_2(String video_id, String customer_id) {
		Long vId = Long.valueOf(video_id);
		Long uId = Long.valueOf(customer_id);
		Comments cm = new Comments();
		User u = new User();
		u.setCustomer_id(uId);
		Video video = new Video();
		video.setVideo_id(vId);
		cm.setContent("");
		cm.setUser(u);
		cm.setVideo(video);
		cm.setIsActive(true);
		cm.setCreated_at(new Timestamp(System.currentTimeMillis()));
		cm.setUpdate_by(null);
		assertNotEquals(false, daoComment.create(cm));
	}
	
	@Test
	public void case_comment_3() {
		Comments cm = new Comments();
		User u = new User();
		u.setCustomer_id(2L);
		Video video = new Video();
		video.setVideo_id(2L);
		cm.setContent("dsgagggggg");
		cm.setUser(u);
		cm.setVideo(video);
		cm.setIsActive(true);
		cm.setCreated_at(new Timestamp(System.currentTimeMillis()));
		cm.setUpdate_by(null);
		assertNotEquals(false, daoComment.delete(cm));
	}
	
	
	
	@AfterTest
	public void farewell() {
		System.out.println("====> See you next time!<====");
		System.out.println("============= End Login==============");
	}

}
