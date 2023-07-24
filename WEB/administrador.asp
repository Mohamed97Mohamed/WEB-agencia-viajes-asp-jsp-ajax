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
			<h2>Gestión de Compañias</h2>
			<button onclick="location.href = 'companias_update.asp'" style="width:auto;">Gestionar</button>
			
			<h2>Inserción Ciudades</h2>
			<button onclick="location.href = 'http://localhost:8081/prueba/insertarCiudades.jsp'" style="width:auto;">Insertar</button>
			
			<%else response.redirect("pagina_inicial.html")%>
			<%end if%>

		</div>

	</main>

  </body>
</html>