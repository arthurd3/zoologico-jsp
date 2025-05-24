<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zoologico.dtos.animal.EnclosureDTO" %>
<html>
<head>
  <title>Gerenciamento de Recintos</title>
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
  <h2 class="mb-4">Lista de Recintos</h2>
  <table class="table table-bordered table-striped table-hover">
    <thead class="table-info">
    <tr>
      <th>ID</th>
      <th>Nome</th>
      <th>Tipo</th>
      <th>Tamanho (m²)</th>
      <th>Descrição</th>
      <th>ID Animal</th>
      <th>Limpado por</th>
      <th>Data da Limpeza</th>
      <th>Hora da Limpeza</th>
      <th>Ações</th>
    </tr>
    </thead>
    <tbody>

    <%
      List<EnclosureDTO> recintos = (List<EnclosureDTO>) request.getAttribute("enclosuresList");
      if (recintos != null && !recintos.isEmpty()) {
        for (EnclosureDTO recinto : recintos) {
    %>
    <tr>
      <td><%= recinto.getId() %></td>
      <td><%= recinto.getName() %></td>
      <td><%= recinto.getType() %></td>
      <td><%= recinto.getSizeM2() %></td>
      <td><%= recinto.getDescription() %></td>
      <td><%= recinto.getAnimalId() %></td>
      <td><%= recinto.getCleanedBy() %></td>
      <td><%= recinto.getCleanDate() %></td>
      <td><%= recinto.getCleanTime() %></td>
      <td>
        <a href="/cleanEnclosureManager?id=<%=recinto.getId()%>" class="btn btn-sm btn-primary">Marcar Limpeza</a>
        <a href="/excluirRecinto?id=<%= recinto.getId() %>" class="btn btn-sm btn-danger"
           onclick="return confirm('Tem certeza que deseja excluir este Recinto?')">Excluir</a>
      </td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="10" class="text-center text-muted">Nenhum recinto encontrado.</td>
    </tr>
    <% } %>

    </tbody>
  </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
