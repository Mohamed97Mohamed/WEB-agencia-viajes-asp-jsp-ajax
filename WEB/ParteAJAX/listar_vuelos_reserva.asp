<!-- #include file=conexion.asp -->
<html>
  <head>
    <title>Listar Vuelos</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="stylesheet" type="text/css" href="stilo.css"/>
	<script type="text/javascript">
		// FUNCIONES JAVASCRIPT
		// Creamos el objeto AJAX httprequest
		function AJAXCrearObjeto(){
		var obj;
		if (window.XMLHttpRequest) { // no es IE
		obj = new XMLHttpRequest();
		//alert('El navegador no es IE');
		}
		else { // Es IE o no tiene el objeto
		try {
		obj = new ActiveXObject("Microsoft.XMLHTTP");
		// alert('El navegador utilizado es IE');
		}
		catch (e) {
		// alert('El navegador utilizado no está soportado');
		}
		}
		//alert('realizado');
		return obj;
		}
		// Recibe y muestra los vuelos que pertenecen a la compania seleccionada
		function leerDatos(){
			// Comprobamos que se han recibido los datos
			if (oXML.readyState == 4) {
				// Accedemos al XML recibido
				var xml = oXML.responseXML.documentElement;
				
				// Accedemos al componente html correspondiente a la tabla
				var tabla = document.getElementById('tabla_vuelos');
				// Vaciamos el DIV
				var definicion_tabla = new String("");
				// cadena con los datos para crear la tabla
				definicion_tabla ='<th>ID</th><th>Ciudad Origen</th><th>Ciudad Destino</th><th>Fecha</th><th>Compa&ntilde;&iacute;a</th><th>Plazas Disponibles</th><th>Duraci&oacute;n</th><th>Precio</th><tr>';
				// Iteramos cada vuelo
				var v;
				var item;
				for (i = 0; i < xml.getElementsByTagName('vuelo').length; i++){
					// Accedemos al objeto XML
					item = xml.getElementsByTagName('vuelo')[i];
					// Recuperamos el identificador de vuelo
					v = item.getElementsByTagName('idvuelo')[0].firstChild.data;
					// Añadimos el campo a la tabla
					definicion_tabla =definicion_tabla+'<td>'+ v +'</td>';
					// Recuperamos el id de la ciudad de origen
					v = item.getElementsByTagName('ciudad_origen')[0].firstChild.data;
					// Añadimos el campo a la tabla
					definicion_tabla =definicion_tabla+'<td>'+ v +'</td>';
					// Recuperamos el id de la ciudad destino
					v = item.getElementsByTagName('ciudad_destino')[0].firstChild.data;
					
					// Añadimos el campo a la tabla
					definicion_tabla= definicion_tabla+'<td>' + v +'</td>';
					// Recuperamos la fecha
					v = item.getElementsByTagName('fecha')[0].firstChild.data;
					// Añadimos el campo a la tabla
					definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
					// Recuperamos la compania
					v = item.getElementsByTagName('compania')[0].firstChild.data;
					// Añadimos el campo a la tabla
					definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
					// Recuperamos el numero de planzas disponibles
					v = item.getElementsByTagName('n_plazas_disponibles')[0].firstChild.data;
					// Añadimos el campo a la tabla
					definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
					// Recuperamos la duracion del vuelo
					v = item.getElementsByTagName('duracion')[0].firstChild.data;
					// Añadimos el campo a la tabla
					definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
					// Recuperamos el precio
					v = item.getElementsByTagName('precio')[0].firstChild.data;
					// añadimo el campo a la tabla
					definicion_tabla= definicion_tabla+'<td>' + v + '</td></tr>';
				}
				// rellenamos el objeto html tabla con la definicion construida
				tabla.innerHTML = definicion_tabla;
			}
		}
		function mostrar_vuelos(){
			// recupera el objeto html desplegable de companias
			var valorOrigen=document.getElementById("origen").value;
			var valorDestino=document.getElementById("destino").value;
			
			//Sacamos el texto de option de Origen
			var origen=document.getElementById("origen");
			var origenIndice=origen.selectedIndex;
			var origenSelect=origen.options[origenIndice].text;
			//Sacamos el texto de option de Destino
			var destino=document.getElementById("destino");
			var destinoIndice=destino.selectedIndex;
			var destinoSelect=destino.options[destinoIndice].text;
		
			
			
			if (valorOrigen==0 && valorDestino!=0){
			
				// crea el objeto httprequest
				oXML = AJAXCrearObjeto();
				oXML.open('POST', 'consultaDestino.asp');
				oXML.onreadystatechange = leerDatos;
				oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				// lanza la peticion enviando los parametros
				oXML.send('destino='+destinoSelect);
			
			}else if(valorOrigen!=0 && valorDestino==0){
				
				// crea el objeto httprequest
				oXML = AJAXCrearObjeto();
				oXML.open('POST', 'consultaOrigen.asp');
				oXML.onreadystatechange = leerDatos;
				oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				// lanza la peticion enviando los parametros
				oXML.send('origen='+origenSelect);
			}else if(valorOrigen!=0 && valorDestino!=0){
				console.log(origenSelect)
				console.log(destinoSelect)
				oXML = AJAXCrearObjeto();
				//oXML.open('GET', 'consultaConjunta.asp?origen='+origenSelect&'destino='+destinoSelect);
				oXML.open('POST', 'consultaConjunta.asp');
				oXML.onreadystatechange = leerDatos;
				oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				// lanza la peticion enviando los parametros
				//oXML.send('');
				oXML.send('origen='+origenSelect+'&destino='+destinoSelect);

			}
			//var origen=document.getElementById("origen");
			//var origenIndice=origen.selectedIndex;
			//var origenSelect=origen.options[origenIndice].text;
			
			//var valorx=document.getElementById("origen").value;
			// crea el objeto httprequest
			//oXML = AJAXCrearObjeto();
			//oXML.open('POST', 'consultaOrigen.asp');
			//oXML.onreadystatechange = leerDatos;
			//oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			// lanza la peticion enviando los parametros
			//oXML.send('origen='+origenSelect);
		}
		

	</script>
  </head>
  <body>
  
	
	<header>
		
		<div class="container logo-nav-container">
			<h1 style="font-size:2em; text-align:center">ARARAT AIRWAYS</h1>
			
		</div>

	</header>
	

	<main>
	
		<div class="container productos">
			
			
			<h2>Gestión de Reservas</h2>
			<h3>Buscar Vuelos</h3>
			Origen:
			<select name="origen" id="origen" onChange="return mostrar_vuelos()">
				<option value='0'> </option>
				<%
					Set consulta = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
					
						'Recorremos el RecordSet
						do while not consulta.EOF
							Response.Write("<option value='" & consulta("IDCIUDAD") & "'>" & consulta("CIUDAD") &"</option>")
								consulta.MoveNext
						loop
				%>
			</select>
			Destino:
			<select name="destino" id="destino" onChange="return mostrar_vuelos()">
				<option value='0'> </option>
				<%
					Set destino = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
					
						'Recorremos el RecordSet
						do while not destino.EOF
							Response.Write("<option>" & destino("CIUDAD") & "</option>")
								destino.MoveNext
						loop
				%>
			</select>
			
			<br><br>
			<table id="tabla_vuelos" name="tabla_vuelos" border=1>
			</table>

		</div>

	</main>

  </body>
</html>