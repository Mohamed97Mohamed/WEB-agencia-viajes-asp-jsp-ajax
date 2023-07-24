<!-- #include file=conexion.asp -->
<html>
  <head>
    <title>Añadir Companias</title>
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
			<h3>Añadir Companias</h3>
			<div>
				<button onclick="location.href = 'companias_update.asp'">Editar</button>
				<button onclick="location.href = 'companias_insert.asp'">Añadir</button>
				<button onclick="location.href = 'companias_delete.asp'">Eliminar</button>
			
			</div>
			
			<form action="companias_insert_final.asp" method="post">
		
				<table>
					<tr>
						<td>C&oacute;digo Compania</td>
						<td><input type="text" name="idcompania"></td>
					</tr>
					<tr>
						<td>Compania</td>
						<td><input type="text" name="compania"></td>
					</tr>
					<tr>
						<td colspan=2>
							<center>
								<input type="submit" id="introducir_compania" value="Introducir Compania">
							</center>
						</td>
					</tr>
				</table>
			</form>
			
			<%else response.redirect("pagina_inicial.html")%>
			<%end if%>

		</div>

	</main>

  </body>
</html>