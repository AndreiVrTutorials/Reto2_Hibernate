<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.gf.sede.entities.Registros" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sede Electrónica GF - Consultar</title>
</head>
<body>

    <table border="1" width="600" align="center" cellpadding="10">
        <tr>
            <td>
                <h1 align="center">SEDE ELECTRÓNICA GF</h1>
                <hr>
                
                <% 
                   Registros reg = (Registros) request.getAttribute("registro");
                   if(reg == null) reg = new Registros(); 
                %>

                <table border="0" width="100%" cellspacing="5">
                    <tr>
                        <td align="right" width="40%"><b>DNI solicitante:</b></td>
                        <td width="60%"><input type="text" value="<%= (reg.getDni() != null) ? reg.getDni() : "" %>" disabled style="width: 95%;"></td>
                    </tr>
                    <tr>
                        <td align="right"><b>NOMBRE solicitante:</b></td>
                        <td><input type="text" value="<%= (reg.getNombre() != null) ? reg.getNombre() : "" %>" disabled style="width: 95%;"></td>
                    </tr>
                    <tr>
                        <td align="right"><b>APELLIDOS solicitante:</b></td>
                        <td><input type="text" value="<%= (reg.getApellidos() != null) ? reg.getApellidos() : "" %>" disabled style="width: 95%;"></td>
                    </tr>
                    <tr>
                        <td align="right"><b>TRÁMITE:</b></td>
                        <td><input type="text" value="<%= (reg.getTramite() != null) ? reg.getTramite() : "" %>" disabled style="width: 95%;"></td>
                    </tr>
                    <tr>
                        <td align="right"><b>ENTIDAD:</b></td>
                        <td><input type="text" value="<%= (reg.getEntidades() != null) ? reg.getEntidades().getNombre() : "" %>" disabled style="width: 95%;"></td>
                    </tr>
                </table>
                
                <br>
                
                <table border="0" width="100%">
                    <tr>
                        <td align="center">
                            <a href="buscar.jsp"><button>Nueva Busqueda</button></a>
                            <a href="registro.jsp"><button>Nuevo Registro</button></a>
                        </td>
                    </tr>
                </table>

                <hr>
                <p align="center">
                    <small>C/Gabilondo, 23-47007 Valladolid 983 471600/471026 www.gregoriofer.com<br>
                    centro@gregoriofer.com</small>
                </p>
            </td>
        </tr>
    </table>

</body>
</html>