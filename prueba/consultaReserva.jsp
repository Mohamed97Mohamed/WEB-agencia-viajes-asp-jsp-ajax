<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,org.firebirdsql.management.*"%>

<html>
	<head>
		<title>Consulta Reserva</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" type="text/css" href="stilo.css"/>
  </head>
  <body>
	<%@ include file="conexion.jsp"%>
	<header>
		
		<div class="container logo-nav-container">
			<h1 style="font-size:2em; text-align:center">ARARAT AIRWAYS</h1>
			<button onclick="location.href = 'http://localhost/WEB/pagina_inicial.html'" >Salir</button>
		</div>

	</header>
	<main>
	
		<div class="container productos">
			
			<form action="consultaReserva_busqueda.jsp" method="POST">
				DNI: <input type="text" name="dni">
				<br/>
				Ciudad Origen: <input type="text" name="ciudad_origen">
				<br/>
				<input type="submit" value="Buscar">
			</form>
			

		</div>

	</main>
  </body>
</html>