<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Registro de Alimento</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="/jsp/css/animais-register.css" rel="stylesheet">
</head>
<body>
<%@ include file="/jsp/fragments/header.jsp" %>

<c:if test="${sessionScope.userType != 'ADMIN' && sessionScope.userType != 'EMPLOYEE'}">
  <%
    response.sendRedirect("/");
  %>
</c:if>

<section class="vh-100 bg-light">
  <div class="container-fluid h-100">

    <div class="row g-0 h-100">
      <div class="col-lg-6 col-md-12 d-flex align-items-center">
        <div class="form-container w-100 px-5">
          <div class="text-center mb-5">
            <div class="d-flex align-items-center justify-content-center mb-3">

            </div>
          </div>

          <form class="needs-validation" action="/foodRegisterController" method="post">
            <div class="mb-4">
              <label for="animalId" class="form-label text-secondary">ID do Animal</label>
              <input type="number" name="animalId" class="form-control form-control-lg border-2 border-success" id="animalId"
                     placeholder="ID do animal" required>
              <div class="invalid-feedback">Por favor, insira o ID do animal.</div>
            </div>

            <div class="mb-4">
              <label for="foodName" class="form-label text-secondary">Nome do Alimento</label>
              <input type="text" name="foodName" class="form-control form-control-lg border-2 border-success" id="foodName"
                     placeholder="Ex: Ração para Elefantes" required>
              <div class="invalid-feedback">Por favor, insira o nome do alimento.</div>
            </div>

            <div class="mb-4">
              <label for="quantity" class="form-label text-secondary">Quantidade</label>
              <input type="text" name="quantity" class="form-control form-control-lg border-2 border-success" id="quantity"
                     placeholder="Quantidade do alimento" required>
              <div class="invalid-feedback">Por favor, insira a quantidade do alimento.</div>
            </div>

            <div class="mb-4">
              <label for="feedingTime" class="form-label text-secondary">Hora da Alimentação</label>
              <input type="time" name="feedingTime" class="form-control form-control-lg border-2 border-success" id="feedingTime"
                     required>
              <div class="invalid-feedback">Por favor, insira a hora da alimentação.</div>
            </div>

            <div class="mb-4">
              <label for="feedingDate" class="form-label text-secondary">Data da Alimentação</label>
              <input type="date" name="feedingDate" class="form-control form-control-lg border-2 border-success" id="feedingDate"
                     required>
              <div class="invalid-feedback">Por favor, insira a data da alimentação.</div>
            </div>

            <div class="mb-4">
              <label for="notes" class="form-label text-secondary">Observações</label>
              <textarea name="notes" class="form-control form-control-lg border-2 border-success" id="notes"
                        placeholder="Observações sobre a alimentação (opcional)"></textarea>
              <div class="invalid-feedback">Por favor, insira observações caso necessário.</div>
            </div>

            <button type="submit" class="btn btn-success btn-lg w-100 py-3 mb-3 shadow-sm">
              <i class="bi bi-box-arrow-in-right me-2"></i> Registrar Alimento
            </button>
          </form>
        </div>
      </div>

      <div class="col-lg-6 d-none d-lg-block position-relative overflow-hidden">
        <div class="background-blur"></div>
        <div class="h-100 d-flex align-items-center justify-content-center position-relative content-container">
          <div class="text-white p-5 text-center">
            <img src="https://cdn-icons-png.flaticon.com/512/2913/2913100.png"
                 alt="Animal Food Silhouette"
                 class="mb-4 icon-style">
            <h2 class="display-5 fw-bold mb-4">Bem-vindo ao Cadastro de Alimentos</h2>
            <p class="lead">Ajude a registrar os alimentos fornecidos para os animais do zoológico.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<%
  String successRegister = request.getParameter("successRegister");
%>

<script>
  window.addEventListener('DOMContentLoaded', () => {
    const success = "<%= successRegister %>";
    if (success === "true") {
      alert("Alimento registrado com sucesso!");
    } else if (success === "false") {
      alert("Erro: Falha ao registrar alimento.");
    }
  });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
