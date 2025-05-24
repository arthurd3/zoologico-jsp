<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zoologico.dtos.user.UserDTO" %>
<html>
<head>
    <title>Gerenciamento de Funcionarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<%@ include file="/jsp/fragments/header.jsp" %>

<c:if test="${sessionScope.userType != 'ADMIN'}">
    <%
        response.sendRedirect("/");
    %>
</c:if>

<div class="container mt-5">
    <h2 class="mb-4">Lista de Funcionarios</h2>
    <table class="table table-bordered table-striped table-hover">
        <thead class="table-success">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>Tipo</th>
            <th>Ações</th>
        </tr>
        </thead>
        <tbody>

        <%
            List<UserDTO> clientes = (List<UserDTO>) request.getAttribute("employeeList");
            if (!clientes.isEmpty()) {
                for (UserDTO cliente : clientes) {
        %>
        <tr>
            <td><%= cliente.getId() %></td>
            <td><%= cliente.getName() %></td>
            <td><%= cliente.getEmail() %></td>
            <td><%= cliente.getPhone() %></td>
            <td><%= cliente.getUserType() %></td>
            <td>
                <a href="editarCliente?id=<%= cliente.getId() %>" class="btn btn-sm btn-primary">Editar</a>
                <a href="/excluirCliente?id=<%= cliente.getId() %>" class="btn btn-sm btn-danger"
                   onclick="return confirm('Tem certeza que deseja excluir este cliente?')">Excluir</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5" class="text-center text-muted">Nenhum funcionario encontrado.</td>
        </tr>
        <% } %>

        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
