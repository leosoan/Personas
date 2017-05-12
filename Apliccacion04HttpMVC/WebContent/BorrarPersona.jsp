<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="com.agsnasoft.Persona.Persona"%>
<%@ page import="com.agsnasoft.Persona.DataBaseException"%>
<%
try {
	String id = request.getParameter("id");
	Integer idInt;
	if (id.matches("[0-9]*") && id.trim()!="") idInt = Integer.valueOf(id.trim()); else idInt =0;
	
	Persona persona = new Persona(idInt,"Nombre","Apellidos","Direccion",0,"Email");
	persona.borrar();
	response.sendRedirect("MostrarPersonas.do");
} catch (DataBaseException e)
{ out.println(e.getMessage());
}

%>

</body>
</html>