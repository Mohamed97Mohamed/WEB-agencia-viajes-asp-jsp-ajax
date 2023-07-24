<!-- #include file=conexion.asp -->
<html>
<body>
<%
	id_recibido=request.querystring("id")

	SentenciaSQL = "Update RESERVA set CANCELADO=" & 1 & " where IDRESERVA=" & id_recibido
	
	Set rs = Conexion.Execute(SentenciaSQL)
	
	
	Conexion.Close
	Set Conexion = nothing
	response.redirect("reserva_vuelo_busqueda.asp")
%>
</body>
</html>