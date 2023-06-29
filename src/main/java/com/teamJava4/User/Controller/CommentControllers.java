package com.teamJava4.User.Controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.teamJava4.Entity.Comments;
import com.teamJava4.Entity.User;
import com.teamJava4.Entity.Video;
import com.teamJava4.Implementations.CommentDAOIpl;

/**
 * Servlet implementation class CommentControllers
 */
@WebServlet({ "/anime-comment", "/anime-deleteComment"})
public class CommentControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommentDAOIpl daoComment = new CommentDAOIpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentControllers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		HttpSession session = request.getSession();
		switch (path) {
		case "/anime-deleteComment":
			doGetDeleteComment(request, response);
			break;
		default:
			break;
			}
	}

	private void doGetDeleteComment(HttpServletRequest request, HttpServletResponse response) {
		Long commentID = Long.valueOf(request.getParameter("commentID"));
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user != null) {
			Comments commentCheck = new Comments();
			commentCheck.setUser(user);
			commentCheck.setComment_id(commentID);
			Comments comment = daoComment.findCommentByID(commentCheck);
			if(comment != null) {
				if(daoComment.delete(comment)) {
					response.setStatus(201);
				}else {
					response.setStatus(400);
				}
				
			}else {
				response.setStatus(400);
			}
		}else {
			response.setStatus(400);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		HttpSession session = request.getSession();
		switch (path) {
		case "/anime-comment":
			doPostComment(request, response);
			break;
		default:
			break;
			}
	}
		
		private void doPostComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String comment = request.getParameter("comment");
			String vID = request.getParameter("videoID");
			String mID = request.getParameter("movieID");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			Long check = null;
			if (user != null) {
				if (comment.trim().length() > 0) {
					Long videoID =  Long.valueOf(vID);
					Comments cm = new Comments();
					cm.setContent(comment);
					cm.setUser(user);
					
					Video video = new Video();
					video.setVideo_id(videoID);
					cm.setVideo(video);
					cm.setIsActive(true);
					cm.setCreated_at(new Timestamp(System.currentTimeMillis()));
					cm.setUpdate_by(null);
					if (daoComment.create(cm)) {
						JSONObject JsonCM = new JSONObject();
						JsonCM.put("commentID", cm.getComment_id());
						JsonCM.put("content", cm.getContent());
						JsonCM.put("comment_user", cm.getUser().getCustomer_name());
						response.setStatus(201);
						response.getWriter().write(JsonCM.toString());   
					} else {
						response.setStatus(400);
					}
				} else {
					response.setStatus(400);
				}
			}else {
				response.setStatus(400);
			}
		}
}
