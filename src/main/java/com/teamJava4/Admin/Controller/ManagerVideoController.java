package com.teamJava4.Admin.Controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamJava4.Entity.Categories;
import com.teamJava4.Entity.History;
import com.teamJava4.Entity.Movie;
import com.teamJava4.Entity.User;
import com.teamJava4.Entity.Video;
import com.teamJava4.Implementations.HistoryDAOImpl;
import com.teamJava4.Implementations.MovieDAOIpl;
import com.teamJava4.Implementations.UserDAOIpl;
import com.teamJava4.Implementations.VideoDAOIpl;
import com.teamJava4.User.Utils.GetEntityByBeanIUtil;

/**
 * Servlet implementation class ManagerVideoController
 */
@WebServlet(urlPatterns = { "/AdminHome", "/ManagerVideoController", "/admin/manager-movie", "/LoadingVideo",
		"/LoadingMovie", "/manageUpdate", "/manageCreate", "/LoadingCustomer", "/LoadingHistory" })
public class ManagerVideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static VideoDAOIpl daoVideo = new VideoDAOIpl();
	private static MovieDAOIpl daoMovie = new MovieDAOIpl();
	private static UserDAOIpl daoUser = new UserDAOIpl();
	private static HistoryDAOImpl daoHistory = new HistoryDAOImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/ManagerVideoController":
			break;
		case "/LoadingVideo":
			doGetManagerVideo(request, response);
			break;
		case "/LoadingMovie":
			doGetManagerMovie(request, response);
			break;
		case "/AdminHome":
			List<Video> listVideo = daoVideo.findAll();
			request.setAttribute("listVideo", listVideo);
			request.getRequestDispatcher("/Views/Admin/managerVideos.jsp").forward(request, response);
			break;
		case "/LoadingCustomer":
			List<User> listUser = daoUser.findAll();
			request.setAttribute("listUser", listUser);
			request.getRequestDispatcher("/Views/Admin/manageCustomer.jsp").forward(request, response);
			break;

		case "/LoadingHistory":
			List<History> listHistory = daoHistory.findAll();
			request.setAttribute("listHistory", listHistory);
			request.getRequestDispatcher("/Views/Admin/manageHistory.jsp").forward(request, response);
			break;
		default:
			break;
		}

	}

	protected void doGetManagerVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Video> listVideo = daoVideo.findAll();
		request.setAttribute("listVideo", listVideo);
		request.getRequestDispatcher("/Views/Admin/Components/video-table.jsp").forward(request, response);
	}

	protected void doGetManagerMovie(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Movie> listMovie = daoMovie.findByIsMovie();
		request.setAttribute("listMovie", listMovie);
		request.getRequestDispatcher("/Views/Admin/Components/movie-table.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/manageCreate":
			String action = request.getParameter("action");
			String isMovie = request.getParameter("isMovie");
			if (action.equals("create") && isMovie.equals("false")) {
				System.out.println("i am here");
				if (cteateVideo(request, response)) {
					List<Video> listVideo = daoVideo.findAll();
					request.setAttribute("listVideo", listVideo);
					request.getRequestDispatcher("/Views/Admin/Components/video-table.jsp").forward(request, response);
					response.setStatus(200);
				} else {
					response.setStatus(400);
				}
			} else if (action.equals("create") && isMovie.equals("true")) {
				if (createMovie(request, response)) {
					List<Movie> listMovie = daoMovie.findByIsMovie();
					request.setAttribute("listMovie", listMovie);
					request.getRequestDispatcher("/Views/Admin/Components/movie-table.jsp").forward(request, response);
					response.setStatus(200);
				} else {
					response.setStatus(400);
				}
			} else {
				response.setStatus(400);
			}

			break;
		case "/manageUpdate": {
			String actionU = request.getParameter("action");
			String isMovieU = request.getParameter("isMovie");
			System.out.println(actionU);
			System.out.println(isMovieU);
			if (actionU.equals("update") && isMovieU.equals("false")) {
				if (updateVideo(request, response)) {
					System.out.println("Update succeess");
					List<Video> listVideo = daoVideo.findAll();
					request.setAttribute("listVideo", listVideo);
					request.getRequestDispatcher("/Views/Admin/Components/video-table.jsp").forward(request, response);
				} else {
					response.setStatus(400);
				}

			}
			break;
		}

		default:

		}
	}

	public boolean cteateVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String title = request.getParameter("video_title");
			String cateId = request.getParameter("categories");
			String des = request.getParameter("descriptions");
			String url = request.getParameter("video_url");
			Categories cate = new Categories();
			cate.setCategory_id(Long.valueOf(cateId));
			Movie movie = new Movie();
			movie.setCategory(cate);
			List<Movie> listMovie = daoMovie.findByCategory(movie);
			Video video = new Video();
			video.setVideo_title(title);
			video.setVideo_url(url);
			video.setDescriptions(des);
			video.setMovie(listMovie.get(0));
			if (daoVideo.create(video)) {
				System.out.println(" thêm thành công");
				return true;
			}

		} catch (NumberFormatException e) {
			return false;
		}
		return false;
	}

	public boolean updateVideo(HttpServletRequest request, HttpServletResponse response) {
		Video video = GetEntityByBeanIUtil.getEntity(Video.class, request);
		String cateId = request.getParameter("categories");
		Categories cate = new Categories();
		cate.setCategory_id(Long.valueOf(cateId));
		Movie movie = new Movie();
		movie.setCategory(cate);
		List<Movie> listMovie = daoMovie.findByCategory(movie);
		Movie movieCheck = listMovie.get(0);
		video.setMovie(movieCheck);
		Video videoUp = daoVideo.findById(Video.class, video.getVideo_id());
		videoUp.setVideo_title(video.getVideo_title());
		videoUp.setVideo_url(video.getVideo_url());
		videoUp.setDescriptions(video.getDescriptions());
		videoUp.setMovie(video.getMovie());
		if (daoVideo.update(videoUp)) {
			System.out.println("update success");
			return true;
		}
		return false;
	}

	public boolean createMovie(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String movie_name = request.getParameter("name_movie");
		String cate = request.getParameter("category");
		String moive_img = request.getParameter("Movie_img");
		String desc = request.getParameter("movie_desc");
		Movie movie = new Movie();
		Categories cate2 = new Categories();
		cate2.setCategory_id(Long.valueOf(cate));
		movie.setName_movie(movie_name);
		movie.setCategory(cate2);
		movie.setMovie_img(moive_img);
		movie.setMovie_desc(desc);
		if (daoMovie.create(movie)) {
			return true;
		}
		return false;

	}

}
