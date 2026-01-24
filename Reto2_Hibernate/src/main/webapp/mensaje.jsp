<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sede Electrónica GF - Mensaje</title>
</head>
<body>

    <table border="1" width="600" align="center" cellpadding="10">
        <tr>
            <td>
                <h1 align="center">SEDE ELECTRÓNICA GF</h1>
                <hr>
                
                <table border="0" width="100%" cellpadding="5">
                    <tr>
                        <td align="center">
                            <% 
                                // Lógica básica para decidir qué mostrar
                                Boolean registrado = (Boolean) request.getAttribute("registrado");
                                
                                // Recuperamos también el mensaje de error por si acaso
                                String mensajeError = (String) request.getAttribute("error");
                                
                                if (registrado != null && registrado) { 
                            %>
                                <p><b>La grabación se ha realizado correctamente en registro. Guarde el siguiente número de registro:</b></p>
                                <br>
                                <p><b>Número registro: <%= request.getAttribute("numeroRegistro") %></b></p>
                                <p><b>Fecha de registro: <%= request.getAttribute("fechaRegistro") %></b></p>
                            
                            <% } else { %>
                                
                                <br>
                                <p><b>No se ha registrado el trámite. Error al realizar la grabación.</b></p>
                                
                                <%-- Si el Servlet nos ha mandado un motivo específico, lo mostramos aquí en rojo --%>
                                <% if (mensajeError != null) { %>
                                    <p style="color: red; font-weight: bold;">
                                        Motivo: <%= mensajeError %>
                                    </p>
                                <% } %>
                                
                                <br>
                            
                            <% } %>
                        </td>
                    </tr>
                </table>
                
                <br><br>
                
                <table border="0" width="100%">
                    <tr>
                        <td align="center">
                            <a href="registro.jsp"><button>Nuevo Registro</button></a>
                            
                            <a href="buscar.jsp"><button>Consulta Registro</button></a>
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