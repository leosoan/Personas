<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<%@ page import="com.agsnasoft.Persona.Persona"%>

<body>

<% 
	String id = request.getParameter("id");
	String nombre = request.getParameter("nombre");
	String apellidos = request.getParameter("apellidos");
	String direccion = request.getParameter("direccion");
	String edad = request.getParameter("edad");
	String email = request.getParameter("email");
	
	Integer idInt = Integer.valueOf(id);
	Integer edadInt;
	if (edad.matches("[0-9]*") && edad.trim()!="") edadInt = Integer.valueOf(edad.trim()); else edadInt =0;
	
	Persona persona = new Persona(idInt, nombre, apellidos, direccion, edadInt, email);
	
	persona.salvar();
	response.sendRedirect("MostrarPersonas.jsp");
%>

</body>
</html>