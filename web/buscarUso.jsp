<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<!DOCTYPE html>

<%  
    Statement st = null;
    ResultSet rs = null;
    %>

<html>
    <head>
        <html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br" xml:lang="pt-br">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Busca de Usuários</h1> 
        <form action="" method="post">
            <input type="text" name="txtUsuario"><input type="submit" name="btnSalvar">
        </form>
        <br>
    </body>
</html>
<%  
            if(request.getParameter("btnSalvar")!=null){
                String busca = "%" + request.getParameter("txtUsuario") + "%";
            try{
            st = new Conexao().conectar().createStatement();
           rs = st.executeQuery("SELECT usuario, nivel FROM `tbusuario` where usuario like'"+busca+"'");
            out.println("<table border=1><tr>");
            out.println("<td>Usuário</td>"
            + "<td>Nivel</td></tr><tr>");
            while(rs.next())
            {    
            out.println("<td>" + rs.getString(1) + "</td>");
            out.println("<td>" + rs.getString(2)+ "</td></tr>");  
        }
            out.println("</table>");
            out.println("<br><a href='index.jsp'>Voltar</a>");
                    
            }
            catch(Exception e)
            {
            out.println(e);
            }
        }
                
            %>


