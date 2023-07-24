<!-- #include file=conexion.asp -->
<html>
<body>
<%
	idreserva=request.form("idreserva")
	apellidos=request.form("apellidos")
	nombre=request.form("nombre")
	nif=request.form("dni")
	idvuelo=request.form("idvuelo")
	N_Asientos=request.form("nAsientos")
	
	
	SentenciaSQL = "insert into RESERVA values (" & idreserva & ", '" & apellidos & "','" & nombre & "', '" & nif & "', " &idvuelo&", "& N_Asientos & ", " & 0 &")"
	
	Set rs = Conexion.Execute(SentenciaSQL)
	
	
	Conexion.Close
	Set Conexion = nothing
	response.redirect("reserva_vuelo_busqueda.asp")
%>
</body>
</html>