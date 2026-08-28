<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="es">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Galería de la Tunantada</title>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/Estilo.css">
</head>

<body>

    <!-- Encabezado -->

    <header class="encabezado">
        <h1>Galería de la Tunantada</h1>

        <p>
            Tradición, música y elegancia del valle de Jauja
        </p>
    </header>

    <!-- Contenido principal -->

    <main class="contenedor">

        <section class="presentacion">
            <h2>La Tunantada</h2>

            <p>
                Conoce mediante esta galería algunos personajes,
                vestimentas y momentos representativos de esta
                tradicional danza de Jauja.
            </p>
        </section>

        <!-- Galería -->

        <section class="galeria">

            <!-- Miniaturas -->

            <div class="miniaturas">

                <button class="miniatura activa"
                        type="button"
                        onclick="seleccionarImagen(0)"
                        aria-label="Mostrar imagen 1">

                    <img
                        src="<%=request.getContextPath()%>/Imagenes/imagen1.jpg"
                        alt="Celebración de la Tunantada">
                </button>

                <button class="miniatura"
                        type="button"
                        onclick="seleccionarImagen(1)"
                        aria-label="Mostrar imagen 2">

                    <img
                        src="<%=request.getContextPath()%>/Imagenes/imagen2.jpg"
                        alt="Personaje de la Tunantada">
                </button>

                <button class="miniatura"
                        type="button"
                        onclick="seleccionarImagen(2)"
                        aria-label="Mostrar imagen 3">

                    <img
                        src="<%=request.getContextPath()%>/Imagenes/imagen3.jpg"
                        alt="Pareja bailando Tunantada">
                </button>

                <button class="miniatura"
                        type="button"
                        onclick="seleccionarImagen(3)"
                        aria-label="Mostrar imagen 4">

                    <img
                        src="<%=request.getContextPath()%>/Imagenes/imagen4.jpg"
                        alt="Danzantes de la Tunantada">
                </button>

                <button class="miniatura"
                        type="button"
                        onclick="seleccionarImagen(4)"
                        aria-label="Mostrar imagen 5">

                    <img
                        src="<%=request.getContextPath()%>/Imagenes/imagen5.jpg"
                        alt="Presentación tradicional">
                </button>

                <button class="miniatura"
                        type="button"
                        onclick="seleccionarImagen(5)"
                        aria-label="Mostrar imagen 6">

                    <img
                        src="<%=request.getContextPath()%>/Imagenes/imagen6.jpg"
                        alt="Personaje tradicional">
                </button>

            </div>

            <!-- Visor de la imagen principal -->

            <div class="visor">

                <span class="contador"
                      id="contador">
                    1 / 6
                </span>

                <span class="aviso-zoom">
                    Clic para ampliar
                </span>

                <button class="flecha anterior"
                        type="button"
                        onclick="imagenAnterior()"
                        aria-label="Mostrar imagen anterior">
                    &#10094;
                </button>

                <img
                    id="imagenPrincipal"
                    class="imagen-principal"
                    src="<%=request.getContextPath()%>/Imagenes/imagen1.jpg"
                    alt="Celebración de la Tunantada"
                    onclick="abrirModal()">

                <button class="flecha siguiente"
                        type="button"
                        onclick="imagenSiguiente()"
                        aria-label="Mostrar imagen siguiente">
                    &#10095;
                </button>

                <div class="informacion">

                    <h2 id="tituloImagen">
                        Celebración de la Tunantada
                    </h2>

                    <p id="descripcionImagen">
                        Danzantes interpretando la Tunantada
                        con sus coloridas y elegantes
                        vestimentas tradicionales.
                    </p>

                </div>

            </div>

        </section>

        <!-- Explicación -->

        <section class="instrucciones">

            <h3>¿Cómo utilizar la galería?</h3>

            <p>
                Selecciona una miniatura o utiliza las flechas
                para cambiar de imagen. Haz clic sobre la imagen
                principal para verla en un tamaño mayor.
            </p>

        </section>

    </main>

    <!-- Ventana emergente -->

    <div class="modal"
         id="modal"
         role="dialog"
         aria-modal="true"
         aria-label="Imagen ampliada">

        <button class="cerrar"
                type="button"
                onclick="cerrarModal()"
                aria-label="Cerrar ventana">
            &times;
        </button>

        <img
            id="imagenModal"
            src=""
            alt="Imagen ampliada de la Tunantada">

        <p id="tituloModal"></p>

    </div>

    <!-- Pie de página -->

    <footer class="pie">
        <p>
            Tarea 03
            <strong>COLLANA GASPAR DAVID</strong>
            - 2026
        </p>
    </footer>

    <!-- JavaScript -->

    <script>
        const rutaImagenes =
            "<%=request.getContextPath()%>/Imagenes/";

        const imagenes = [
            {
                archivo: "imagen1.jpg",
                titulo: "Celebración de la Tunantada",
                descripcion:
                    "Danzantes interpretando la Tunantada con sus coloridas y elegantes vestimentas tradicionales."
            },
            {
                archivo: "imagen2.jpg",
                titulo: "Personajes tradicionales",
                descripcion:
                    "Los personajes forman parte de la identidad cultural de Jauja y utilizan vestimentas llenas de color."
            },
            {
                archivo: "imagen3.jpg",
                titulo: "Elegancia en el baile",
                descripcion:
                    "La Tunantada se caracteriza por sus movimientos elegantes, su música y sus trajes tradicionales."
            },
            {
                archivo: "imagen4.jpg",
                titulo: "Encuentro de danzantes",
                descripcion:
                    "Los participantes se reúnen para expresar mediante el baile la tradición y alegría del pueblo jaujino."
            },
            {
                archivo: "imagen5.jpg",
                titulo: "Música y tradición",
                descripcion:
                    "La música acompaña los movimientos de los personajes durante la presentación de la Tunantada."
            },
            {
                archivo: "imagen6.jpg",
                titulo: "Personaje de la Tunantada",
                descripcion:
                    "Cada personaje utiliza una vestimenta particular, máscara y diferentes accesorios tradicionales."
            }
        ];

        let posicionActual = 0;

        const imagenPrincipal =
            document.getElementById("imagenPrincipal");

        const tituloImagen =
            document.getElementById("tituloImagen");

        const descripcionImagen =
            document.getElementById("descripcionImagen");

        const contador =
            document.getElementById("contador");

        const miniaturas =
            document.querySelectorAll(".miniatura");

        function seleccionarImagen(posicion) {
            posicionActual = posicion;

            const imagenSeleccionada =
                imagenes[posicionActual];

            imagenPrincipal.style.opacity = "0.2";

            window.setTimeout(function () {
                imagenPrincipal.src =
                    rutaImagenes +
                    imagenSeleccionada.archivo;

                imagenPrincipal.alt =
                    imagenSeleccionada.titulo;

                tituloImagen.textContent =
                    imagenSeleccionada.titulo;

                descripcionImagen.textContent =
                    imagenSeleccionada.descripcion;

                contador.textContent =
                    (posicionActual + 1) +
                    " / " +
                    imagenes.length;

                miniaturas.forEach(
                    function (miniatura, indice) {
                        miniatura.classList.toggle(
                            "activa",
                            indice === posicionActual
                        );
                    }
                );

                imagenPrincipal.style.opacity = "1";
            }, 150);
        }

        function imagenSiguiente() {
            let nuevaPosicion =
                posicionActual + 1;

            if (nuevaPosicion >= imagenes.length) {
                nuevaPosicion = 0;
            }

            seleccionarImagen(nuevaPosicion);
        }

        function imagenAnterior() {
            let nuevaPosicion =
                posicionActual - 1;

            if (nuevaPosicion < 0) {
                nuevaPosicion =
                    imagenes.length - 1;
            }

            seleccionarImagen(nuevaPosicion);
        }

        function abrirModal() {
            const modal =
                document.getElementById("modal");

            const imagenModal =
                document.getElementById("imagenModal");

            const tituloModal =
                document.getElementById("tituloModal");

            imagenModal.src =
                imagenPrincipal.src;

            imagenModal.alt =
                imagenes[posicionActual].titulo;

            tituloModal.textContent =
                imagenes[posicionActual].titulo;

            modal.classList.add("abierto");

            document.body.style.overflow =
                "hidden";
        }

        function cerrarModal() {
            const modal =
                document.getElementById("modal");

            modal.classList.remove("abierto");

            document.body.style.overflow =
                "";
        }

        document.getElementById("modal")
            .addEventListener(
                "click",
                function (evento) {
                    if (evento.target.id === "modal") {
                        cerrarModal();
                    }
                }
            );

        document.addEventListener(
            "keydown",
            function (evento) {
                const modal =
                    document.getElementById("modal");

                const modalAbierto =
                    modal.classList.contains("abierto");

                if (evento.key === "Escape") {
                    cerrarModal();
                }

                if (!modalAbierto &&
                    evento.key === "ArrowRight") {
                    imagenSiguiente();
                }

                if (!modalAbierto &&
                    evento.key === "ArrowLeft") {
                    imagenAnterior();
                }
            }
        );

        seleccionarImagen(0);
    </script>

</body>

</html>