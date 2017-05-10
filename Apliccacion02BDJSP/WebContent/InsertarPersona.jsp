<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- sentencias de import necesarias para jdbc-->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="javax.servlet.http.HttpServlet"%>

<%
	//1
	//String idn = request.getParameter("id");
	String nombre = request.getParameter("nombre");
	String apellidos = request.getParameter("apellidos");
	String direccion = request.getParameter("direccion");
	String edad = request.getParameter("edad");
	String email = request.getParameter("email");
	Integer edadInt;
	if (edad.matches("[0-9]*") && edad.trim()!="") edadInt = Integer.valueOf(edad.trim()); else edadInt =0;

	Connection conexion = null;
	Statement sentencia = null;
	int filas=0;
	try {
		//2
		Class.forName("com.mysql.jdbc.Driver");
		conexion = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/personasLeo",
			"root",
			"root");
			sentencia = conexion.createStatement();
		//3
		String consultaSQL = "INSERT INTO personas (nombre, apellidos, direccion, edad, email) values ";

		consultaSQL += "('" + nombre + "','" + apellidos + "','"+ direccion + "','"+ edadInt +"','"+ email + "')";
		//4
		filas = sentencia.executeUpdate(consultaSQL);
		response.sendRedirect("MostrarPersonas.jsp");
	} catch (ClassNotFoundException e) {
			System.out.println("Error en la carga del driver"
			+ e.getMessage());
	} catch (SQLException e) {
			System.out.println("Error accediendo a la base de datos"
			+ e.getMessage());
		} finally {
		//5
		if (sentencia != null) {
			try {sentencia.close();}
			catch (SQLException e)
			{System.out.println("Error cerrando la sentencia" +
			e.getMessage());}
		}
		if (conexion != null) {
			try {conexion.close();}
			catch (SQLException e)
			{System.out.println("Error cerrando la conexion" +
			e.getMessage());}
		}
}%>