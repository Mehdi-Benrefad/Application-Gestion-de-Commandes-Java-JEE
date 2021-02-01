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
 * Servlet implementation class UpdateProductForm
 */
@WebServlet("/UpdateProductForm")
public class UpdateProductForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		try {
			long idprodmod=(long)Integer.valueOf(request.getParameter("idprodmod"));
			String Designation=request.getParameter("Designation");
			int Quantite=Integer.parseInt(request.getParameter("Quantite"));
			double Prix=(double)Integer.parseInt(request.getParameter("Prix"));
			Traitements.ModifierProduit(Designation,Prix,true,Quantite,idprodmod);
			}catch(Exception e) {
				e.printStackTrace();
			}
		response.sendRedirect("Produits");
	}

}
