package com.agsnasoft.Persona;

import java.util.List;

public class Persona {

	private Integer id;
	private String nombre;
	private String apellidos;
	private String  direccion;
	private Integer edad;
	private String  email;
	
	public Integer getId(){
		return id;
	}
	
	public Integer setId(){
		return this.id = id;
	}
	
	public String getNombre(){
		return nombre;
	}
	
	public String setNombre(){
		return this.nombre = nombre;
	}
	
	public String getApellidos(){
		return apellidos;
	}
	
	public String setApellidos(){
		return this.apellidos = apellidos;
	}
	
	
	public String getDireccion(){
		return direccion;
	}
	
	public String setDireccion(){
		return this.direccion = direccion;
	}	
	
	public Integer getEdad(){
		return edad;
	}
	
	public Integer setEdad(){
		return this.edad = edad;
	}	

	public String getEmail(){
		return email;
	}
	
	public String setEmail(){
		return this.email = email;
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
	
}