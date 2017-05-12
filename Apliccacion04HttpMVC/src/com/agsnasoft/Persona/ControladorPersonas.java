package com.agsnasoft.Persona;

import java.lang.System;
import java.sql.Statement;
import java.io.IOException;
import java.sql.ResultSet;
import com.agsnasoft.Persona.DataBaseHelper;
import com.agsnasoft.Persona.DataBaseException;
import com.agsnasoft.Persona.Persona;

import  java.util.ArrayList;
import  java.util.List;
import  java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorPersonas extends HttpServlet{

	private static final long serialVersionUID = 1L;
	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher despachador = null;
		String navigation = request.getParameter("navigation");
		
		if (navigation.equals("/MostrarPersonas.do")){
			
			String nombre = request.getParameter("nombre").trim();
			if (nombre.isEmpty()) {nombre="*";
			}
			
			List <Persona> listaDePersonas = null;
			if (nombre.equals("*") || nombre==null) listaDePersonas = Persona.buscarTodos();
			else listaDePersonas = Persona.buscarPorNombre(nombre);

			request.setAttribute("listaDePersonas", listaDePersonas);		
			despachador = request.getRequestDispatcher("MostrarPersonas.jsp");
			
		} else if(navigation.equals("/FormularioInsertarPersona.do")){
			List <Persona> listaDeNombres = Persona.buscarPorNombre("nombre");
			request.setAttribute("listaDeNombres", listaDeNombres);
			despachador = request.getRequestDispatcher("FormularioInsertarPersona.jsp");
			
		} else if (navigation.equals("/InsertarPersona.do")){
			try {
				Persona persona = getPersona(request);
				persona.insertar();
				List <Persona> listaDePersonas = null;
				listaDePersonas = Persona.ObtenerIdDePersona(persona);				
				
				request.setAttribute("listaDePersonas", listaDePersonas);
				despachador = request.getRequestDispatcher("/MostrarPersonas.jsp");			
			} catch (DataBaseException e) 
					{ //out.println(e.getMessage());
					}
		} else if (navigation.equals("/BorrarPersona.do")){
			try {
				String id = request.getParameter("id");

				Integer idInt;
				if (id.matches("[0-9]*") && id.trim()!="") idInt = Integer.valueOf(id.trim()); else idInt =0;
				
				Persona persona = new Persona(idInt,"Nombre","Apellidos","Direccion",0,"Email");
				persona.borrar();
				List <Persona> listaDePersonas = null;
				listaDePersonas = Persona.buscarTodos();
				request.setAttribute("listaDePersonas", listaDePersonas);
				despachador = request.getRequestDispatcher("/MostrarPersonas.jsp");	
			} catch (DataBaseException e)
			{ //out.println(e.getMessage());
			}
		} else if (navigation.equals("/FormularioEditarPersona.do")){
				String id = request.getParameter("id");
				List <Persona> listaDeNombres = Persona.buscarPorNombre(id);
				Persona persona = Persona.buscarPorClave(Integer.valueOf(id));
				
				request.setAttribute("listaDeNombres", listaDeNombres);
				request.setAttribute("persona", persona);
				
				despachador = request.getRequestDispatcher("/FormularioEditarPersona.jsp");	

		} //Quedar en salvarPersona.do
		else if (navigation.equals("/SalvarPersona.do")){
			try {
				//Personas.persona = Persona.getPersona(request);
				
				Persona persona = getPersona(request);
				persona.salvar();
				despachador = request.getRequestDispatcher("/MostrarPersonas.do");		
			} catch (DataBaseException e)
			{ //out.println(e.getMessage());
			}
		} 
		else if (navigation.equals("/UpdatePersona.do")){
			try {				
				Persona persona = getPersona(request);
				persona.setId(Integer.valueOf(request.getParameter("id")));
				persona.salvar();
				request.setAttribute("persona", persona);
				despachador = request.getRequestDispatcher("/MostrarPersonas.jsp");		
			} catch (DataBaseException e)
			{ //out.println(e.getMessage());
			}
		}
		else {
			List <Persona> listaDePersonas = null;
			if (request.getParameter("nombre")==null ){ //|| request.getParameter("nombre").equals("seleccionar")){
				listaDePersonas = Persona.buscarTodos();
			} else {

				String id = request.getParameter("id"); 
				
				listaDePersonas = Persona.buscarPorIdNum(Integer.valueOf(id));
			}

			request.setAttribute("listaDePersonas", listaDePersonas);
			despachador = request.getRequestDispatcher("/MostrarPersonas.jsp");
			
		}		
		despachador.forward (request,response);
	}
	
	public Persona getPersona(HttpServletRequest request){

		Persona persona = new Persona();
		persona.setNombre(request.getParameter("nombre"));
		persona.setApellidos(request.getParameter("apellidos"));
		persona.setDireccion(request.getParameter("direccion"));
		
		Integer edadInt;
		String edad = request.getParameter("edad");
		if (edad.matches("[0-9]*") && edad.trim()!="") edadInt = Integer.valueOf(edad.trim()); else edadInt =0;
		
		persona.setEdad(edadInt);
		persona.setEmail(request.getParameter("email"));

		return persona;
	}
	
}
