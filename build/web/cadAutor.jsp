<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<%  
    Statement st = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="estilos.jsp" %>
        <meta charset=UTF-8>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastro de Autor</h1>
        
        <form action="" method="post" id="cadastro">
            <label>Nome do Autor</label><br>
            <input type="text" name="txtNome"><br>
            <label></label>
            <br><br>
            <input type="submit" name="btnSalvar">
        </form>
        <br>
        <a href="index.jsp">Voltar</a>
    </body>
</html>

        <%
            if(request.getParameter("btnSalvar")!=null){
                String nome = request.getParameter("txtNome");
                     
               try{
                        st = new Conexao().conectar().createStatement();

                        st.executeUpdate("insert into tbautor(nomeautor) values('"+nome+"')");     
                        out.println("<meta http-equiv='refresh' content='0;URL=index.jsp'>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Cadastro realizado com sucesso');");
                        out.println("</script>");    
                        }
                catch(Exception e)
                        {
                        out.println(e);
                        }
  
            }
            %>
