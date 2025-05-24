<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Faca o Seu Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/jsp/css/login.css" rel="stylesheet">
</head>
<body>
<section class="vh-100 bg-light">
    <div class="container-fluid h-100">
        <div class="position-absolute top-0 start-0 p-3">
            <a href="/" class="btn btn-secondary btn-lg">
                <i class="bi bi-arrow-left me-2"></i> Voltar
            </a>
        </div>

        <div class="row g-0 h-100">
            <div class="col-lg-6 col-md-12 d-flex align-items-center">
                <div class="form-container">
                    <div class="text-center mb-5">
                        <div class="d-flex align-items-center justify-content-center mb-3">
                            <i class="bi bi-tree-fill fa-5x me-2" style="color: #2e8b57;"></i>

                            <h1 class="h2 fw-bold text-success m-0">Zoológico JF</h1>
                        </div>
                        <p class="text-muted">Bem-vindo de volta! Faça login para acessar sua conta.</p>
                    </div>
                    <form class="needs-validation" novalidate method="post" action="/loginController">
                        <div class="mb-4">
                            <label for="email" class="form-label text-secondary">Email</label>
                            <input type="email" name="email" class="form-control form-control-lg border-2 border-success"
                                   id="email" placeholder="seu@email.com" required>
                            <div class="invalid-feedback">Por favor, insira um email válido.</div>
                        </div>
                        <div class="mb-4">
                            <label for="password" class="form-label text-secondary">Senha</label>
                            <input type="password" name="password" class="form-control form-control-lg border-2 border-success"
                                   id="password" required>
                            <div class="invalid-feedback">Por favor, insira sua senha.</div>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div class="form-check">
                                <input class="form-check-input border-success" type="checkbox" id="remember">
                                <label class="form-check-label text-secondary" for="remember">
                                    Lembrar-me
                                </label>
                            </div>
                            <a href="#!" class="text-success text-decoration-none">Esqueceu a senha?</a>
                        </div>
                        <button type="submit" class="btn btn-success btn-lg w-100 py-3 mb-3 shadow-sm">
                            <i class="bi bi-box-arrow-in-right me-2"></i> Entrar
                        </button>
                        <div class="text-center pt-3">
                            <p class="text-muted">Não tem uma conta?
                                <a href="registro.jsp" class="text-success fw-bold text-decoration-none">Cadastre-se</a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-lg-6 d-none d-lg-block position-relative overflow-hidden">
                <div class="background-blur"></div>
                <div class="h-100 d-flex align-items-center justify-content-center position-relative content-container">
                    <div class="text-white p-5 text-center">
                        <img src="https://cdn-icons-png.flaticon.com/512/2913/2913100.png"
                             alt="Animal Silhouette" class="mb-4 icon-style">
                        <h2 class="display-5 fw-bold mb-4">Explore o Mundo Animal</h2>
                        <p class="lead">Acesse nosso sistema e descubra todas as maravilhas do zoológico.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%
    String successLogin = request.getParameter("successLogin");
%>

<script>
    window.addEventListener('DOMContentLoaded', () => {
        const success = "<%= successLogin %>";
        if (success === "true") {
            alert("Login realizado com sucesso!");
            window.location.href = "/";
        } else if (success === "false") {
            alert("Erro: Senha ou Email incorretos.");
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

