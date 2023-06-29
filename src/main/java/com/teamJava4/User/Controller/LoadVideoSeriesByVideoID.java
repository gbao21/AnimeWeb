package com.teamJava4.User.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.teamJava4.Entity.Comments;
import com.teamJava4.Entity.Video;
import com.teamJava4.Implementations.CommentDAOIpl;
import com.teamJava4.Implementations.VideoDAOIpl;

/**
 * Servlet implementation class LoadVideoSeriesByVideoID
 */
@WebServlet("/LoadVideoSeriesByVideoID")
public class LoadVideoSeriesByVideoID extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private VideoDAOIpl daoVideo = new VideoDAOIpl();
      private CommentDAOIpl daoComment = new CommentDAOIpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadVideoSeriesByVideoID() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html ; charset=UTF-8" );
		String vID = request.getParameter("videoID");
		if(vID != null) {
			Video video = daoVideo.findById(Video.class, Long.valueOf(vID));
			Comments cm = new Comments();
			cm.setVideo(video);
			List<Comments> listComment = daoComment.findAllByVideoID(cm);
			JSONObject JsonVideo = new JSONObject();
			JsonVideo.put("video_url", video.getVideo_url());
			JsonVideo.put("video_id", video.getVideo_id());
			request.setAttribute("listComment", listComment);
			response.getWriter().write(JsonVideo.toString());   
		} 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
