<!-- #include file=conexion.asp -->
<html>
<body>

<%
	idcompania=request.form("idcompania")
	compania=request.form("compania")
	
	SentenciaSQL = "Update COMPANIA set COMPANIA='" & compania & "' where IDCOMPANIA=" & idcompania
	
	Set rs = Conexion.Execute(SentenciaSQL)
	
	Conexion.Close
	Set Conexion = nothing
	response.redirect("companias_update.asp")
%>
</body>
</html>