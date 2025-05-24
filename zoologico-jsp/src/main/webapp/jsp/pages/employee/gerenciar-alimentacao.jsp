<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zoologico.dtos.animal.AnimalFoodDTO" %>
<html>
<head>
    <title>Alimentação dos Animais</title>
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
    <h2 class="mb-4">Lista de Alimentos dos Animais</h2>
    <table class="table table-bordered table-striped table-hover">
        <thead class="table-info">
        <tr>
            <th>ID</th>
            <th>ID do Animal</th>
            <th>Nome do Animal</th>
            <th>Alimento</th>
            <th>Quantidade</th>
            <th>Horário</th>
            <th>Data</th>
            <th>Observações</th>
            <th>Ações</th>
        </tr>
        </thead>
        <tbody>

        <%
            List<AnimalFoodDTO> alimentos = (List<AnimalFoodDTO>) request.getAttribute("animalFoodList");
            List<String> animalsName = (List<String>) request.getAttribute("animalNameList");

            if (alimentos != null && !alimentos.isEmpty()) {
                for (int i = 0; i < alimentos.size(); i++) {
                    AnimalFoodDTO alimento = alimentos.get(i);
        %>
        <tr>
            <td><%= alimento.getId() %></td>
            <td><%= alimento.getAnimalId() %></td>
            <td><%= animalsName.get(i) %></td>
            <td><%= alimento.getFoodName() %></td>
            <td><%= alimento.getQuantity() %></td>
            <td><%= alimento.getFeedingTime() %></td>
            <td><%= alimento.getFeedingDate() %></td>
            <td><%= alimento.getNotes() %></td>
            <td>
                <a href="/editarAlimento?id=<%= alimento.getId() %>" class="btn btn-sm btn-primary">Editar</a>
                <a href="/excluirAlimento?id=<%= alimento.getId() %>" class="btn btn-sm btn-danger"
                   onclick="return confirm('Tem certeza que deseja excluir este registro de alimentação?')">Excluir</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="9" class="text-center text-muted">Nenhum alimento registrado.</td>
        </tr>
        <% } %>

        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
