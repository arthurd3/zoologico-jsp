<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registro de Animal</title>
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

                    <form class="needs-validation" action="/animalsRegisterController" method="post">
                        <div class="mb-4">
                            <label for="nomePopular" class="form-label text-secondary">Nome Popular</label>
                            <input type="text" name="nomePopular" class="form-control form-control-lg border-2 border-success" id="nomePopular"
                                   placeholder="Elefante Africano" required>
                            <div class="invalid-feedback">Por favor, insira um nome popular válido.</div>
                        </div>

                        <div class="mb-4">
                            <label for="nomeCientifico" class="form-label text-secondary">Nome Científico</label>
                            <input type="text" name="nomeCientifico" class="form-control form-control-lg border-2 border-success" id="nomeCientifico"
                                   placeholder="Loxodonta africana" required>
                            <div class="invalid-feedback">Por favor, insira o nome científico válido.</div>
                        </div>

                        <div class="mb-4">
                            <label for="especie" class="form-label text-secondary">Espécie</label>
                            <input type="text" name="especie" class="form-control form-control-lg border-2 border-success" id="especie"
                                   placeholder="Elefante" required>
                            <div class="invalid-feedback">Por favor, insira a espécie do animal.</div>
                        </div>

                        <div class="mb-4">
                            <label for="habitat" class="form-label text-secondary">Habitat</label>
                            <input type="text" name="habitat" class="form-control form-control-lg border-2 border-success" id="habitat"
                                   placeholder="Savanas Africanas" required>
                            <div class="invalid-feedback">Por favor, insira o habitat do animal.</div>
                        </div>

                        <div class="mb-4">
                            <label for="dataChegada" class="form-label text-secondary">Data de Chegada</label>
                            <input type="date" name="dataChegada" class="form-control form-control-lg border-2 border-success" id="dataChegada"
                                   required>
                            <div class="invalid-feedback">Por favor, insira a data de chegada do animal.</div>
                        </div>

                        <div class="mb-4">
                            <label for="genero" class="form-label text-secondary">Estado de Saúde</label>
                            <select name="genero" id="genero" class="form-select form-select-lg border-2 border-success" required>
                                <option value="" disabled selected>Selecione o genero</option>
                                <option value="MACHO">Macho</option>
                                <option value="FEMEA">Femea</option>
                            </select>
                            <div class="invalid-feedback">Por favor, selecione o estado de saúde do animal.</div>
                        </div>

                        <div class="mb-4">
                            <label for="estadoSaude" class="form-label text-secondary">Estado de Saúde</label>
                            <select name="estadoSaude" id="estadoSaude" class="form-select form-select-lg border-2 border-success" required>
                                <option value="" disabled selected>Selecione o estado de saúde</option>
                                <option value="SAUDAVEL">Saudável</option>
                                <option value="DOENTE">Doente</option>
                                <option value="RECUPERANDO">Recuperando</option>
                            </select>
                            <div class="invalid-feedback">Por favor, selecione o estado de saúde do animal.</div>
                        </div>

                        <div class="mb-4">
                            <label for="recinto" class="form-label text-secondary">Recinto</label>
                            <input type="text" name="recinto" class="form-control form-control-lg border-2 border-success" id="recinto"
                                   placeholder="Recinto 1 - Elefantes" required>
                            <div class="invalid-feedback">Por favor, insira o recinto onde o animal está alojado.</div>
                        </div>

                        <button type="submit" class="btn btn-success btn-lg w-100 py-3 mb-3 shadow-sm">
                            <i class="bi bi-box-arrow-in-right me-2"></i> Registrar Animal
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
                        <h2 class="display-5 fw-bold mb-4">Bem-vindo ao Cadastro de Animais</h2>
                        <p class="lead">Ajude a registrar nossos animais para melhor cuidado e acompanhamento.</p>
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
            alert("Animal registrado com sucesso!");
        } else if (success === "false") {
            alert("Erro: Animal já registrado ou outro erro.");
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
