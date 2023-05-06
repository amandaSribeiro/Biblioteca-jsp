<%@page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<% 
    Statement st = null; 
    ResultSet rs = null;%>
    <!DOCTYPE html>
    <html> 
        <head> 
            <%@include file="estilos.jsp" %>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
            <title>JSP Page</title> 
        </head> 
        <body> 
            <h1>Cadastro de Livro</h1> 
            <form action="" method="post" id="cadastro"> 
                <label>Nome do Livro</label>
                <br> 
                <input type="text" name="txtNome"><br> 
                <label>Ano</label><br> 
                <input type="text" name="txtTel">
                <br> 
                <label>Edição</label>
                <br> 
                <input type="text" name="txtCel">
                <br> 
                <label class="form-label">Selecionar Genero</label> 
                <% try{ st = new Conexao().conectar().createStatement(); 
                rs = st.executeQuery("Select * from tbgenero"); 
                    out.println("<select class='form-select' name='txtGenero'>"); 
                    out.println("<option value='' disabled selected hidden></option>"); 
                        while (rs.next()) { 
                            out.println("<option value="+rs.getString(1)+">" + rs.getString(2) + "</option>"); 
                        }   
                    out.println("</select><br>"); 
                }catch(Exception e){ out.println(e); } %> 
                <label class="form-label">Selecionar Autor</label> 
                <% try{ st = new Conexao().conectar().createStatement(); 
                rs = st.executeQuery("Select * from tbautor"); 
out.println("<select class='form-select' name='txtAutor'>"); 
out.println("<option value='' disabled selected hidden></option>"); 
while (rs.next()) { 
out.println("<option value="+rs.getString(1)+">" + rs.getString(2) + "</option>"); } 
out.println("</select><br>"); }
catch(Exception e){ out.println(e); } %> 
<label>Descriçao</label><br> 
<input type="text" name="txtDesc"><br> 
<label>Status</label><br> 
<input type="text" name="txtStatus"><br> 
<input type="submit" name="btnSalvar"> </form> <br> 
<a href="index.jsp">Voltar</a> 
        </body>
    </html><% 
if(request.getParameter("btnSalvar")!=null) { 
String nome = request.getParameter("txtNome"); 
String ano = request.getParameter("txtTel"); 
String edicao = request.getParameter("txtCel"); 
String genero = request.getParameter("txtGenero"); 
String autor = request.getParameter("txtAutor"); 
String desc = request.getParameter("txtDesc"); 
String status = request.getParameter("txtStatus"); 
try{ st = new Conexao().conectar().createStatement(); 
st.executeUpdate("insert into tblivro(nomeLivro, codAutor, codGenero, anoLancamento, edicaoLivro, descricaoLivro, statusLivro) "
+ "values('"+nome+"', '"+autor+"', '"+genero+"','"+ano+"','"+edicao+"','"+desc+"', '"+status+"')"); 
out.println("<meta http-equiv='refresh' content='0;URL=index.jsp'>"); 
out.println("<script type=\"text/javascript\">"); 
out.println("alert('Cadastro do livro realizado com sucesso');"); 
out.println("</script>"); } 
catch(Exception e){ 
out.println(e); } 
    }%>