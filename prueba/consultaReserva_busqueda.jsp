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
				String dni= request.getParameter("dni");
				String ciudad_origen= request.getParameter("ciudad_origen");
			
				String sqlString = "SELECT DISTINCT * FROM RESERVA r, LISTA_VUELOS_PRECIO l WHERE l.CIUDAD_ORIGEN = \'" + ciudad_origen +"\' AND r.NIF = \'" + dni +"\'";
			
			%>
			
			<table>
				<tr><th>Reserva</b></th><th>IdVuelo</th><th>Apellidos</th><th>Nombre</th><th>Ciudad Origen</th><th>Ciudad Destino</th><th>Fecha</th><th>Compania</th><th>Estado</th></tr>

				<%
				   PreparedStatement StatementRSFind = null;
				   ResultSet RSFind = null;
				   boolean resultException = false;
				   boolean rsReady = false;

				   try{
					  StatementRSFind = connRSFind.prepareStatement(sqlString);
					  RSFind = StatementRSFind.executeQuery();
					  rsReady = RSFind.next();
				   }catch(SQLException e1){
					  resultException = true;

				%>
				<p>Error: <%=e1.getMessage()%></p>
			
				<%
				}

				int i = 0;
				
				if (rsReady){
				   boolean done = false;
				   while (!done){
					  i++;
					  String IdReserva= RSFind.getString("IDRESERVA");
					  String IdVuelo = RSFind.getString("IDVUELO");
					  String apellidos = (String) RSFind.getObject("APELLIDOS");
					  String nombre = (String) RSFind.getObject("NOMBRE");
					  String origen = (String) RSFind.getObject("CIUDAD_ORIGEN");
					  String destino = (String) RSFind.getObject("CIUDAD_DESTINO");
					  String fecha = RSFind.getString("FECHA");
					  String compania = (String) RSFind.getString("COMPANIA");
					  String estado = RSFind.getString("CANCELADO");
		
				%>
				<tr><td><%=IdReserva%></td><td><%=IdVuelo%></td><td><%=apellidos%></td><td><%=nombre%></td><td><%=origen%></td><td><%=destino%></td><td><%=fecha%></td><td><%=compania%></td><td><%=estado%></td></tr>
				<%
						
						
					
				   done = !RSFind.next();
				} //End while loop

				RSFind.close();
				}
				else{
				%>
				<p>The result set was empty. Check to be sure database is running and settings in search.jsp are correct.</p>
				<%

				}
				if (StatementRSFind != null)
				StatementRSFind.close();

				if (connRSFind != null)
				connRSFind.close();

				%>
			
			</table>
			
			
			

		</div>

	</main>
  </body>
</html>