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
			<h3>Cancelar Reserva</h3>
			
			<table style="text-align:cencer;">
				<tr><td><b>CANCELAR</b></td><td><b>APELLIDOS</b></td><td><b>NOMBRE</b></td><td><b>NIF</b></td><td><b>IDVUELO</b></td><td><b>N_ASIENTOS</b></td></tr>
				<%
				dni=request.form("dni")
				
				id=request.form("idreserva")

				Set resultado = Conexion.Execute("select IDRESERVA,APELLIDOS,NOMBRE,NIF,IDVUELO,N_ASIENTOS from RESERVA where NIF='" & dni &"' AND IDRESERVA=" & id )
				
				do while not resultado.EOF
				Response.Write("<tr><td><center><a href=reserva_cancelar_final.asp?id=" & resultado("IDRESERVA") & "> <b><font color=red>Cancelar</font></b> </a></center></td><td> " & resultado("APELLIDOS") & " </td><td> " & resultado("NOMBRE") & " </td><td> " & resultado("NIF") & " </td><td> " & resultado("IDVUELO") & " </td><td> " & resultado("N_ASIENTOS") & " </td></tr>")
					'Nos desplazamos por el RecorSet
					resultado.MoveNext
				loop
				
				
				%>
				
			</table>
			<button onclick="location.href = 'reserva_cancelar_busqueda.asp'">Atras</button>
			
			
		</div>

	</main>

  </body>
</html>