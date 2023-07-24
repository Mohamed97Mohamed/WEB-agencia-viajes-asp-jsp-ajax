<!-- #include file=conexion.asp -->
<html>
  <head>
    <title>Modificar Companias</title>
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
			<%
			nivel=session("AUTENTIFICADO")
			if nivel = 1 then
			%>
			
			
			<h2>Gestión de Companias</h2>
			<h3>Modificar Companias</h3>
			<div>
				<button onclick="location.href = 'companias_update.asp'">Editar</button>
				<button onclick="location.href = 'companias_insert.asp'">Añadir</button>
				<button onclick="location.href = 'companias_delete.asp'">Eliminar</button>
			
			</div>
			
			<table style="text-align:center">
				<tr><td><b>ID / EDITAR</b></td><td><b>COMPANIA</b></td></tr>

				<%
				Set resultado = Conexion.Execute("select IDCOMPANIA, COMPANIA from COMPANIA")
				
				'Recorremos el RecorSet
				do while not resultado.EOF
				Response.Write("<tr><td><center><a href=companias_update_formulario.asp?id=" & resultado("IDCOMPANIA") & "><b>Editar</b></a></center></td><td> " & resultado("COMPANIA") & " </td></tr>")
					'Nos desplazamos por el RecorSet
					resultado.MoveNext
				loop
				%>
			</table>
			<%else response.redirect("pagina_inicial.html")%>
			<%end if%>

		</div>

	</main>

  </body>
</html>