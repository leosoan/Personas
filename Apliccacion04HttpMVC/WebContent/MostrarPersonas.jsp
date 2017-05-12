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

<script>
function validacion(){
	var nombre=document.getElementById("nombre");
	var miformulario=document.getElementById(miformulario);
	if (nombre.value=="" || nombre== null || nombre.matches("[0-9]*")) {
		alert("Dato no valido");
		return false;
	}
	else {
			miformulario.submit();
			return true;
	}
}

function defecto(){
	miformulario.submit();
	return true;
}


</script>
<table border="1">
	<tr>
		<td>			
			<form action="ControladorPersonas" method="get">
  			<input type="hidden" name="navigation" value="/MostrarPersonas.do"/>
			<label for="nombre">Nombre : </label>
			<input id="nombre" type="text" name = "nombre"/>
			<input type="submit" value="Filtrar"/>
			</form>
		</td>
		<td>
			<form action="ControladorPersonas" method="get">
  			<input type="hidden" name="navigation" value="/FormularioInsertarPersona.do"/>
			<input type="submit" value="Insertar Persona">
			</form>
		<td>
	</tr>
</table>
<br>
<%
		List<Persona> listaDePersonas = (List) request.getAttribute("listaDePersonas");

		//List<Persona> listaDePersonas = (List) request.
		Persona p = (Persona) request.getAttribute("persona");
		//>System.out.print(listaDePersonas.size());
		if (listaDePersonas==null){
			listaDePersonas= new ArrayList<Persona> ();
		}
		if (p!=null){
			listaDePersonas.clear();
			listaDePersonas.add(p);

		}

		%>
		<table border="1">		
		<%for( Persona persona: listaDePersonas){ %>
			<tr>
			<td>
			<%=persona.getId()%>
			</td>
			<td>
			<%=persona.getNombre()%>
			<%=persona.getApellidos()%>
			<%=persona.getDireccion()%>
			<%=persona.getEdad()%>
			<%=persona.getEmail()%>
			</td>
				<td>
					<form action="ControladorPersonas" method="get">
  			  		<input type="hidden" name="navigation" value="/BorrarPersona.do"/>
   			 		<input type="hidden" name="id" value=<%=persona.getId()%>>
   			 		<input type="submit" value="Borrar"/>
    				</form>	
    			</td>		
    			<td>			
   			 		<form action="ControladorPersonas" method="get">
    				<input type="hidden" name="navigation" value="/FormularioEditarPersona.do"/>
   			 		<input type="hidden" name="id" value=<%=persona.getId()%>>
    				<input type="submit" value="Editar"/>
					</form>
				</td>
			</tr>
		<%}%>
		</table>	
	</body>
	</html>
	