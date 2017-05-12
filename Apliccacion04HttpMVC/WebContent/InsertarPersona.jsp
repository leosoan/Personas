<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.agsnasoft.Persona.Persona"%>	

<%@ page import="org.apache.log4j.ConsoleAppender"%>
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="org.apache.log4j.PatternLayout"%>
<%@ page import="com.agsnasoft.Persona.DataBaseException"%>

<%
try {
	String nombre = request.getParameter("nombre");
	String apellidos = request.getParameter("apellidos");
	String direccion = request.getParameter("direccion");
	String edad = request.getParameter("edad");
	String email = request.getParameter("email");
	Integer edadInt;
	if (edad.matches("[0-9]*") && edad.trim()!="") edadInt = Integer.valueOf(edad.trim()); else edadInt =0;

	Persona persona = new Persona(0, nombre, apellidos, direccion, edadInt, email);
	persona.insertar();
			
	response.sendRedirect("MostrarPersonas.do");
} catch (DataBaseException e)
		{ out.println(e.getMessage());
		}

%>
	