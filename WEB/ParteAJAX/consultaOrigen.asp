<!--#include file=conexion.asp-->
<%
	' Script ASP programado con VBScript
	' Realiza consulta en la base de datos y genera como resultato
	' una lista de vuelos en formato XML
	'on Error Resume Next
	' Accedemos al compañía enviado desde la pagina principal
	origen=request.form("origen")
	' El contenido a devolver es XML
	response.ContentType="text/xml"
	response.CacheControl="no-cache, must-revalidate"
	' Consulta SQL de las ciudades que son origen de algun vuelo
	'Set consulta1 = Conexion.Execute("select CIUDAD from CIUDAD where IDCIUDAD="&origen)
	'ciudad=consulta1("CIUDAD")
	SentenciaSQL = "select IDVUELO,CIUDAD_ORIGEN,CIUDAD_DESTINO,FECHA,COMPANIA,N_PLAZAS_DISPONIBLES,DURACION,PRECIO from LISTA_VUELOS_PRECIO where CIUDAD_ORIGEN='" & origen &"'" 
	Set rs = Conexion.Execute(SentenciaSQL)
	' Se genera una salida XML con la lista de vuelos
	if (not(rs.Eof)) then
	%><?xml version="1.0" encoding="UTF-8"?> <%
	response.write("<XML>")
	
		' Recorremos el Recorset
		do until rs.Eof
			response.write("<vuelo>")
				response.write("<idvuelo>")
				response.write( rs("IDVUELO") )
				response.write("</idvuelo>")
				response.write("<ciudad_origen>")
				response.write( rs("CIUDAD_ORIGEN") )
				response.write("</ciudad_origen>")
				response.write("<ciudad_destino>")
				response.write( rs("CIUDAD_DESTINO") )
				response.write("</ciudad_destino>")
				response.write("<fecha>")
				response.write( rs("FECHA") )
				response.write("</fecha>")
				response.write("<compania>")
				response.write( rs("COMPANIA") )
				response.write("</compania>")
				response.write("<n_plazas_disponibles>")
				response.write( rs("N_PLAZAS_DISPONIBLES") )
				response.write("</n_plazas_disponibles>")
				response.write("<duracion>")
				response.write( rs("DURACION") )
				response.write("</duracion>")
				response.write("<precio>")
				response.write( rs("PRECIO") )
				response.write("</precio>")
			response.write("</vuelo>")
			rs.MoveNext
		loop
		response.write("</XML>")
	end if
%>