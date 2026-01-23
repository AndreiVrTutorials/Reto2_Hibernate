<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sede Electrónica GF - Buscar</title>
</head>
<body>

    <table border="1" width="500" align="center" cellpadding="10">
        <tr>
            <td>
                <h1 align="center">SEDE ELECTRÓNICA GF</h1>
                <hr>
                
                <form action="ServletRegistro" method="post">
                    <input type="hidden" name="accion" value="buscar">
                    
                    <table border="1" width="100%" cellspacing="0" cellpadding="5">
                        <tr>
                            <td width="30%"><b>Número Registro:</b></td>
                            <td width="70%"><input type="text" name="numeroRegistro" style="width: 95%;"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right" style="border-top: 1px solid black;">
                                <input type="submit" value="Buscar">
                            </td>
                        </tr>
                    </table>
                </form>

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