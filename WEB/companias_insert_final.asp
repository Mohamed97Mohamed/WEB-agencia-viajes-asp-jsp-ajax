<!-- #include file=conexion.asp -->
<html>
<body>
<%
	idcompania=request.form("idcompania")
	compania=request.form("compania")
	
	SentenciaSQL = "insert into COMPANIA values (" & idcompania & ", '" & compania & "')"
	
	Set rs = Conexion.Execute(SentenciaSQL)
	
	response.write("La compania se ha introducido con &eacute;xito en la Base de Datos.")
	
	Conexion.Close
	Set Conexion = nothing
	response.redirect("companias_update.asp")
%>
</body>
</html>