package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import métier.Traitements;

/**
 * Servlet implementation class addProduct
 */
@WebServlet("/addProduct")
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/addProduct.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		try {
		String Designation=request.getParameter("Designation");
		double Quantite=(double)Integer.parseInt(request.getParameter("Quantite"));
		int Prix=Integer.parseInt(request.getParameter("Prix"));
		
		Traitements.addProduit(Designation,Quantite,true,Prix);
		}catch(Exception e) {
			e.printStackTrace();
		}
		//this.getServletContext().getRequestDispatcher("/WEB-INF/produits.jsp").forward(request, response);
		//Traitements.addProduit("Ordinateur", 2000.0, true, 500);
		response.sendRedirect("Produits");
	}

}
