<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zoologico.dtos.animal.AnimalDTO" %>
<html>
<head>
    <title>Gerenciamento de Animais</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
</head>
<body>
<%@ include file="/jsp/fragments/header.jsp" %>

<c:if test="${sessionScope.userType != 'ADMIN' && sessionScope.userType != 'EMPLOYEE'}">
    <%
        response.sendRedirect("/");
    %>
</c:if>


<div class="container mt-5">
    <h2 class="mb-4">Lista de Animais</h2>
    <table class="table table-bordered table-striped table-hover">
        <thead class="table-success">
        <tr>
            <th>ID</th>
            <th>Nome Popular</th>
            <th>Nome Científico</th>
            <th>Espécie</th>
            <th>Gênero</th>
            <th>Habitat</th>
            <th>Data de Chegada</th>
            <th>Estado de Saúde</th>
            <th>Recinto</th>
            <th>Acoes</th>
        </tr>
        </thead>
        <tbody>

        <%
            List<AnimalDTO> animais = (List<AnimalDTO>) request.getAttribute("animalsList");
            if (animais != null && !animais.isEmpty()) {
                for (AnimalDTO animal : animais) {
        %>
        <tr>
            <td><%= animal.getId() %></td>
            <td><%= animal.getNamePopular() %></td>
            <td><%= animal.getNameScientific() %></td>
            <td><%= animal.getSpecies() %></td>
            <td><%= animal.getGender() %></td>
            <td><%= animal.getHabitat() %></td>
            <td><%= animal.getHealthStatus() %></td>
            <td><%= animal.getArrivalDate() %></td>
            <td><%= animal.getEnclosureName() %></td>
            <td>
                <a href="/editarAnimal?id=<%= animal.getId() %>" class="btn btn-sm btn-primary">Editar</a>
                <a href="/excluirAnimal?id=<%= animal.getId() %>" class="btn btn-sm btn-danger"
                   onclick="return confirm('Tem certeza que deseja excluir este Animal?')">Excluir</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="9" class="text-center text-muted">Nenhum animal encontrado.</td>
        </tr>
        <% } %>

        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
