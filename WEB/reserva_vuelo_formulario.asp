<!-- #include file=conexion.asp -->
<html>
  <head>
    <title>Reserva Vuelos</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="stylesheet" type="text/css" href="stilo.css"/>
  </head>
  <body>
  
	
	<header>
		
		<div class="container logo-nav-container">
			<h1 style="font-size:2em; text-align:center">ARARAT AIRWAYS</h1>
			<button onclick="location.href = 'terminar_sesion.asp'" >Salir</button>
			
		</div>

	</header>
	

	<main>
	
		<div class="container productos">
			
			
			<h2>Gestión de Reservas</h2>
			<h3>Datos Reserva</h3>
			
			<%
				'Recibimos el id de la ciudad a modificar mediante GET
				id_recibido=request.querystring("id")
				
				'Seleccionamos la Ciudad que tiene dicho id
				Set consulta = Conexion.Execute("select IDVUELO from LISTA_VUELOS_PRECIO where IDVUELO=" & id_recibido)
				Set consulta2 = Conexion.Execute("select max(IDRESERVA)as ultimo_id from RESERVA ")
				
				id=consulta("IDVUELO")
				sig_id = consulta2("ultimo_id")+1
			%>
			
			<form action="reserva_vuelo_final.asp" method="post">
				<table>
					<tr><td>C&oacute;digo Reserva:</td><td><input type="text" name="idreserva"
						readonly value=<% response.write(sig_id)%>>
					</td></tr>
					<tr><td>Apellidos:</td><td><input type="text" name="apellidos"></td></tr>
					<tr><td>Nombre:</td><td><input type="text" name="nombre"></td></tr>
					<tr><td>DNI:</td><td><input type="text" name="dni"></td></tr>
					<tr><td>C&oacute;digo Vueloa:</td><td><input type="text" name="idvuelo"
						readonly value=<% response.write(id)%>>
					</td></tr>
					<tr><td>Numero Asientos:</td><td><input type="number" name="nAsientos"></td></tr>
				</table>
				<button type="submit">Reservar</button>
			</form>
			<button onclick="location.href = 'reserva_vuelo_seleccion.asp'">Atras</button>
			
		</div>

	</main>

  </body>
</html>