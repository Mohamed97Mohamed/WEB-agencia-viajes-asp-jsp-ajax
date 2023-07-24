<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,org.firebirdsql.management.*"%>

<html>
	<head>
		<title>Cancelar Vuelos</title>
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
			
			<%
			
				String idciudad= request.getParameter("idciudad");
				String ciudad= request.getParameter("ciudad");
				String tasa_aeropuerto = request.getParameter("tasa_aeropuerto");
			
				String sqlString = "insert into CIUDAD values (" + idciudad + ", '" + ciudad + "', '" + tasa_aeropuerto + "')";
			
			
			PreparedStatement sentenciaInsert = null;
			try{
			sentenciaInsert = connRSFind.prepareStatement(sqlString);
			sentenciaInsert.execute(); 
			%>
			<p>Registro insertado correctamente</p> <!--Si llegamos aquí, todo OK, si no, error-->
			error
			
			<%
			}catch(SQLException e1){
			%>

			<p>Error: <%=e1.getMessage()%></p>

			<%
			}
			if (sentenciaInsert != null)
			sentenciaInsert.close();
			if (connRSFind != null)
			connRSFind.close();
			%>
			<br>
			<br>
			<button onclick="location.href = 'insertarCiudades.jsp'"  style="width:auto;">Insertar otra Ciudad</button>

		</div>

	</main>
  </body>
</html>