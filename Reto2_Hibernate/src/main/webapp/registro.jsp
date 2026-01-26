<%@page import="com.gf.sede.dao.EntidadesDAO"%>
<%@page import="com.gf.sede.entities.Entidades"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pagina de registro</title>
</head>
	<%
        EntidadesDAO dao = new EntidadesDAO();
        List<Entidades> listaEntidades = dao.obtenerTodasEntidades();
    %>
<body>
<form action="ServletRegistro" method="post">
	<table border="1">
		<tr><td colspan="2"><h1>SEDE ELECTRONICA DE GF</h1></td></tr>
		<tr>
			<td>DNI solicitante:</td>
			<td><input type="text" name="dni" required maxlength="9"></td>
		</tr>
		<tr>
			<td>NOMBRE solicitante:</td>
			<td><input type="text" name="nombre" required maxlength="50"></td>
		</tr>
		<tr>
			<td>APELLIDOS solicitante:</td>
			<td><input type="text" name="apellidos" required maxlength="100"></td>
		</tr>
		<tr>
			<td>TRÁMITE:</td>
			<td><input type="text" name="tramite" required maxlength="150"></td>
		</tr>
		<tr>
            <td>ENTIDAD:</td>
            <td>
                <select name="entidad" required>
                	<option value="">-- Seleccione --</option>  
                	<% 
                       if(listaEntidades != null) {
                           for(Entidades e : listaEntidades) { 
                    %>
                           <option value="<%= e.getNombre() %>"><%= e.getNombre() %></option>
                    <% 
                           } 
                       }
                    %>   
            </td>
        </tr>
        <tr>
        	<td colspan="2" style="text-align: right;"><input type="submit" name="accion" value="Grabar"></td>
        </tr>
	</table>
</form>
</body>
</html>
