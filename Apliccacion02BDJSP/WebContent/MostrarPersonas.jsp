<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Personas</title>
</head>
<body>
<a href="FormularioInsertarPersona.jsp">Insertar Persona</a>
<br/>
<br/>
<%
	Connection conexion=null;
	Statement sentencia=null;
	ResultSet rs=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		//1
		conexion =
		DriverManager.getConnection("jdbc:mysql://localhost:3306/personasLeo",
			"root",
			"root");
		sentencia= conexion.createStatement();
		//2
		String consultaSQL= "SELECT id, nombre, apellidos, direccion, edad, email FROM personas";
		//3 y 4
		rs=sentencia.executeQuery(consultaSQL);
		//5
		while(rs.next()) { %>
			<%=rs.getString("id")%>
			<%=rs.getString("nombre")%>
			<%=rs.getString("apellidos")%>
			<%=rs.getString("direccion")%>
			<%=rs.getString("edad")%>
			<%=rs.getString("email")%>
			<br/>
		<% }
	}catch (ClassNotFoundException e) {
		System.out.println("Error en la carga del driver"
		+ e.getMessage());
	}catch (SQLException e) {
		System.out.println("Error accediendo a la base de datos"
		+ e.getMessage());
	}
	finally {
		//6
		if (rs != null) {
			try {rs.close();} catch (SQLException e)
			{System.out.println("Error cerrando el resultset" + e.getMessage());}
		}
		if (sentencia != null) {
			try {sentencia.close();} catch (SQLException e)
				{System.out.println("Error cerrando la sentencia" + e.getMessage());}
			}
		if (conexion != null) {
			try {conexion.close();} catch (SQLException e)
				{System.out.println("Error cerrando la conexion" + e.getMessage());}
			}
		}
	%>
	
</body></html>