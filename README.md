Proyecto final de Desarrollo Web Full Stack de Acámica.

DESCRIPCION GENERAL:
Generarás una herramienta que permita a una compañía de Marketing administrar todos los contactos de sus clientes para sus campañas.

INSTALACIÓN:
Clonar el proyecto de
https://github.com/EmilioAlmeida/emilio_datawarehouse

INSTALAR DEPENDENCIAS:
cors
express
helmet
jsonwebtoken
nodemon
mysql2
sequelize

IMPORTANTE:  si es necesario deberá modificar el archivo db.js con sus datos de entorno

BASE DE DATOS SQL: 
DOCUMENTO:  emilio_datawarehouse.sql
Instalar Xampp y abrir el panel de control, iniciando MySQL y Apache. Abrir el navegador con localhost, phpmyadmin y en sql crear el schema "emilio_datawarehouse" y replicar las tablas del documento.

INICIO DEL SERVIDOR:
En la terminal: nodemom backend/app.js 
Recibirá el mensaje: "El servidor se ha iniciado correctamente"

Dirigirse a la carpeta Frontend, al archivo index.html
activar Open with live server, con el boton derecho del mouse.

En el Login encontrará dos opciones de perfil:
USUARIO ADMINISTRADOR:  
USUARIO: almeida.emiliooscar@gmail.com
CONTRASEÑA: Password777

USUARIO BÁSICO:
USUARIO: maitenapalacio@hotmail.com
CONTRASEÑA: 810420

CONDICIONES PARA APROBAR EL PROYECTO:
a. Si elegiste Modo Compañía: el diseño debe ser igual al de referencia (tanto la estética como el flujo de pantallas).

b. Login: el sitio debe permitir el registro y login únicamente de usuarios creados en el sitio.

c. Header: si el usuario logueado no es administrador no debe mostrar el link de Usuarios.

d. CRUD de Usuario (solo usuarios de perfil administrador):

-Nombre

-Apellido

-Email

-Perfil

-Contraseña

e. CRUD de Región / País / Ciudad:

-Ciudades deben estar relacionadas con países

-Países deben estar relacionados con regiones

f. CRUD de Compañías:

-Nombre

-Teléfono

-Email

-Ciudad: relación con tabla o colección de ciudades.

-Dirección

g. CRUD de Contactos:

Datos de contacto:

-Nombre

-Apellido

-Email

-Compañía: relación con tabla o colección de compañías.

-Ciudad: relación con tabla o colección de ciudades.

-Dirección

-Canales de contacto: relación con uno o más canales de contacto. Si bien debes incluir Canales de contacto al cargar nuevos contactos, visibilizar esta información en la información de cada contacto en la vista principal es opcional .

h. Buscador de contactos: debes realizar al menos 1 de las 3 opciones ofrecidas en la guía de este documento.

-Añadir tags según búsquedas del usuario es una funcionalidad opcional.

-Selección múltiple: debe mostrar la cantidad de contactos a medida que se van seleccionando; debe permitir eliminarlos.

-Editar contacto: debe permitir editar cualquier dato de cualquier contacto.

-Eliminar contacto: debe permitir eliminar un contacto con la previa confirmación de esta acción.

-Importar / Exportar masivamente es una funcionalidad opcional.
