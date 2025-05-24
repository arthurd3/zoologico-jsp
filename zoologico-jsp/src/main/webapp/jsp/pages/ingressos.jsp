<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Ingressos , ZooJF</title>
    <link rel="icon" href="jsp/images/zoo-logo.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="/jsp/css/ingresso.css" rel="stylesheet">
</head>
<body>
<%@ include file="/jsp/fragments/header.jsp" %>

<main class="container-custom">
    <div class="tickets-grid">
        <div class="ticket-card">
            <div class="ticket-header infantil">
                <h3>INFANTIL</h3>
                <p>(até 12 anos)</p>
            </div>
            <div class="ticket-body">
                <div class="ticket-icon"><i class="bi bi-emoji-smile"></i></div>
                <p>Um dia cheio de descobertas e sorrisos para os pequenos exploradores!</p>
                <div class="ticket-price">R$20</div>
                <a href="#" class="ticket-btn">Comprar agora</a>
            </div>
        </div>

        <div class="ticket-card">
            <div class="ticket-header adulto">
                <h3>ADULTO</h3>
                <p>(acima de 18 anos)</p>
            </div>
            <div class="ticket-body">
                <div class="ticket-icon"><i class="bi bi-person"></i></div>
                <p>Explore o ZooJF no seu ritmo e aproveite cada momento com liberdade.</p>
                <div class="ticket-price">R$40</div>
                <a href="#" class="ticket-btn">Comprar agora</a>
            </div>
        </div>

        <div class="ticket-card">
            <div class="ticket-header idoso">
                <h3>IDOSO</h3>
                <p>(acima de 60 anos)</p>
            </div>
            <div class="ticket-body">
                <div class="ticket-icon"><i class="bi bi-person-hearts"></i></div>
                <p>Tranquilidade, conforto e diversão para aproveitar o dia do seu jeito.</p>
                <div class="ticket-price">R$15</div>
                <a href="#" class="ticket-btn">Comprar agora</a>
            </div>
        </div>

        <div class="ticket-card position-relative">
            <div class="popular-badge">Mais vendido!</div>
            <div class="ticket-header familia">
                <h3>FAMÍLIA</h3>
                <p>(2 adultos + 2 crianças)</p>
            </div>
            <div class="ticket-body">
                <div class="ticket-icon"><i class="bi bi-people-fill"></i></div>
                <p>Um dia especial em família, com economia e muitos sorrisos compartilhados.</p>
                <div class="ticket-price">R$100</div>
                <p class="economy-text">Ideal para Familias grandes  e visitas coletivas</p>
                <a href="#" class="ticket-btn">Vamos juntos!</a>
            </div>
        </div>

        <div class="ticket-card position-relative">
            <div class="ticket-header familia">
                <h3>PASSE ANUAL</h3>
                <p>(visitas ilimitadas)</p>
            </div>
            <div class="ticket-body">
                <div class="ticket-icon"><i class="bi bi-calendar3"></i></div>
                <p>Tenha acesso ao ZooJF o ano inteiro com um único pagamento.</p>
                <div class="ticket-price">R$150</div>
                <p class="economy-text">Ideal para visitantes frequentes</p>
                <a href="#" class="ticket-btn">Adquirir passe</a>
            </div>
        </div>

        <div class="ticket-card position-relative">
            <div class="ticket-header familia">
                <h3>GRUPO ESCOLAR</h3>
                <p>(a partir de 15 alunos)</p>
            </div>
            <div class="ticket-body">
                <div class="ticket-icon"><i class="bi bi-backpack2"></i></div>
                <p>Tenha um aproveitamento com guia especializado - 10 reais por Aluno</p>
                <div class="ticket-price">R$10</div>
                <p class="economy-text">Agendamento antecipado obrigatório</p>
                <a href="#" class="ticket-btn">Solicitar visita</a>
            </div>
        </div>
    </div>
</main>
<%@ include file="/jsp/fragments/footer.jsp" %>
</body>
</html>
