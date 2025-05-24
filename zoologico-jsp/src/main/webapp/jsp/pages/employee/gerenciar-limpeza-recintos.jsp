<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zoologico.dtos.animal.EnclosureDTO" %>
<html>
<head>
    <title>Marcar Limpeza do Recinto</title>
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
    List<EnclosureDTO> recintoLimpeza = (List<EnclosureDTO>) request.getAttribute("enclosureClean");
    EnclosureDTO recinto = null;
    if (recintoLimpeza != null && !recintoLimpeza.isEmpty()) {
        recinto = recintoLimpeza.get(0);
    }
%>

<div class="container mt-5">
    <h2 class="mb-4">Marcar Limpeza do Recinto</h2>

    <% if (recinto != null) { %>
    <form action="/cleanEnclosureManager" method="post" class="border p-4 shadow-sm rounded bg-light">

        <div class="mb-3">
            <label class="form-label">ID do Recinto</label>
            <input type="text" class="form-control" name="id" value="<%= recinto.getId() %>" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label">Nome do Recinto</label>
            <input type="text" class="form-control" value="<%= recinto.getName() %>" readonly>
        </div>

        <div class="mb-3">
            <label for="cleanedBy" class="form-label">Nome do Colaborador</label>
            <input type="text" class="form-control" value="<%= recinto.getCleanedBy() %>" id="cleanedBy" name="cleanedBy" required>
        </div>

        <div class="mb-3">
            <label for="cleanDate" class="form-label">Data da Limpeza</label>
            <input type="date" class="form-control" value="<%= recinto.getCleanDate() %>" id="cleanDate" name="cleanDate" required>
        </div>

        <div class="mb-3">
            <label for="cleanTime" class="form-label">Hora da Limpeza</label>
            <input type="time" class="form-control" value="<%= recinto.getCleanTime() %>" id="cleanTime" name="cleanTime" required>
        </div>

        <button type="submit" class="btn btn-success w-100">Registrar Limpeza</button>
    </form>
    <% } else { %>
    <div class="alert alert-danger">Recinto não encontrado.</div>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
