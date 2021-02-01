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
		
		
		//style photos
		body {
    margin: 0;
    font-family: Roboto, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: .8125rem;
    font-weight: 400;
    line-height: 1.5385;
    color: #333;
    text-align: left;
    background-color: #2196F3
}

.mt-50 {
    margin-top: 50px
}

.mb-50 {
    margin-bottom: 50px
}

.card {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0, 0, 0, .125);
    border-radius: .1875rem
}

.card-img-actions {
    position: relative
}

.card-body {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem;
    text-align: center
}

.card-img {
    width: 350px
}

.star {
    color: red
}

.bg-cart {
    background-color: orange;
    color: #fff
}

.bg-cart:hover {
    color: #fff
}

.bg-buy {
    background-color: green;
    color: #fff;
    padding-right: 29px
}

.bg-buy:hover {
    color: #fff
}

a {
    text-decoration: none !important
}
    </style>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
  <!-- jQuery -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
crossorigin="anonymous"></script>

<!-- Bootstrap files (jQuery first, then Popper.js, then Bootstrap JS) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" type="text/javascript"></script>

</head>
<body>
    

	  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
		 <div class="container-fluid">
				    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
				      <span class="navbar-toggler-icon"></span>
				    </button>
				    
				    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
				      <a class="navbar-brand" href="#"><i class="text-success">Mehdi</i>.shop</a>
				      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
				        <li class="nav-item">
				          <a class="nav-link active" aria-current="page" href="#">Home</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link " href="/TP-Gestion-De-Commandes-Mehdi-Benrefad-Annotation/Controller">Commandes</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link " href="/TP-Gestion-De-Commandes-Mehdi-Benrefad-Annotation/Produits" tabindex="-1" aria-disabled="true">Produits</a>
				        </li>
				      </ul>
				    </div>
				    
				    <a href="/TP-Gestion-De-Commandes-Mehdi-Benrefad-Annotation/login"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button></a>
		  </div>
		</nav>
   

    
    
    <!-- //slider-->
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="images/header2.webp" class="d-block w-100"  height="600px" width=100% alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>First Laptop</h5>
            <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="images/header2.webp" class="d-block w-100"  height="600px" width=100% alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>Second Laptop</h5>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="images/header2.webp" class="d-block w-100"  height="600px" width=100% alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>Third Laptop</h5>
            <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    <br>  <br>  <br>
    
    
<!-- Description du site -->
<div class="font-weight-bold" style='margin:5%;'>
<h1 class="text-success text-center">Mehdi Shop</h1>
<p> Mehdi shop est un site web de vente de materiel electronique(des ordinateurs, telephones, ...) en cours de construction !!! Mehdi shop est un site web de vente de materiel electronique(des ordinateurs, telephones, ...) en cours de construction !!!Mehdi shop est un site web de vente de materiel electronique(des ordinateurs, telephones, ...) en cours de construction !!!</p>

</div>

  <br>  <br>  <br>  <br>

<!-- cards -->

<div class="container d-flex justify-content-center mt-50 mb-50">
    <div class="row">
        <div class="col-md-4 mt-2">
            <div class="card">
                <div class="card-body">
                    <div class="card-img-actions"> <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png" class="card-img img-fluid" width="96" height="350" alt=""> </div>
                </div>
                <div class="card-body bg-light text-center">
                    <div class="mb-2">
                        <h6 class="font-weight-semibold mb-2"> <a href="#" class="text-default mb-2" data-abc="true">Toshiba Notebook </a> </h6> <a href="#" class="text-muted" data-abc="true">ordinateur</a>
                    </div>
                    <h3 class="mb-0 font-weight-semibold">2500.99 dh</h3>
                    <div> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> </div>
                    <div class="text-muted mb-3">25 like</div> <button type="button" class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Add to cart</button>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-2">
            <div class="card">
                <div class="card-body">
                    <div class="card-img-actions"> <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png" class="card-img img-fluid" width="96" height="350" alt=""> </div>
                </div>
                <div class="card-body bg-light text-center">
                    <div class="mb-2">
                        <h6 class="font-weight-semibold mb-2"> <a href="#" class="text-default mb-2" data-abc="true">Toshiba Notebook </a> </h6> <a href="#" class="text-muted" data-abc="true">ordinateur</a>
                    </div>
                    <h3 class="mb-0 font-weight-semibold">2500.99 dh</h3>
                    <div> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> </div>
                    <div class="text-muted mb-3">25 like</div> <button type="button" class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Add to cart</button>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-2">
            <div class="card">
                <div class="card-body">
                    <div class="card-img-actions"> <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png" class="card-img img-fluid" width="96" height="350" alt=""> </div>
                </div>
                <div class="card-body bg-light text-center">
                    <div class="mb-2">
                        <h6 class="font-weight-semibold mb-2"> <a href="#" class="text-default mb-2" data-abc="true">Toshiba Notebook</a> </h6> <a href="#" class="text-muted" data-abc="true">ordinateur</a>
                    </div>
                    <h3 class="mb-0 font-weight-semibold">2500.99 dh</h3>
                    <div> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> </div>
                    <div class="text-muted mb-3">25 like</div> <button type="button" class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Add to cart</button>
                </div>
            </div>
        </div>
        
   <div class="container d-flex justify-content-center mt-50 mb-50">
    <div class="row">
        <div class="col-md-4 mt-2">
            <div class="card">
                <div class="card-body">
                    <div class="card-img-actions"> <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png" class="card-img img-fluid" width="96" height="350" alt=""> </div>
                </div>
                <div class="card-body bg-light text-center">
                    <div class="mb-2">
                        <h6 class="font-weight-semibold mb-2"> <a href="#" class="text-default mb-2" data-abc="true">Toshiba Notebook </a> </h6> <a href="#" class="text-muted" data-abc="true">ordinateur</a>
                    </div>
                    <h3 class="mb-0 font-weight-semibold">2500.99 dh</h3>
                    <div> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> </div>
                    <div class="text-muted mb-3">25 like</div> <button type="button" class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Add to cart</button>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-2">
            <div class="card">
                <div class="card-body">
                    <div class="card-img-actions"> <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png" class="card-img img-fluid" width="96" height="350" alt=""> </div>
                </div>
                <div class="card-body bg-light text-center">
                    <div class="mb-2">
                        <h6 class="font-weight-semibold mb-2"> <a href="#" class="text-default mb-2" data-abc="true">Toshiba Notebook </a> </h6> <a href="#" class="text-muted" data-abc="true">ordinateur</a>
                    </div>
                    <h3 class="mb-0 font-weight-semibold">2500.99 dh</h3>
                    <div> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> </div>
                    <div class="text-muted mb-3">25 like</div> <button type="button" class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Add to cart</button>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-2">
            <div class="card">
                <div class="card-body">
                    <div class="card-img-actions"> <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png" class="card-img img-fluid" width="96" height="350" alt=""> </div>
                </div>
                <div class="card-body bg-light text-center">
                    <div class="mb-2">
                        <h6 class="font-weight-semibold mb-2"> <a href="#" class="text-default mb-2" data-abc="true">Toshiba Notebook</a> </h6> <a href="#" class="text-muted" data-abc="true">ordinateur</a>
                    </div>
                    <h3 class="mb-0 font-weight-semibold">2500.99 dh</h3>
                    <div> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> </div>
                    <div class="text-muted mb-3">25 like</div> <button type="button" class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Add to cart</button>
                </div>
            </div>
        </div>
        
   
</body>
</html>