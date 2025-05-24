<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
        <a href="/" class="navbar-brand" style="width: 115px;">
            <img src="/jsp/images/zoo-logo.png" alt="ZooLife" style="width: 100%; cursor: pointer;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarZoo">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarZoo">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item mx-2">
                    <a class="nav-link fs-5" href="/jsp/pages/animais.jsp">Animais</a>
                </li>

                <li class="nav-item mx-2">
                    <a class="nav-link fs-5" href="/jsp/pages/ingressos.jsp">Ingressos</a>
                </li>

                <li class="nav-item mx-2">
                    <a class="nav-link fs-5" href="/jsp/pages/eventos.jsp">Eventos</a>
                </li>

                <c:if test="${sessionScope.userType == 'EMPLOYEE' || sessionScope.userType == 'ADMIN'}">
                    <li class="nav-item dropdown mx-2">
                        <a class="nav-link dropdown-toggle fs-5" href="#" id="adminDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Administração De Animais
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="adminDropdown">
                            <li><a class="dropdown-item" href="/animalManager">Gerenciar Animais</a></li>
                            <li><a class="dropdown-item" href="/enclosuresManager">Gerenciar Recintos</a></li>
                            <li><a class="dropdown-item" href="/foodManager">Gerenciar Alimentacao</a></li>
                            <li><a class="dropdown-item" href="/jsp/pages/employee/animais-register.jsp">Cadastro de Animais</a></li>
                            <li><a class="dropdown-item" href="/jsp/pages/employee/foods-register.jsp">Cadastro de Alimentos</a></li>
                            <li><a class="dropdown-item" href="/jsp/pages/employee/enclosure-register.jsp">Cadastro de Recintos</a></li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${sessionScope.userType == 'ADMIN'}">
                    <li class="nav-item dropdown mx-2">
                        <a class="nav-link dropdown-toggle fs-5" href="#" id="adminDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Administração De Pessoas
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="adminDropdown">
                            <li><a class="dropdown-item" href="/userManager?typeUser=employee">Gerenciar Funcionarios</a></li>
                            <li><a class="dropdown-item" href="/userManager?typeUser=client">Gerenciar Clientes</a></li>
                            <li><a class="dropdown-item" href="/jsp/pages/admin/usuarios-register.jsp">Cadastro de Usuarios</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
            <ul class="navbar-nav">
                <c:if test="${sessionScope.userType != null}">
                    <li class="nav-item dropdown mx-2">
                        <a class="nav-link dropdown-toggle fs-5" href="#" id="adminDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person me-1"></i> Bem Vindo, ${sessionScope.userName}
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="adminDropdown">
                            <li><a class="dropdown-item" href="/jsp/pages/logout.jsp">Sair</a></li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${sessionScope.userType == null}">
                    <a class="nav-link fs-5" href="/jsp/pages/login.jsp">
                        <i class="bi bi-person me-1"></i> Fazer Login
                    </a>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
