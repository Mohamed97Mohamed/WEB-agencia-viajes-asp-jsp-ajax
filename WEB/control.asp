<html>
<title>Control</title>
<body>

	<%
	dim usu
	usu = request.form("usuario")
	dim pass
	pass = request.form("password")
	
	'if StrComp(usu,"admin",0) & pass=1234 then
		'session("AUTENTIFICADO")= 1
		'response.redirect("companias_update.asp")
		
	'else
		'response.redirect("pagina_inicial.html")
	'end if
	
	if usu = "admin" and pass="1234" then
		session("AUTENTIFICADO")= 1
		response.redirect("administrador.asp")
		
	else
		response.redirect("pagina_inicial.html")
	end if
	%>
</body>
</html>