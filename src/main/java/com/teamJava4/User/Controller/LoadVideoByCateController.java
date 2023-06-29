package com.teamJava4.User.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.teamJava4.Entity.Categories;
import com.teamJava4.Entity.Movie;
import com.teamJava4.Entity.Report;
import com.teamJava4.Entity.Video;
import com.teamJava4.Implementations.MovieDAOIpl;
import com.teamJava4.Implementations.ReportDAOIpl;
import com.teamJava4.Implementations.VideoDAOIpl;
import com.teamJava4.User.DAO.MovieDAO;
import com.teamJava4.User.DAO.ReportDAO;
import com.teamJava4.User.DAO.VideoDAO;

/**
 * Servlet implementation class LoadVideoByCateController
 */
@WebServlet({"/LoadVideoByCateController", "/LoadEpisodeMovies", "/LoadSeriesMovies"})
public class LoadVideoByCateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private VideoDAO daoVideo = new VideoDAOIpl();
      private MovieDAO daoMovie = new MovieDAOIpl();
      private ReportDAO daoReport = new ReportDAOIpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadVideoByCateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8" );
		Movie movie = new Movie();
		Video video = new Video();
	
		String url = request.getRequestURI();
		if(url.contains("LoadEpisodeMovies")){
			movie.setIs_movie(false);
			video.setMovie(movie);
			List<Video> listVideo  = daoVideo.findAllVideosByTypes(video);
			request.setAttribute("listVideo", listVideo);
		}
		if(url.contains("LoadSeriesMovies")) {
			List<Report> listMovie =  daoReport.findAll();
			request.setAttribute("listMovie", listMovie);		
		}
		request.getRequestDispatcher("/Views/User/anime-items.jsp").forward(request, response);
//		List<Video> list = null;
//		if(Integer.valueOf(cateID) == 0 ) {
//			list = daoVideo.findAll();
//		}else {
//			Categories cate = new Categories();
//			cate.setCategory_id(Long.valueOf(cateID));
//			Movie movie = new Movie();
//			movie.setCategory(cate);
//			movie.setIs_movie(false);
//			Video video = new Video();
//			video.setMovie(movie);
//			list = daoVideo.findByCategory(video);
//		}		
//		request.setAttribute("listVideoByCate", list);
//		request.getRequestDispatcher("/Views/User/anime-items.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
