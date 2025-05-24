<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Animais , Zoo Jf</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="/jsp/fragments/header.jsp" %>

<div class="container my-5">
    <h2 class="mb-4">Nossos Animais</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card h-100">
                <img src="https://imgs.search.brave.com/2y21O6KAnEkSXGsVjyfcqCJzhZtb3FksmCCGH4PEjYM/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvOTQz/MjMyNDgvcHQvZm90/by9ncmFuZGUtbGUl/QzMlQTNvLW1vc3Ry/YXItcXVlLSVDMyVB/OS1vLXJlaS5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9TDlv/RGV2V1dhM3VaZ3Vr/OE5QbVBtSEt4dkZu/VmhDWE9CNGNSWFEt/UjdWQT0" class="card-img-top" alt="Leão">
                <div class="card-body">
                    <h5 class="card-title">Leão</h5>
                    <p class="card-text">O rei da selva, símbolo de força e coragem.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://imgs.search.brave.com/QGt02kfCL-MhIDyrq1xV_XHrZ6JlZSQLwGB7crjIVv8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZWN5Y2xlLmNv/bS5ici93cC1jb250/ZW50L3VwbG9hZHMv/MjAyMS8xMS8wODEx/MDE0Mi9tYXJpb2xh/LWdyb2JlbHNrYS1l/UWREVWRpNXFMay11/bnNwbGFzaC0xMDI0/eDY1Ny5qcGcud2Vi/cA" class="card-img-top" alt="Girafa">
                <div class="card-body">
                    <h5 class="card-title">Girafa</h5>
                    <p class="card-text">Pescoço longo e visão privilegiada da savana.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://imgs.search.brave.com/DVqFg4E74oF6LeWoG1DObio8edHEsqHnZVd_gcJ5qc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/cGV0ei5jb20uYnIv/YmxvZy93cC1jb250/ZW50L3VwbG9hZHMv/MjAyMi8wMy9xdWFu/dG8tcGVzYS11bS1l/bGVmYW50ZTMuanBn" class="card-img-top" alt="Elefante">
                <div class="card-body">
                    <h5 class="card-title">Elefante</h5>
                    <p class="card-text">Gigante gentil e muito inteligente.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://inaturalist-open-data.s3.amazonaws.com/photos/13207883/original.jpg" class="card-img-top" alt="Tigre">
                <div class="card-body">
                    <h5 class="card-title">Tigre</h5>
                    <p class="card-text">Feroz, ágil e com listras únicas.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://imgs.search.brave.com/f4wdZn4cMAGAcuI-xJIuP8iAJe3Hc1MB5tSBGMoHfag/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTI5/OTQ4Njc2NC9waG90/by96ZWJyYS1wb3J0/cmFpdC5qcGc_cz02/MTJ4NjEyJnc9MCZr/PTIwJmM9ZDJGd1M3/TWFjRUxFc2dFUHhK/akw3UzB1UlFxWGEt/UTNJRVhhRVAxU1Jz/bz0" class="card-img-top" alt="Zebra">
                <div class="card-body">
                    <h5 class="card-title">Zebra</h5>
                    <p class="card-text">Listras que funcionam como impressão digital.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Polar_Bear_-_Alaska_%28cropped%29.jpg/330px-Polar_Bear_-_Alaska_%28cropped%29.jpg" class="card-img-top" alt="Urso Polar">
                <div class="card-body">
                    <h5 class="card-title">Urso Polar</h5>
                    <p class="card-text">Habita as regiões geladas do Ártico.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://conexaoplaneta.com.br/wp-content/uploads/2018/06/menor-macaco-mundo-vive-amazonia-duas-nao-uma-especie-conexao-planeta.jpg" class="card-img-top" alt="Macaco">
                <div class="card-body">
                    <h5 class="card-title">Macaco</h5>
                    <p class="card-text">Ágil, curioso e muito sociável.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://imgs.search.brave.com/aJyG0h297qp7HvR3z5jAzsKuNXT6iq2BTBLzdIQitSE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdXBl/ci5hYnJpbC5jb20u/YnIvd3AtY29udGVu/dC91cGxvYWRzLzIw/MjQvMDkvMTkwOS1t/b28tZGVuZy1zdXBl/ci1zaXRlMS5qcGc_/cXVhbGl0eT03MCZz/dHJpcD1pbmZvJnc9/MTAyNCZoPTY4MiZj/cm9wPTE" class="card-img-top" alt="Hipopótamo">
                <div class="card-body">
                    <h5 class="card-title">Hipopótamo</h5>
                    <p class="card-text">Gosta de água, mas é territorial e forte.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://imgs.search.brave.com/LtRs2RUrY_eAo1SA2MOUlcX58I5ei_K2-rAQSW4Xe40/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zMy5z/dGF0aWMuYnJhc2ls/ZXNjb2xhLnVvbC5j/b20uYnIvYmUvMjAy/MS8wMi9waW5ndWlt/LWltcGVyYWRvci5q/cGc" class="card-img-top" alt="Pinguim">
                <div class="card-body">
                    <h5 class="card-title">Pinguim</h5>
                    <p class="card-text">Ave que não voa, mas nada como ninguém.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://imgs.search.brave.com/9HTTSJxuCFUzJYMV2cNSPgFAKYiUq9yYeP-3f11uVOQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMubmF0aW9uYWxn/ZW9ncmFwaGljYnJh/c2lsLmNvbS9maWxl/cy9zdHlsZXMvaW1h/Z2VfMzIwMC9wdWJs/aWMvbmF0aW9uYWxn/ZW9ncmFwaGljMjcw/OTkzNy53ZWJwP3c9/NzYwJmg9MTA1NA" class="card-img-top" alt="Canguru">
                <div class="card-body">
                    <h5 class="card-title">Canguru</h5>
                    <p class="card-text">Salta grandes distâncias e carrega os filhotes na bolsa.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://s4.static.brasilescola.uol.com.br/img/2019/09/panda.jpg" class="card-img-top" alt="Panda">
                <div class="card-body">
                    <h5 class="card-title">Panda</h5>
                    <p class="card-text">Adora bambu e é símbolo da preservação.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://imgs.search.brave.com/WUqRAgFcltRvJhy1-KKe5eAIyHM-jhR1Y17G8cQLreA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zMi5n/bGJpbWcuY29tL3VG/NkZoT0ZnNHJsN1RO/UndhZTM1b2NTQzFt/az0vcy5nbGJpbWcu/Y29tL2pvL2cxL2Yv/b3JpZ2luYWwvMjAx/Ni8wNS8zMS9mbGFt/aW5nb18yX2FycXVp/dm9fdGcuanBn" class="card-img-top" alt="Flamingo">
                <div class="card-body">
                    <h5 class="card-title">Flamingo</h5>
                    <p class="card-text">Famoso por sua cor rosa e postura elegante.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/jsp/fragments/footer.jsp" %>
</body>
</html>

<style>
    .card-img-top {
        height: 250px;
        object-fit: cover;
    }
</style>
