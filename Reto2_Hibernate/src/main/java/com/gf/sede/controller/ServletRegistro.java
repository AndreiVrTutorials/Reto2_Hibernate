package com.gf.sede.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import com.gf.sede.entities.Registros;
import com.gf.sede.ln.RegistrosLN;

@WebServlet("/ServletRegistro")
public class ServletRegistro extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    private RegistrosLN registrosLN = new RegistrosLN();

    public ServletRegistro() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getParameter("accion");
        
        if ("Grabar".equals(accion)) {
            String dni = request.getParameter("dni");
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String tramite = request.getParameter("tramite");
            String entidad = request.getParameter("entidad");

            try {
                Registros registroOK = registrosLN.procesarAlta(dni, nombre, apellidos, tramite, entidad);
                SimpleDateFormat formateador = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
                String fechaFormateada = formateador.format(registroOK.getFecha());
                
                request.setAttribute("registrado", true);
                request.setAttribute("numeroRegistro", registroOK.getNumeroRegistro());
                request.setAttribute("fechaRegistro", fechaFormateada);
                
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("registrado", false);
                request.setAttribute("error", e.getMessage());
            }
            
            request.getRequestDispatcher("mensaje.jsp").forward(request, response);
        }
        else if ("buscar".equals(accion)) {
            String numRegBusqueda = request.getParameter("numeroRegistro");
            
            Registros registroEncontrado = registrosLN.buscarRegistro(numRegBusqueda);
            
            if (registroEncontrado != null) {
                request.setAttribute("registro", registroEncontrado);
                
                request.getRequestDispatcher("consultar.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "No existe ningún registro con el código: " + numRegBusqueda);
                request.setAttribute("registrado", false);
                request.getRequestDispatcher("mensaje.jsp").forward(request, response);
            }
        }else if ("Buscar".equals(accion))	{
        	request.getRequestDispatcher("buscar.jsp").forward(request, response);
        	
        }
	}
}