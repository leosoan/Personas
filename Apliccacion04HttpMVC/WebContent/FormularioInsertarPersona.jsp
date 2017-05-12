<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">

<head>

<link rel="stylesheet" type="text/css" href="css/formato.css"/>
<script type="text/javascript" src="js/validacion.js">
</script>

<title>Persona BD</title>
<style type="text/css"> font-weigth:bold;</style>
</head>


<body>

<form action="ControladorPersonas" method="get">
<input type="hidden" name="navigation" value="/InsertarPersona.do"/>
<fieldset>
<legend> Formulario alta Persona </legend>

<p><label for="nombre">Nombre: </label>
<input id="nombre" type="text" name = "nombre"/>
</p>

<p> <label for="apellidos">Apellidos: </label>
<input id="apellidos" type="text" name= "apellidos"/>
</p>

<p> <label for="direccion">Direccion:</label>
<input id="direccion" type="text" name = "direccion"/>
</p>

<p> <label for="edad">Edad:</label>
<input id="edad" type="text" name = "edad"/>
</p>

<p> <label for="email">Email:</label>
<input id="email" type="text" name = "email"/>
</p>

<p>
<input type="submit" value="Insertar" />
</p>

</fieldset>
</form>

</body>
</html>