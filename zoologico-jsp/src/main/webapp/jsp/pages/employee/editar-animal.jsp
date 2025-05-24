<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zoologico.dtos.animal.AnimalDTO" %>
<html>
<head>
    <title>Editar Animal</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
</head>
<body>
<%@ include file="/jsp/fragments/header.jsp" %>

<c:if test="${sessionScope.userType != 'ADMIN' && sessionScope.userType != 'EMPLOYEE'}">
    <%
        response.sendRedirect("/");
    %>
</c:if>

<%
    AnimalDTO animal = (AnimalDTO) request.getAttribute("animal");
%>

<div class="container mt-5">
    <h2 class="mb-4">Editar Animal</h2>

    <% if (animal != null) { %>
    <form action="/editarAnimal" method="post" class="border p-4 shadow-sm rounded bg-light">

        <input type="hidden" name="id" value="<%= animal.getId() %>" />

        <div class="mb-3">
            <label for="nomePopular" class="form-label">Nome Popular</label>
            <input type="text" class="form-control" id="nomePopular" name="nomePopular" value="<%= animal.getNamePopular() %>" required>
        </div>

        <div class="mb-3">
            <label for="nomeCientifico" class="form-label">Nome Científico</label>
            <input type="text" class="form-control" id="nomeCientifico" name="nomeCientifico" value="<%= animal.getNameScientific() %>" required>
        </div>

        <div class="mb-3">
            <label for="especie" class="form-label">Espécie</label>
            <input type="text" class="form-control" id="especie" name="especie" value="<%= animal.getSpecies() %>" required>
        </div>

        <div class="mb-3">
            <label for="habitat" class="form-label">Habitat</label>
            <input type="text" class="form-control" id="habitat" name="habitat" value="<%= animal.getHabitat() %>" required>
        </div>

        <div class="mb-3">
            <label for="recinto" class="form-label">Recinto</label>
            <input type="text" class="form-control" id="recinto" name="recinto" value="<%= animal.getEnclosureName() %>" required>
        </div>

        <div class="mb-3">
            <label for="genero" class="form-label">Gênero</label>
            <select class="form-select" id="genero" name="genero" required>
                <option value="MACHO" <%= "MACHO".equals(animal.getGender()) ? "selected" : "" %>>Macho</option>
                <option value="FEMEA" <%= "FEMEA".equals(animal.getGender()) ? "selected" : "" %>>Fêmea</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="estadoSaude" class="form-label">Estado de Saúde</label>
            <select class="form-select" id="estadoSaude" name="estadoSaude" required>
                <option value="SAUDAVEL" <%= "SAUDAVEL".equals(animal.getHealthStatus()) ? "selected" : "" %>>Saudável</option>
                <option value="DOENTE" <%= "DOENTE".equals(animal.getHealthStatus()) ? "selected" : "" %>>Doente</option>
                <option value="RECUPERANDO" <%= "RECUPERANDO".equals(animal.getHealthStatus()) ? "selected" : "" %>>Recuperando</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary w-100">Salvar Alterações</button>
    </form>
    <% } else { %>
    <div class="alert alert-danger">Animal não encontrado.</div>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
