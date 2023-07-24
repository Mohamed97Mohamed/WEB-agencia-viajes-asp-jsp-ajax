# Proyecto WEB - Aplicacion Web agencia de viajes con ASP, JSP y Ajax
## Introducción
En este proyecto, desarrollamos una aplicación web para una agencia de viajes que permite la gestión de reservas de vuelos online. La aplicación consta de dos zonas: una pública con información de la empresa y búsqueda de vuelos, y otra zona privada accesible tras identificación para consultar reservas realizadas.

### Tecnologías Utilizadas
+ Parte Estática: XHTML y CSS
+ Parte Dinámica: ASP con lenguaje VBScript y JSP
+ Base de Datos: Firebird a través de ODBC
+ Herramienta para gestionar la BBDD: IBManager Lite

### Versiones utilizadas
1. Firebird-1.0.3.972-Win32
2. Firebird_ODBC_1.2.0.69-Win32
3. Jaybird-2.2.4-JDK_1.7

### Base de Datos
El proyecto emplea una base de datos Firebird, y dispone de las siguientes tablas:

+ Ciudad: Información sobre ciudades desde y hacia las que se pueden realizar vuelos, incluyendo el precio de las tasas de aeropuerto.
+ Compañía: Datos de las compañías aéreas con las que opera la empresa.
+ Vuelo: Información de los vuelos, como ciudad de origen, destino, fecha y hora de salida, compañía, duración, número de plazas disponibles, avión, etc.
+ Avión: Tabla con los modelos de avión, incluyendo el número de plazas y el precio base del vuelo.
+ Reserva: Registros de solicitudes de reserva de vuelo, con un número identificativo único, nombre y apellidos del cliente, DNI, vuelo y número de asientos reservados.


## Desarrollo de la Interfaz Básica
El sitio web de la agencia de viajes permite la gestión de compañías y reservas.

### Gestión de Compañías
Para acceder a este apartado, es necesario realizar un acceso identificado de administrador. Una vez autenticado, se muestra un listado de todas las compañías disponibles con las que se puede volar.

Al hacer clic sobre una compañía, se accede a la ficha "Detalles de la Compañía", donde se puede modificar el nombre de la compañía (excepto el IDCOMPANIA, que es asignado automáticamente).

Además, hay un botón para añadir una nueva compañía y otro para eliminar compañías de la base de datos.

### Gestión de Reservas
Cualquier usuario puede consultar vuelos disponibles mediante un formulario de consulta. Si se dejan campos en blanco, se devuelve una lista de todos los vuelos disponibles; si se rellenan los campos, se muestran vuelos que cumplan las condiciones expresadas.

El precio del vuelo se calcula según la fórmula: Precio = (Nº Plazas del avión – Nº Plazas Disponibles) / Nº Plazas del avión * Precio Base del vuelo + Tasas aeropuerto.

Después de obtener el listado de vuelos disponibles, el usuario puede realizar una reserva sobre uno de ellos. Se comprueba que haya plazas suficientes y se actualiza el número de plazas disponibles tras realizar la reserva.

Se proporciona al usuario un identificador único de la reserva realizada para consultas posteriores, y se muestra el precio tras seleccionar el número de asientos a reservar.

Tras la reserva del vuelo de ida, la interfaz muestra los posibles vuelos de vuelta, permitiendo al usuario realizar una segunda reserva.

Además, el usuario puede consultar reservas realizadas utilizando su DNI y el número de reserva generado. Se puede cancelar la reserva, y si faltan menos de 48 horas para la salida del vuelo, se muestra un mensaje de error indicando que ha finalizado el plazo máximo de cancelación.

## Inclusión de Técnicas Ajax en la Interfaz de Usuario
Una vez completada la versión básica de la interfaz, desarrollamos una versión alternativa que permite la búsqueda de vuelos mediante técnicas AJAX. Esto permite una experiencia más fluida al usuario, con recargas de datos en segundo plano y sin necesidad de recargar la página completa.

## Inserción de Técnicas JSP
En esta parte del proyecto, desarrollamos dos nuevas funcionalidades utilizando tecnología JSP.

### Consulta de Reservas
Se añade una nueva página accesible desde la página principal que muestra un listado de reservas realizadas a partir del DNI del cliente y una ciudad de origen. Se implementa un formulario para solicitar el DNI y la ciudad de origen del vuelo, y se muestra un botón para llamar a la página JSP encargada de recuperar los datos.

Los datos se muestran en una tabla con información relevante sobre las reservas.

### Inserción de Ciudades
Se añade una nueva página accesible solo para el acceso identificado de administrador, que permite introducir ciudades en la base de datos. Se implementa un formulario para solicitar los datos de la ciudad (IDCIUDAD, CIUDAD y TASA_AEROPUERTO) y un botón para insertar los datos de la ciudad en la base de datos y mostrar un mensaje de confirmación al usuario.

## Configuración del Entorno
Siga los siguientes pasos para poner en marcha las herramientas necesarias para la implementación del proyecto:

1. Recomendable: Instale una máquina virtual Oracle Virtual Box o similar en la que se monta todo el software necesario para el proyecto.
2. Descargue los archivos necesarios de la página del proyecto, incluyendo el servidor de Firebird, el driver ODBC para Firebird, la plantilla de la base de datos Agencia.fdb, y otros archivos.
3. Instale Internet Information Server (IIS) 5.1 en Windows XP o Internet Information Services en Windows 7. Asegúrese de seleccionar ASP durante la instalación.
   
![Imagen1](https://github.com/Mohamed97Mohamed/WEB-agencia-viajes-asp-jsp-ajax/assets/119499277/d3cb30f4-e832-405e-8cf2-1a164ba5cdb3)

4. Instale el Servidor de Firebird, configure el puerto 3050 y tenga en cuenta los cortafuegos.
5. Configure el driver ODBC para Firebird y establezca la conexión con la base de datos Agencia.fdb.

![Imagen2](https://github.com/Mohamed97Mohamed/WEB-agencia-viajes-asp-jsp-ajax/assets/119499277/a325dc58-8052-4073-9212-4d5ff7c30f67)

![Imagen3](https://github.com/Mohamed97Mohamed/WEB-agencia-viajes-asp-jsp-ajax/assets/119499277/58201fe4-ba89-4b0e-a1ab-044dc35f1622)

![Imagen4](https://github.com/Mohamed97Mohamed/WEB-agencia-viajes-asp-jsp-ajax/assets/119499277/fb115f15-d59d-481c-b278-b091ab5368b0)

6.Configure la conexión a la base de datos de agencia en EMS IBManager.

![Imagen5](https://github.com/Mohamed97Mohamed/WEB-agencia-viajes-asp-jsp-ajax/assets/119499277/8c63aaa6-0960-4485-84ba-1ea687eb3d2c)

7.Pruebe la conexión

![Imagen6](https://github.com/Mohamed97Mohamed/WEB-agencia-viajes-asp-jsp-ajax/assets/119499277/fb7524e7-f763-446e-a7be-14185a201fb8)

![Imagen7](https://github.com/Mohamed97Mohamed/WEB-agencia-viajes-asp-jsp-ajax/assets/119499277/120d7ded-1a31-4554-a74b-725d1c6d8214)

8. Para la parte JSP, descargue el driver JDBC Firebird (Jaybird) 
9. Descargue e instale JDK de Java y Tomcat 7
10. Compruebe que Tomcat se ha instalado correctamente
11. Editar el archivo server.xml del servidor Tomcat, añadiendo el siguiente texto justo antes de la etiqueta de cierre </Host> (al final
del archivo), tiendo en cuenta que está configurado para una aplicación denominada /prueba en la carpeta especificada.

![Imagen8](https://github.com/Mohamed97Mohamed/WEB-agencia-viajes-asp-jsp-ajax/assets/119499277/6c1a59cd-d82b-462e-83de-37c3c4dc9588)

![Imagen9](https://github.com/Mohamed97Mohamed/WEB-agencia-viajes-asp-jsp-ajax/assets/119499277/4ce9dee6-7ec2-4d9f-8927-efa54c55d02e)

![Imagen10](https://github.com/Mohamed97Mohamed/WEB-agencia-viajes-asp-jsp-ajax/assets/119499277/7f917180-5497-4b82-9186-92d9c30e9787)

























   
