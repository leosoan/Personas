<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- sentencias de import necesarios para jdbc-->

<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.agsnasoft.Persona.DataBaseHelper"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.agsnasoft.Persona.Persona"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Personas</title>
</head>
<body>

<form action="MostrarPersonas.jsp" onsubmit="return validacion();">

<p><label for="nombre">Nombre: </label>
<input id="nombre" type="text" name = "nombre"/>
<input type="submit" value="Filtrar" />
</p>
	<a href="FormularioInsertarPersona.jsp"> Insertar Persona </a>
	<br/>
	<br/>
<%
		List<Persona> listaDePersonas = null;
		
		if (request.getParameter("nombre")==null){
		listaDePersonas = Persona.buscarTodos();
		}
		else {
			listaDePersonas = Persona.buscarPorNombre(request.getParameter("nombre"));
		}
				
		for( Persona persona: listaDePersonas){ %>
			<%=persona.getId()%>
			<%=persona.getNombre()%>
			<%=persona.getApellidos()%>
			<%=persona.getDireccion()%>
			<%=persona.getEdad()%>
			<%=persona.getEmail()%>
			<a href="BorrarPersona.jsp?id=<%=persona.getId()%>">Borrar</a>
			<a href="FormularioEditarPersona.jsp?id=<%=persona.getId()%>">Editar</a>
			<br/>
		<%}
%>	
	</body>
	</html>
	