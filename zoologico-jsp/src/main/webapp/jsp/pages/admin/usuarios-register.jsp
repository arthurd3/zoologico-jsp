<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registro de Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/jsp/css/user-register.css" rel="stylesheet">
</head>
<body>
<%@ include file="/jsp/fragments/header.jsp" %>

<c:if test="${sessionScope.userType != 'ADMIN'}">
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
              <i class="bi bi-tree-fill fa-5x me-2" style="color: #2e8b57;"></i>
              <h1 class="h2 fw-bold text-success m-0">Zoológico JF</h1>
            </div>
            <p class="text-muted">Cadastre um novo usuário para integrar nossa equipe ou comunidade do zoológico!</p>
          </div>

          <form class="needs-validation" action="/adminRegisterController" method="post">
            <div class="mb-4">
              <label for="nome" class="form-label text-secondary">Nome</label>
              <input type="text" name="nome" class="form-control form-control-lg border-2 border-success" id="nome"
                     placeholder="Arthur Campos" required>
              <div class="invalid-feedback">Por favor, insira um nome válido.</div>
            </div>

            <div class="mb-4">
              <label for="telefone" class="form-label text-secondary">Telefone</label>
              <input type="text" name="telefone" class="form-control form-control-lg border-2 border-success" id="telefone"
                     placeholder="(32) 93123-3213" maxlength="15" required>
              <div class="invalid-feedback">Por favor, insira um telefone válido.</div>
            </div>

            <div class="mb-4">
              <label for="email" class="form-label text-secondary">Email</label>
              <input type="email" name="email" class="form-control form-control-lg border-2 border-success" id="email"
                     placeholder="seu@email.com" required>
              <div class="invalid-feedback">Por favor, insira um email válido.</div>
            </div>

            <div class="mb-4">
              <label for="password" class="form-label text-secondary">Senha</label>
              <input type="password" name="password" class="form-control form-control-lg border-2 border-success" id="password"
                     required>
              <div class="invalid-feedback">Por favor, insira sua senha.</div>
            </div>

            <div class="mb-4">
              <label for="userType" class="form-label text-secondary">Tipo do Usuário</label>
              <select name="userType" id="userType" class="form-select form-select-lg border-2 border-success" required>
                <option value="" disabled selected>Selecione o tipo</option>
                <option value="CLIENT">Cliente</option>
                <option value="EMPLOYEE">Funcionário</option>
              </select>
              <div class="invalid-feedback">Por favor, selecione o tipo de usuário.</div>
            </div>

            <button type="submit" class="btn btn-success btn-lg w-100 py-3 mb-3 shadow-sm">
              <i class="bi bi-box-arrow-in-right me-2"></i> Registrar
            </button>
          </form>
        </div>
      </div>

      <div class="col-lg-6 d-none d-lg-block position-relative overflow-hidden">
        <div class="background-blur"></div>
        <div class="h-100 d-flex align-items-center justify-content-center position-relative content-container">
          <div class="text-white p-5 text-center">
            <img src="https://cdn-icons-png.flaticon.com/512/2913/2913100.png"
                 alt="Animal Silhouette"
                 class="mb-4 icon-style">
            <h2 class="display-5 fw-bold mb-4">Explore o Mundo Animal</h2>
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
      alert("Cadastro realizado com sucesso!");
    } else if (success === "false") {
      alert("Erro: Usuario ja Cadastrado");
    }
  });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
