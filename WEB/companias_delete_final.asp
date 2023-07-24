<!-- #include file=conexion.asp -->
<html>
<body>

	<%
	'Recibimos el id de la compania a modificar mediante GET
	id_recibido=request.querystring("id")
	
	'Seleccionamos la Compania que tiene dicho id
	Set consulta = Conexion.Execute("delete from COMPANIA where IDCOMPANIA=" & id_recibido)
	
	if Conexion.Errors.Count>0 then
		for each error in Conexion.Errors
			response.write(Error.Number & " = " & Error.Description)
		next
	else
		response.write("La compania se ha eliminado con exito.")
	end if
	
	Conexion.Close
	Set Conexion = nothing
	response.redirect("companias_update.asp")
	%>
	
</body>
</html>