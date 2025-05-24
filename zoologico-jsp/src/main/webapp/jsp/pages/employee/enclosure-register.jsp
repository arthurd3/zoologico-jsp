<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registro de Recinto</title>
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
                    <div class="text-center mb-5"></div>

                    <form class="needs-validation" action="/enclosureRegister" method="post">
                        <div class="mb-4">
                            <label for="name" class="form-label text-secondary">Nome do Recinto</label>
                            <input type="text" name="name" class="form-control form-control-lg border-2 border-success" id="name"
                                   placeholder="Recinto 1 - Elefantes" required>
                            <div class="invalid-feedback">Por favor, insira um nome de recinto válido.</div>
                        </div>

                        <div class="mb-4">
                            <label for="type" class="form-label text-secondary">Tipo</label>
                            <input type="text" name="type" class="form-control form-control-lg border-2 border-success" id="type"
                                   placeholder="Terrestre, Aquático, Aviário..." required>
                            <div class="invalid-feedback">Por favor, insira o tipo do recinto.</div>
                        </div>

                        <div class="mb-4">
                            <label for="sizeM2" class="form-label text-secondary">Tamanho (m²)</label>
                            <input type="number" step="0.01" name="sizeM2" class="form-control form-control-lg border-2 border-success" id="sizeM2"
                                   placeholder="150.00" required>
                            <div class="invalid-feedback">Por favor, insira o tamanho em metros quadrados.</div>
                        </div>

                        <div class="mb-4">
                            <label for="description" class="form-label text-secondary">Descrição</label>
                            <textarea name="description" class="form-control form-control-lg border-2 border-success" id="description"
                                      rows="3" placeholder="Área com lago artificial, sombra natural..." required></textarea>
                            <div class="invalid-feedback">Por favor, insira uma descrição do recinto.</div>
                        </div>

                        <div class="mb-4">
                            <label for="animalId" class="form-label text-secondary">ID do Animal</label>
                            <input type="number" name="animalId" class="form-control form-control-lg border-2 border-success" id="animalId"
                                   placeholder="Ex: 1" required>
                            <div class="invalid-feedback">Por favor, insira o ID do animal vinculado a este recinto.</div>
                        </div>

                        <button type="submit" class="btn btn-success btn-lg w-100 py-3 mb-3 shadow-sm">
                            <i class="bi bi-box-arrow-in-right me-2"></i> Registrar Recinto
                        </button>
                    </form>
                </div>
            </div>

            <div class="col-lg-6 d-none d-lg-block position-relative overflow-hidden">
                <div class="background-blur"></div>
                <div class="h-100 d-flex align-items-center justify-content-center position-relative content-container">
                    <div class="text-white p-5 text-center">
                        <img src="https://cdn-icons-png.flaticon.com/512/1823/1823194.png"
                             alt="Cercado de animal"
                             class="mb-4 icon-style">
                        <h2 class="display-5 fw-bold mb-4">Cadastro de Recintos</h2>
                        <p class="lead">Mantenha o controle dos recintos para garantir o bem-estar dos nossos animais.</p>
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
            alert("Recinto registrado com sucesso!");
        } else if (success === "false") {
            alert("Erro: Recinto já registrado ou Animal_id invalido.");
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
