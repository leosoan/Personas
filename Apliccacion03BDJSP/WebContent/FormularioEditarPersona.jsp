<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/formato.css"/>
<script type="text/javascript" src="js/validacion.js">
</script>
<title>Insert title here</title>
</head>

<%@ page import="java.util.List"%>
<%@ page import="com.agsnasoft.Persona.Persona"%>

<body>
<%Persona persona = Persona.buscarPorClave(Integer.valueOf(request.getParameter("id")));%>
<form id = "formularioEdicion" action = "SalvarPersona.jsp">
<fieldset>
<legend> Formulario alta Persona </legend>

<input type="hidden" id="id" name="id" value = "<%=persona.getId()%>"/>

<p><label for="nombre">Nombre: </label>
<input type="text" id="nombre" name="nombre" value = "<%=persona.getNombre()%>"/>
</p>

<p> <label for="apellidos">Apellidos: </label>
<input type="text" id="apellidos" name="apellidos" value = "<%=persona.getApellidos()%>"/>
</p>

<p> <label for="direccion">Direccion:</label>
<input type="text" id="direccion" name="direccion" value = "<%=persona.getDireccion()%>"/>
</p>

<p> <label for="edad">Edad:</label>
<input type="text" id="edad" name="edad" value = "<%=persona.getEdad()%>"/>
</p>

<p> <label for="email">Email:</label>
<input type="text" id="email" name="email" value = "<%=persona.getEmail()%>"/>
</p>

<p>
<input type="submit" value="Salvar" />
</p>

</fieldset>
</form>

</body>
</html>