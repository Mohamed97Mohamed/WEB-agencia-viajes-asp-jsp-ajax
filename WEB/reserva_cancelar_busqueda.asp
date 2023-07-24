<!-- #include file=conexion.asp -->
<html>
  <head>
    <title>Cancelar Vuelos</title>
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
			<h3>Buscar Reserva</h3>
			<div>
				<button onclick="location.href = 'reserva_vuelo_busqueda.asp'">Reservar Vuelo</button>
				<button onclick="location.href = 'reserva_cancelar_busqueda.asp'">Cancelar Reserva</button>
			</div>
			<form method="post" action="reserva_cancelar_seleccion.asp">

				DNI: <input type="text" name="dni"><br>
				IDRESERVA: <input type="number" name="idreserva"><br><br>

				<input type="submit" value="Buscar">
			</form>

		</div>

	</main>

  </body>
</html>