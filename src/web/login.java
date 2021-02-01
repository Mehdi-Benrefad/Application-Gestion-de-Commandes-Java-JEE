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
import métier.Admin;
import métier.Traitements;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	//}
	
			this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);

		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	doGet(request, response);
		String login=request.getParameter("login");
		String password=request.getParameter("pass");
		HttpSession session=request.getSession();
		if(Traitements.testerAdmin(login,password)==true) {
			session.setAttribute("login", login);
			session.setAttribute("password", password);
			 this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
		}else {
			this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		}
		
		/*boolean trouve=false;
		//List admins=(List)Traitements.chargerAdmins();
		ArrayList<Admin> adm=new ArrayList();
		adm= Traitements.chargerAdmins();
		
		for (int i=0;i<((List) adm).length();i++) {
           if(adm.get(i).getLogin().equalsIgnoreCase(login) && adm.get(i).getPassword().equals(password)){
        	   trouve=true;
        	   this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
            }
        }
		
		if(trouve==false) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);

		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);*/
	}

}
