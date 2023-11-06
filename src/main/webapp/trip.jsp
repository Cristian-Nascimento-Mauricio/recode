<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat.Style"%>
<%@page import="model.trips"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<title>Viagens</title>
</head>
<body>
	<header class="container p-4">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			 <div class="container-fluid">
			   <a class="navbar-brand" href="#">Flytrip</a>
			   <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			     <span class="navbar-toggler-icon"></span>
			   </button>
			   <div class="collapse navbar-collapse" id="navbarSupportedContent">
			     <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			       <li class="nav-item">
			         <a class="nav-link active" aria-current="page" href="/work/index.html">Página inicial</a>
			       </li>
			       <li class="nav-item">
			         <a class="nav-link" href="/work/contato.html">Contatos</a>
			       </li>
			       <li class="nav-item">
			         <a class="nav-link" href="/work/quemSomos.html">Quem somos</a>
			       </li>
			       <li class="nav-item dropdown">
			         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Viagens
			          </a>
			          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			            <li><a class="dropdown-item" href="/work/trip.jsp?type=nacional">Nacionais</a></li>
			            <li><a class="dropdown-item" href="/work/trip.jsp?type=internacional">Internacionas</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="/work/trip.jsp?type=promocoes">Promoções</a></li>
			          </ul>
			        </li>

			      </ul>
			      <form class="d-flex">
			        <input class="form-control me-2" type="search" placeholder="Pesquise por um lugar" aria-label="Search">
			        <button class="btn btn-outline-success" type="submit">Okay</button>
			      </form>
			    </div>
			  </div>
			</nav>			
		</header>
		
		<main class="container" style="display: flex; flex-direction: column; align-items: center;">
			<h1>Tipo: <%= request.getParameter("type")%></h1>
			
			<% 
				String type = request.getParameter("type");
				DAO db = new DAO();
				
				List<trips> list = db.getTrips(type);
				int lenght = list.size();
				
				for(int i = 0 ; i < lenght ; i++){
				
					
			%>	
				<div style="display:flex ;width: 70%; height:200px; margin: 10px 0px; border: 1px solid black;">
					<img src="./imgs/imagem.jpg" style="width: fit-content; height: 100%; border: 1px solid black">
					<div style="width: 100%; height: 100%; background-color: whitesmoke;" >
						<p style="margin: auto 10px auto 10px;">De: <%=list.get(i).getFrom() %><p>
						<p style="margin: auto 10px auto 10px;">Para: <%=list.get(i).getTo() %> <P>
						<p style="margin: auto 10px auto 10px;">Preço: <%= list.get(i).getPrice() %> <p>
					</div>
				</div>
			<%
				}
			%>	
				
			


		</main>
		
		<div class="container" style="margin-top: 1;">
		  <footer class="py-5">
		    <div class="row">
		      <div class="col-2">
		        <h5>Section</h5>
		        <ul class="nav flex-column">
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
		        </ul>
		      </div>
		
		      <div class="col-2">
		        <h5>Section</h5>
		        <ul class="nav flex-column">
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
		        </ul>
		      </div>
		
		      <div class="col-2">
		        <h5>Section</h5>
		        <ul class="nav flex-column">
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
		          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
		        </ul>
		      </div>
		
		      <div class="col-4 offset-1">
		        <form>
		          <h5>Avisdo de promoções</h5>
		          <p>Cadastre seu email para receber aviso de promoções</p>
		          <div class="d-flex w-100 gap-2">
		            <label for="newsletter1" class="visually-hidden">Email</label>
		            <input id="newsletter1" type="text" class="form-control" placeholder="Email address">
		            <button class="btn btn-primary" type="button">Enviar</button>
		          </div>
		        </form>
		      </div>
		    </div>
		
		    <div class="d-flex justify-content-between py-4 my-4 border-top">
		      <p>© 2021 FlyTrip,  Inc. All rights reserved.</p>
		      <ul class="list-unstyled d-flex">
		        <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"></use></svg></a></li>
		        <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"></use></svg></a></li>
		        <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"></use></svg></a></li>
		      </ul>
		    </div>
		  </footer>
		</div>	
</body>
</html>