<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

 


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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>Cadastro de Pacientes</h1>

<form action="" method="post" id="cadastro">
<label>Genero de Livro</label><br>
<input type="text" name="txtGenero"><br>
<input type="submit" name="btnSalvar">
</form>
<br>
<a href="index.jsp">Voltar</a>
</body>
</html>
<%
    if(request.getParameter("btnSalvar")!=null) {
    String genero = request.getParameter("txtGenero");
    try{
        st = new Conexao().conectar().createStatement();

        st.executeUpdate("insert into tbgenero(genero) values('"+genero+"')");
        out.println("<meta http-equiv='refresh' content='0;URL=index.jsp'>");
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Cadastro de gênero realizado com sucesso');");
        out.println("</script>");
    } catch(Exception e){
        out.println(e);
        }
    }
%>