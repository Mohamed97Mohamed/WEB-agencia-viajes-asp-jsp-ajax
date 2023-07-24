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
			
				'Recibimos el id de la ciudad a modificar mediante GET
				id_recibido=request.querystring("id")
				
				'Seleccionamos la Ciudad que tiene dicho id
				Set consulta = Conexion.Execute("select IDCOMPANIA, COMPANIA from COMPANIA where IDCOMPANIA=" & id_recibido)
				
				id=consulta("IDCOMPANIA")
				compania=consulta("COMPANIA")
				
			%>
			
			<h2>Modificar Compania</p>
			
			<form action="companias_update_final.asp" method="post">
				<table>
					<tr><td>C&oacute;digo Compania:</td><td><input type="text" name="idcompania"
						readonly value=<% response.write(id)%>>
					</td></tr>
					<tr><td>Ciudad:</td><td><input type="text" name="compania"
						value="<% response.write(compania)%>">
					</td></tr>
				</table>
				<button type="submit">Modificar</button>
				
			</form>
			<button onclick="location.href = 'companias_update.asp'">Atras</button>
			<%else response.redirect("pagina_inicial.html")%>
			<%end if%>

		</div>

	</main>

  </body>
</html>