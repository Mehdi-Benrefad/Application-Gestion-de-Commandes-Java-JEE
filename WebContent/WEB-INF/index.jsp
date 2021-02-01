<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
    <%@page import="java.util.*"%>
<%@page import="métier.Produit"%>
<%@page import="métier.Client"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        table{
        margin-left:5% !important;
        width:85% !important;
        }
		th,td{
			width:10%;
			text-align:center !important;
		}
		li{
		width:40%;
		margin-left:10%;
		}
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
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
				          <a class="nav-link active" href="#">Commandes</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link " href="/TP-Gestion-De-Commandes-Mehdi-Benrefad-Annotation/Produits" tabindex="-1" aria-disabled="true">Produits</a>
				        </li>
				      </ul>
				    </div>
				    
				    <a href="/TP-Gestion-De-Commandes-MEHDI-BENREFAD/login"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button></a>
		  </div>
	  </nav>
	
    
	</nav>
    
    <h1 style='margin-left:40%;'>Commandes:</h1>
    

    <form method="POST" action="Controller">
     
        <div class="input-group" style='width:50%;margin-left:20%;'>
			  <div class="input-group-prepend">
			    <span class="input-group-text">Numéro de commande</span>
			  </div>
			  <input name="ncom" type="number" aria-label="Numéro de commande" class="form-control">
			  <input class="btn btn-success" type="submit" value="Chercher">
			</div>
			
    </form>
    <br><br><br>
    
	<% if(request.getAttribute("date")!= null){%>
    
    <h1 style='margin-left:38%;'>Date de Commande:</h1>
	<p class="text-center font-weight-bold text-success"><%= request.getAttribute("date")%></p>
 

   
    <%
            double sum = 0.0;
            Client cli =(Client) request.getAttribute("client");
            List<Produit> prod = (List<Produit>) request.getAttribute("produits");
          %>
	<br><br><br>
    <h1 style='margin-left:45%;'>Client:</h1>
    <ul class="list-group">
       <li class="list-group-item p-3 mb-2 bg-success text-white">Nom</li> 
       <li class="list-group-item"><%=cli.getNomClient() %></li>
       <li class="list-group-item p-3 mb-2 bg-success text-white">Societe</li>
        <li class="list-group-item"><%= cli.getSociete() %></li>
    </ul>

    

    <h1 style='margin-left:45%;'>Produits</h1>

    <table class="table table-striped">
    <thead class="thead-dark">
        
            <th scope="col">Id Produit </th>
            <th scope="col">Désignation</th>
            <th scope="col">Prix</th>
            <th scope="col">Quantité</th>
            <th scope="col">Montant</th>
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
            
        </tr>

 
        <% sum+=prod.get(i).getQuantite()*prod.get(i).getPrix();
        }}%> 

        <tfoot>
            <tr class="table-success">
                <td colspan="4">Total</td>
                
                <td><%= sum %></td>
            </tr>
        </tfoot>
	<tbody>

    </table>
    <br>
    <div class="jumbotron text-center">
  <h1 class="display-3">Thank You!</h1>
  

</div>

<%}%>



  <nav class="navbar navbar-dark bg-dark fixed-bottom ">
  <a class="navbar-brand" href="#">Espace Client</a>
</nav>
</body>
</html>