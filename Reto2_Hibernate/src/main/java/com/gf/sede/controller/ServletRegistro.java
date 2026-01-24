package com.gf.sede.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

import com.gf.sede.entities.Entidades;

/**
 * Servlet implementation class servletSede
 */
@WebServlet("/ServletRegistro")
public class ServletRegistro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegistro() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String dni = request.getParameter("dni");
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String tramite = request.getParameter("tramite");
		String idEntidad = request.getParameter("entidad");

		boolean exito = false;
		String numeroRegistro = ""; 
		String mensajeError = "";
			
		try {
			//Validacion DNi
			if(dni == null || !dni.matches("\\d{8}[A-Za-z]")) {
				exito = false;
				mensajeError = "El dni tiene formato incorrecto";
			}else {//creamos el numero de registro
				if(apellidos.length() >=3 && nombre.length() >=2) {
					String parteNombre = nombre.substring(0,2);
					String parteApellido = apellidos.substring(0,3);
					String parteDNI = dni.substring(5,  8);
						
					numeroRegistro = parteNombre + parteApellido + parteDNI;
						
					//Entidades entidad = new Entidades();
		            //entidad.setRegistroses(Integer.parseInt(request.getParameter("entidad")));//esto no se porque no va
					//HAY QUE RELLENAR EL OBJETO REGISTROS
					exito = true;
				}else {
					exito = false;
					mensajeError = "El nombre o el apellido es demasiado corto (min 3 letras apellido, min 2 letras nombre";
				}
					
			}
			if(exito) {
				request.setAttribute("registrado", true);
				request.setAttribute("numeroRegistro", numeroRegistro);
				request.setAttribute("fechaRegistro", new Date());
			}else {
				request.setAttribute("registrado", false);
				request.setAttribute("error", mensajeError);
			}
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("registrado", false);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}

	}

}
