package com.agsnasoft.Persona;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import java.sql.SQLException;
import java.lang.reflect.Method;

import java.sql.ResultSet;
public class Persona {

	private Integer id;
	private String nombre;
	private String apellidos;
	private String  direccion;
	private Integer edad;
	private String  email;
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edad) {
		this.edad = edad;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Persona() {
		super();
	}

	public Persona(Integer id, String nombre, String apellidos, String direccion, Integer edad, String email) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.direccion = direccion;
		this.edad = edad;
		this.email = email;
	}
	
	public void insertar () throws DataBaseException{	
		String consultaSQL = "INSERT INTO personas (nombre, apellidos, direccion, edad, email) VALUES ";
		consultaSQL += "('"+this.nombre+"','"+this.apellidos+"','"+this.direccion+"','"+String.valueOf(this.edad)+"','"+this.email+"')";
		
		DataBaseHelper helper = new DataBaseHelper();
		helper.modificarRegistro(consultaSQL);
	}
	
	public static List<Persona> buscarTodos(){
		String consultaSQL = "SELECT id, nombre, apellidos, direccion, edad, email FROM personas";
		DataBaseHelper<Persona> helper = new DataBaseHelper<Persona>();
		List<Persona> listaDePersonas = helper.seleccionarRegistros(consultaSQL); //, Persona.class);
		
		return listaDePersonas;
	}
	
	public void borrar() throws DataBaseException{
		String consultaSQL = "DELETE FROM Personas WHERE id = '"+ this.id+"'";
		DataBaseHelper<Persona>  helper = new DataBaseHelper<Persona>();
		helper.modificarRegistro(consultaSQL);
	}
	
	public static Persona buscarPorClave (Integer id){
		String consultaSQL = "SELECT id, nombre, apellidos, direccion, edad, email FROM personas WHERE id ='" + id + "'";
		
		DataBaseHelper <Persona> helper = new DataBaseHelper <Persona>();
		List <Persona> listaDePersonas = helper.seleccionarRegistros(consultaSQL);
		
		return listaDePersonas.get(0);
		
	}
	
	public void salvar () throws DataBaseException{
		String consultaSQL = "UPDATE Personas SET nombre = '" + this.nombre+ "', apellidos ='"+ this.apellidos+ "', direccion ='"+ this.direccion+ "', edad ='"+ String.valueOf(this.edad)+ "', email ='"+ this.email+"' WHERE id ='"+id+"'";
				
		DataBaseHelper<Persona> helper = new DataBaseHelper <Persona>();
		helper.modificarRegistro(consultaSQL);
	}
	
	public static List <Persona> buscarPorNombre (String nombre){
		String consultaSQL = "SELECT id, nombre, apellidos, direccion, edad, email FROM Personas WHERE nombre='"+ nombre+"'";
		
		DataBaseHelper <Persona> helper = new DataBaseHelper <Persona>();
		List <Persona> listaDePersonas = helper.seleccionarRegistros (consultaSQL);
		
		return listaDePersonas;		
	}
	
	public static List <Persona> buscarPorIdNum (Integer id){
		String consultaSQL = "SELECT id, nombre, apellidos, direccion, edad, email FROM Personas WHERE nombre='"+ id+"'";
		
		DataBaseHelper <Persona> helper = new DataBaseHelper <Persona>();
		List <Persona> listaDePersonas = helper.seleccionarRegistros (consultaSQL);
		
		return listaDePersonas;		
	}
	
	public static List <Persona> ObtenerIdDePersona(Persona persona){
		String consultaSQL = "SELECT id, nombre, apellidos, direccion, edad, email FROM Personas WHERE nombre='"+ persona.nombre+"' AND apellidos='"+persona.apellidos+"' AND direccion='"+persona.direccion+"' AND  edad='"+persona.edad+"' AND email='"+persona.email+"'";

		DataBaseHelper <Persona> helper = new DataBaseHelper <Persona>();
		List <Persona> listaDePersonas = helper.seleccionarRegistros (consultaSQL);
		
		return listaDePersonas;	
	}

	@Override
	public String toString() {
		return "Persona [id=" + id + ", nombre=" + nombre + ", apellidos=" + apellidos + ", direccion=" + direccion
				+ ", edad=" + edad + ", email=" + email + "]";
	}
	
	
}