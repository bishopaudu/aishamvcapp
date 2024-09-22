package mvc.net.code;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class webserverlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FilmDAO filmDAO;
       
   
    public void init() throws ServletException{
    	 ServletContext context = getServletContext();
         filmDAO = new FilmDAO(context);  // Pass ServletContext to FilmDAO
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        switch(action) {
            case "/new":
                showNewForm(request, response);
                break;
            case "/insert":
            	addFilm(request,response);
                break;
            case "/edit":
			try {
				showEditForm(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
                break;
            case "/delete":
			try {
				deleteFilm(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
                break;
            case "/update":
            	updateFilm(request,response);
                break;
            default:
			try {
				listAllFilms(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}
                break;
        }
    }
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("film-form.jsp").forward(request, response);
    }
	 private void listAllFilms(HttpServletRequest request, HttpServletResponse response)
			    throws SQLException, IOException, ServletException {
			        ArrayList < Film > listFilms= filmDAO.getAllFilms();
			        System.out.print(listFilms);			        
			        request.setAttribute("listFilms", listFilms);
			        RequestDispatcher dispatcher = request.getRequestDispatcher("all-films.jsp");
			        dispatcher.forward(request, response);
			    }
    
    private void addFilm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String title = request.getParameter("title");
		int year = Integer.parseInt(request.getParameter("year"));
		String director = request.getParameter("director");
		String stars = request.getParameter("stars");
		String reviews = request.getParameter("review");
		Film newFilm = new Film();
		 newFilm.setTitle(title);
		    newFilm.setYear(year);
		    newFilm.setDirector(director);
		    newFilm.setStars(stars); 
		    newFilm.setReview(reviews);
		filmDAO.addFilm(newFilm);
		response.sendRedirect("list");
    }
	private void deleteFilm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
	        try {
	        	filmDAO.deleteFilmById(id);
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }
	        response.sendRedirect("list");
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
	    int id = Integer.parseInt(request.getParameter("id"));
	    Film existingFilm = filmDAO.getFilmByID(id);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("film-form.jsp");
	    request.setAttribute("film", existingFilm);
	    dispatcher.forward(request, response);
	}
	private void updateFilm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int id = Integer.parseInt(request.getParameter("id"));
	    String title = request.getParameter("title");
	    int year = Integer.parseInt(request.getParameter("year"));
	    String director = request.getParameter("director");
	    String review = request.getParameter("review");
	    String stars = request.getParameter("stars");

	    filmDAO.updateFilmById(id, title, year, director, review,stars);

	    response.sendRedirect("list"); 
	}

 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }

}

