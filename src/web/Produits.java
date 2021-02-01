package web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import antlr.collections.List;
import métier.Produit;
import métier.Traitements;

/**
 * Servlet implementation class Produits
 */
@WebServlet("/Produits")
public class Produits extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Produits() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session=request.getSession();
		if(session.getAttribute("login")!=null) {
			ArrayList<Produit> produits=(ArrayList<Produit>) Traitements.listeDesProduits();
			request.setAttribute("produits", produits);
			this.getServletContext().getRequestDispatcher("/WEB-INF/produits.jsp").forward(request, response);
		}else {
			this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);	
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
