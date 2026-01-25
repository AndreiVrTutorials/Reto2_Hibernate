package com.gf.sede.ln;

import java.util.Date;
import com.gf.sede.dao.EntidadesDAO;
import com.gf.sede.dao.RegistrosDAO;
import com.gf.sede.entities.Entidades;
import com.gf.sede.entities.Registros;

public class RegistrosLN {

    private RegistrosDAO registrosDAO = new RegistrosDAO();
    private EntidadesDAO entidadesDAO = new EntidadesDAO(); 

    public Registros procesarAlta(String dni, String nombre, String apellidos, String tramite, String nombreEntidad) throws Exception {
        
        if (dni == null || !dni.matches("\\d{8}[A-Za-z]")) {
            throw new Exception("El DNI tiene formato incorrecto");
        }
        if (nombre.length() < 2 || apellidos.length() < 3) {
            throw new Exception("El nombre o el apellido es demasiado corto");
        }

        
        String parteNombre = nombre.substring(0, 2).toUpperCase();
        
        String parteApellido = apellidos.substring(0, 2).toUpperCase(); 
        String parteDNI = dni.substring(dni.length() - 3).toUpperCase();
        
        String numeroRegistroGenerado = "REG " + parteNombre + parteApellido + parteDNI;

        Entidades entidadObjeto = null;
        for(Entidades e : entidadesDAO.obtenerTodasEntidades()){
            if(e.getNombre().equals(nombreEntidad)){
                entidadObjeto = e;
                break;
            }
        }
        
        if (entidadObjeto == null) {
             throw new Exception("Error: No se ha encontrado la entidad seleccionada.");
        }

        Registros nuevoRegistro = new Registros();
        nuevoRegistro.setNumeroRegistro(numeroRegistroGenerado);
        nuevoRegistro.setDni(dni.toUpperCase());
        nuevoRegistro.setNombre(nombre.toUpperCase());
        nuevoRegistro.setApellidos(apellidos.toUpperCase());
        nuevoRegistro.setTramite(tramite.toUpperCase());
        nuevoRegistro.setFecha(new java.sql.Date(new Date().getTime())); 
        nuevoRegistro.setEntidades(entidadObjeto); 
        registrosDAO.guardarRegistro(nuevoRegistro);

        return nuevoRegistro; 
    }
    public Registros buscarRegistro(String numeroRegistro) {
        
        return registrosDAO.buscarPorNumeroRegistro(numeroRegistro);
    }
}