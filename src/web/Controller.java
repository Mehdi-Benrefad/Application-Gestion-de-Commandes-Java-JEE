package web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import métier.Client;
import métier.Commande;
import métier.Composante;
import métier.Produit;
import métier.Traitements;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
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
			this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);			
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
		
		String ncom=request.getParameter("ncom");
		
		try {
			if(ncom!="") {
			int val=Integer.parseInt(ncom);
			
			Commande com=Traitements.chargerCommande((long)val);
			
			
				request.setAttribute("date",com.getDateCommande());
				Client cli=com.getClient();
				request.setAttribute("client",cli);
				
				List<Composante> composantes=com.getLesComposantes();
				List<Produit> produits=Traitements.listeProduits(Long.valueOf(val));
				
				
				request.setAttribute("produits", produits);
		
			
			
			}
		}catch(Exception e) {
			
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
		
	}

}
