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
			<h3>Seleción Vuelos</h3>
			
			<table>
				<tr><td><b>Reserva</b></td><td><b>Ciudad Origen</b></td><td><b>Ciudad Destino</b></td><td><b>Fecha</b></td><td><b>Compania</b></td><td><b>NPlazas</b></td><td><b>Precio</b></td></tr>
				<%
				origin=request.form("origen")
				
				destination1=request.form("destino")
				
				if (origin <> "") and  (destination1 <> "") then
					Set resultado = Conexion.Execute("select IDVUELO,CIUDAD_ORIGEN,CIUDAD_DESTINO,FECHA,COMPANIA,N_PLAZAS_DISPONIBLES,PRECIO from LISTA_VUELOS_PRECIO where CIUDAD_ORIGEN='" & origin &"' AND CIUDAD_DESTINO='" & destination1 & "'")
					
					'do while not resultado.EOF
					'Response.Write("<tr><td><center><a href=reserva_vuelo_formulario.asp?id=" & resultado("IDVUELO") & "> <b><font color=red>X</font></b> </a></center></td><td> " & resultado("CIUDAD_ORIGEN") & " </td><td> " & resultado("CIUDAD_DESTINO") & " </td><td> " & resultado("FECHA") & " </td><td> " & resultado("COMPANIA") & " </td><td> " & resultado("N_PLAZAS_DISPONIBLES") & " </td><td> " & resultado("PRECIO") & " </td></tr>")
						'Nos desplazamos por el RecorSet
						'resultado.MoveNext
					'loop
					
					do while not resultado.EOF
					Response.Write("<tr><td><center><a href=reserva_vuelo_formulario.asp?id=" & resultado("IDVUELO") & "> <b>Reservar</b> </a></center></td><td> " & resultado("CIUDAD_ORIGEN") & " </td><td> " & resultado("CIUDAD_DESTINO") & " </td><td> " & resultado("FECHA") & " </td><td> " & resultado("COMPANIA") & " </td><td> " & resultado("N_PLAZAS_DISPONIBLES") & " </td><td> " & resultado("PRECIO") & " </td></tr>")
						'Nos desplazamos por el RecorSet
						resultado.MoveNext
					loop
				else
				
				end if
				%>
				<%
				if (origin="") and (destination1="") then
					Set resultado = Conexion.Execute("select IDVUELO,CIUDAD_ORIGEN,CIUDAD_DESTINO,FECHA,COMPANIA,N_PLAZAS_DISPONIBLES,PRECIO from LISTA_VUELOS_PRECIO")
				
					do while not resultado.EOF
					Response.Write("<tr><td><center><a href=reserva_vuelo_formulario.asp?id=" & resultado("IDVUELO") & "> <b>Reservar</b> </a></center></td><td> " & resultado("CIUDAD_ORIGEN") & " </td><td> " & resultado("CIUDAD_DESTINO") & " </td><td> " & resultado("FECHA") & " </td><td> " & resultado("COMPANIA") & " </td><td> " & resultado("N_PLAZAS_DISPONIBLES") & " </td><td> " & resultado("PRECIO") & " </td></tr>")
						'Nos desplazamos por el RecorSet
						resultado.MoveNext
					loop
				end if
				%>
				
				<%
				if (origin<>"") and (destination1="") then
					Set resultado = Conexion.Execute("select IDVUELO,CIUDAD_ORIGEN,CIUDAD_DESTINO,FECHA,COMPANIA,N_PLAZAS_DISPONIBLES,PRECIO from LISTA_VUELOS_PRECIO where CIUDAD_ORIGEN='" & origin & "'")
				
					do while not resultado.EOF
					Response.Write("<tr><td><center><a href=reserva_vuelo_formulario.asp?id=" & resultado("IDVUELO") & "> <b>Reservar</b> </a></center></td><td> " & resultado("CIUDAD_ORIGEN") & " </td><td> " & resultado("CIUDAD_DESTINO") & " </td><td> " & resultado("FECHA") & " </td><td> " & resultado("COMPANIA") & " </td><td> " & resultado("N_PLAZAS_DISPONIBLES") & " </td><td> " & resultado("PRECIO") & " </td></tr>")
						'Nos desplazamos por el RecorSet
						resultado.MoveNext
					loop
				end if
				%>
				
				<%
				if (origin="") and (destination1<>"") then
					Set resultado = Conexion.Execute("select IDVUELO,CIUDAD_ORIGEN,CIUDAD_DESTINO,FECHA,COMPANIA,N_PLAZAS_DISPONIBLES,PRECIO from LISTA_VUELOS_PRECIO where CIUDAD_DESTINO='" & destination1 & "'")
				
					do while not resultado.EOF
					Response.Write("<tr><td><center><a href=reserva_vuelo_formulario.asp?id=" & resultado("IDVUELO") & "> <b>Reservar</b> </a></center></td><td> " & resultado("CIUDAD_ORIGEN") & " </td><td> " & resultado("CIUDAD_DESTINO") & " </td><td> " & resultado("FECHA") & " </td><td> " & resultado("COMPANIA") & " </td><td> " & resultado("N_PLAZAS_DISPONIBLES") & " </td><td> " & resultado("PRECIO") & " </td></tr>")
						'Nos desplazamos por el RecorSet
						resultado.MoveNext
					loop
				end if
				%>
				
			</table>
			<button onclick="location.href = 'reserva_vuelo_busqueda.asp'">Atras</button>
		</div>

	</main>

  </body>
</html>