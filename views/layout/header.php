<header>
    <!-- MENU -->
    <nav>
        <!-- menu logo aparecera cuando el with de la web sea < 850, reutilizamos en ul del nav para el acordeon -->
        <img id="menu-logo" src="assets/img/menu.png" alt="menu" hidden onclick="showOrHideAcordeonMenu()">

        <!-- menu con su logo que se ve al abrir la pagina -->
        <div id="logo">
            <a href="#"><img src="assets/img/monoticket.png" alt="MONOTICKET"></a>
        </div>
        <ul id="menu-list" class="active-acordeon">
            <li>
                <div class="tooltip">
                    <span class="tooltiptext">Home</span>
                    <a href="#">Inicio</a>
                </div>
            </li>
            <li>
                <div class="tooltip">
                    <span class="tooltiptext">Movies</span>
                    <a href="#nosotros">Películas</a>
                </div>
            </li>
            <li>
                <div class="tooltip">
                    <span class="tooltiptext">Contact us</span>
                    <a href="#contacto">Contáctanos</a>
                </div>
            </li>
        </ul>
    </nav>
    <h1 id="titulo">MONO<span>TICKET</span></h1>
    <h2 id="subtitulo">MONOTICKET</h2>
</header>