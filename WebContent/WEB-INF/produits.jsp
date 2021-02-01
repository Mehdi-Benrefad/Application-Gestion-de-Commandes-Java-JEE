<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
    <%@page import="java.util.*"%>
<%@page import="métier.Produit"%>
<%@page import="métier.Client"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
<style>
	table{
        margin-left:5% !important;
        width:85% !important;
        }
</style>

</head>
<body>



	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		 <div class="container-fluid">
				    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
				      <span class="navbar-toggler-icon"></span>
				    </button>
				    
				    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
				      <a class="navbar-brand" href="#"><i class="text-success">Mehdi</i>.shop</a>
				      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
				        <li class="nav-item">
				          <a class="nav-link " aria-current="page" href="/TP-Gestion-De-Commandes-Mehdi-Benrefad-Annotation/home">Home</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link " href="/TP-Gestion-De-Commandes-Mehdi-Benrefad-Annotation/Controller">Commandes</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link active" href="#" tabindex="-1" aria-disabled="true">Produits</a>
				        </li>
				      </ul>
				    </div>
				    
				    <a href="/TP-Gestion-De-Commandes-MEHDI-BENREFAD/login"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button></a>
		  </div>
	  </nav>
	  

		<%
		ArrayList<Produit> prod =(ArrayList<Produit>) request.getAttribute("produits");
          %>
          
          
     <h1 style='margin-left:45%;'>Produits</h1>
		<br>
		
		<a href="addProduct"><button style="margin-left:5%;" type="button" class="btn btn-success">Nouveau</button></a><br><br>
    <table class="table table-striped">
    <thead class="thead-dark">
        
            <th scope="col">Id Produit </th>
            <th scope="col">Désignation</th>
            <th scope="col">Prix</th>
            <th scope="col">Quantité</th>
            <th scope="col">Montant</th>
            <th scope="col">Modifier</th>
            <th scope="col">Supprimer</th>
        </tr>
	</thead>
        
	<tbody>
          <% if(prod!=null){
     for(int i=0;i<prod.size();i++){%>
        <tr>
            <td><%= prod.get(i).getIdProduit() %></td>
            <td><%= prod.get(i).getDesignation() %></td>
            <td><%= prod.get(i).getPrix() %></td>
            <td><%= prod.get(i).getQuantite() %></td>
            <td><%out.print(prod.get(i).getQuantite()*prod.get(i).getPrix()); %></td>
            
            <td>
							<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal<%=i%>">
				  Modifier
				</button>
				
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal<%=i%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">Modifier Produit!</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
					      	<form method="post" action="UpdateProductForm">
					      		
					      		<input style="display:none" name="idprodmod" value=<%= prod.get(i).getIdProduit()%>>
							      <div class="modal-body">
							      
								        <div class="form-group">
										    <label for="exampleInputEmail1">Designation</label>
										    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Designation" name="Designation">
										 </div>
										  
										  <div class="form-group">
										    <label for="exampleInputEmail1">Quantite</label>
										    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="Quantite" placeholder="Quantite">
										  </div>
										  
										  <div class="form-group">
										    <label for="exampleInputEmail1">Prix</label>
										    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="Prix" placeholder="Prix">
										  </div>
									  
							      </div>
							      
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							        <input type="submit" class="btn btn-primary" value="Save changes">
							      </div>
					      	</form>
				    </div>
				  </div>
				</div>
				          	
            	
            </td>
            
            <td>
			<form method="post" action="deleteProduct">
				<input style="display:none" name="idproddel" value=<%= prod.get(i).getIdProduit() %>>
				<input type="submit" value="Supprimer" class="btn btn-danger">
			</form>
          	
            	
            </td>
        </tr>

 
        <% 
        }}%> 
	<tbody>

    </table>
    <br>
    <div class="jumbotron text-center">
  <h1 class="display-3">Thank You!</h1>
  

</div>


          
</body>
</html>