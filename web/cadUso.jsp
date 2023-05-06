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
        <h1>Cadastro de Usuários</h1>
        
        <form action="" method="post" id="cadastro">
            <label>Usuário</label><br>
            <input type="text" name="txtUsuario"><br>
            <label>Senha</label><br>
            <input type="text" name="txtSenha"><br><!-- comment -->
            <br>
            <select name="txtNivel">
                <option>Escolha uma opção</option>
                <option value="1">Usuário</option>
                <option value="2">Administrador</option>
                <option value="3">Visitante</option>
            </select>
            <br><br>
            <input type="submit" name="btnSalvar">
        </form>
        <br>
        <a href="index.jsp">Voltar</a>
    </body>
</html>

        <%
            if(request.getParameter("btnSalvar")!=null){
                String usuario = request.getParameter("txtUsuario");
                String senha = request.getParameter("txtSenha");
                String nivel = request.getParameter("txtNivel");            
               try{
                        st = new Conexao().conectar().createStatement();

                        st.executeUpdate("insert into tbusuario(usuario,senha,nivel) values('"+usuario+"', '"+senha+"', '"+nivel+"')");     
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