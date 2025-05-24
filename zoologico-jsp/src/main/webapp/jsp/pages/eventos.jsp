<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Eventos, Zoo JF</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/jsp/css/eventos.css">
</head>
<body>
<%@ include file="/jsp/fragments/header.jsp" %>
<main class="container-custom">
    <div class="text-center main-title">
        <p class="zoo-subtitle">Fique por dentro dos próximos eventos e atividades especiais do zoológico</p>
    </div>
    <div class="tickets-grid">
        <div class="ticket-card">
            <div class="ticket-header bg-success">
                <h3>Dia das Crianças</h3>
                <p>12 de Outubro</p>
            </div>
            <div class="ticket-body">
                <div class="ticket-icon"><i class="bi bi-balloon"></i></div>
                <p>Atividades lúdicas, pintura facial e encontro com os filhotes!</p>
                <div class="ticket-price">Entrada: R$20</div>
                <div class="economy-text">Crianças até 5 anos não pagam</div>
                <br>
                <a href="#" class="ticket-btn">Saiba mais</a>
            </div>
        </div>

        <div class="ticket-card">
            <div class="ticket-header bg-success">
                <h3>Noite Selvagem</h3>
                <p>25 de Maio</p>
            </div>
            <div class="ticket-body">
                <div class="ticket-icon"><i class="bi bi-moon-stars"></i></div>
                <p>Tour noturno exclusivo para conhecer os hábitos dos animais à noite.</p>
                <div class="ticket-price">Entrada: R$40</div>
                <div class="economy-text">Vagas limitadas</div>
                <br>
                <a href="#" class="ticket-btn">Inscreva-se</a>
            </div>
        </div>

        <div class="ticket-card">
            <div class="ticket-header bg-success">
                <h3>Corrida do Leão</h3>
                <p>10 de Junho</p>
            </div>
            <div class="ticket-body">
                <div class="ticket-icon"><i class="bi bi-person-running"></i></div>
                <p>Corrida temática no zoológico com premiações e medalhas ecológicas.</p>
                <div class="ticket-price">Inscrição: R$30</div>
                <div class="economy-text">Inclui camiseta e medalha</div>
                <br>
                <a href="#" class="ticket-btn">Participar</a>
            </div>
        </div>
    </div>
</main>
<%@ include file="/jsp/fragments/footer.jsp" %>
</body>
</html>
