package com.gf.sede.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.gf.sede.entities.Registros;
import com.gf.sede.ln.RegistrosLN;

@WebServlet("/ServletRegistro")
public class ServletRegistro extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    // Instanciamos la lógica de negocio
    private RegistrosLN registrosLN = new RegistrosLN();

    public ServletRegistro() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        // Recuperamos parámetros
		String accion = request.getParameter("accion");
        
        // Si es GRABAR (Viene de registro.jsp)
        if ("grabar".equals(accion)) {
            String dni = request.getParameter("dni");
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String tramite = request.getParameter("tramite");
            String entidad = request.getParameter("entidad");

            try {
                // LLAMADA A LA LÓGICA (LN)
                // Aquí se verifica, se crea el código y se guarda en BDD
                Registros registroOK = registrosLN.procesarAlta(dni, nombre, apellidos, tramite, entidad);
                
                // Si todo va bien, preparamos datos para mensaje.jsp
                request.setAttribute("registrado", true);
                request.setAttribute("numeroRegistro", registroOK.getNumeroRegistro());
                request.setAttribute("fechaRegistro", registroOK.getFecha());
                
            } catch (Exception e) {
                // Si falla validación o base de datos
                e.printStackTrace();
                request.setAttribute("registrado", false);
                request.setAttribute("error", e.getMessage());
            }
            
            // Reenviamos a la vista
            request.getRequestDispatcher("mensaje.jsp").forward(request, response);
        }
        // Si es BUSCAR (Viene de buscar.jsp)
        else if ("buscar".equals(accion)) {
             // ... lógica de buscar ...
        }
	}
}