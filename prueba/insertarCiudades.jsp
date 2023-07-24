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
			
			<form action="insertarCiudades_final.jsp" method="post">
		
				<table>
					<tr>
						<td>C&oacute;digo Ciudad</td>
						<td><input type="text" name="idciudad"></td>
					</tr>
					<tr>
						<td>Ciudad</td>
						<td><input type="text" name="ciudad"></td>
					</tr>
					<tr>
						<td>Tasa Aeropuerto</td>
						<td><input type="text" name="tasa_aeropuerto"></td>
					</tr>
					<tr>
						<td colspan=2>
							<center>
								<input type="submit" id="introducir_ciudad" value="Introducir Ciudad">
							</center>
						</td>
					</tr>
				</table>
			</form>
			
			<button onclick="location.href = 'http://localhost/WEB/administrador.asp'"  style="width:auto;">Atras</button>
			

		</div>

	</main>
  </body>
</html>