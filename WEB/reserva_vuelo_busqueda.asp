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
			<h3>Buscar Vuelos</h3>
			<div>
				<button onclick="location.href = 'reserva_vuelo_busqueda.asp'">Reservar Vuelo</button>
				<button onclick="location.href = 'reserva_cancelar_busqueda.asp'">Cancelar Reserva</button>
			</div>
			
			<form action="reserva_vuelo_seleccion.asp" method="post">
				Origen:
				<select name="origen" >
				
					<option></option>
					
					<%
					Set origen = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
					
						'Recorremos el RecordSet
						do while not origen.EOF
							Response.Write("<option>" & origen("CIUDAD") & "</option>")
								origen.MoveNext
						loop
					%>
				
				</select>
				Destino:
				<select name="destino" >
				
					<option></option>
					
					<%
					Set destino = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
					
						'Recorremos el RecordSet
						do while not destino.EOF
							Response.Write("<option>" & destino("CIUDAD") & "</option>")
								destino.MoveNext
						loop
					%>
				
				</select>
				

				<input type="submit" id="buscar" value="Buscar">
			</form>
			
			

		</div>

	</main>

  </body>
</html>