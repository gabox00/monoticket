// Agregar un controlador de eventos a todas las tarjetas de película
$(document).on('click', '.movie-card', async (event) => {
    // Obtener el ID de la película haciendo clic en el atributo "data-id" de la tarjeta
    const movie_id = $(event.currentTarget).data('id');
    // Obtener los comentarios de la película utilizando una llamada AJAX al controlador de PHP correspondiente
    const response = await fetch(`?controller_option=ReviewController&method_option=index`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({movie_id})
    });
    const reviews = await response.json();

    // Mostrar el modal de comentarios
    $('#comment-modal').show();

    // Mostrar el título de la película en el modal
    $('#movie-title').text($(event.currentTarget).data('title'));

    // Agregar los comentarios al modal
    const commentList = $('#comment-list');
    commentList.empty();
    reviews.forEach(review => {
        const comment = $('<li>').addClass('comment');
        const commentText = $('<p>').addClass('comment-text').text(review.review);
        const commentDate = $('<p>').addClass('comment-date').text(review.created_at);
        comment.append(commentText, commentDate);
        commentList.append(comment);
    });

    // Agregar un controlador de eventos al formulario de comentarios para enviar nuevos comentarios
    $('#comment-form').off('submit').on('submit', async function(event) {
        event.preventDefault();
        const commentText = $('#comment-text').val().trim();
        if (commentText) {
            const commentText2 = $('#comment-text').val().trim();
            const response = await fetch(`?controller_option=ReviewController&method_option=store`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({review: commentText2, movie_id})
            });
            const newReview = await response.json();
            // Agregar el nuevo comentario a la lista de comentarios
            const comment = $('<li>').addClass('comment');
            const commentText = $('<p>').addClass('comment-text').text(newReview.review);
            const commentDate = $('<p>').addClass('comment-date').text(newReview.created_at);
            comment.append(commentText, commentDate);
            commentList.prepend(comment);
            // Borrar el contenido del formulario de comentarios después de enviar
            $('#comment-text').val('');
            $('#comment-list').animate({ scrollTop: 0 }, 'fast');
        }
    });

    // Obtener el botón de cerrar modal
    const modalCloseButton = document.getElementById('modal-close');

    // Agregar un controlador de eventos al botón de cerrar modal
    modalCloseButton.addEventListener('click', function() {
        // Ocultar el modal
        document.getElementById('comment-modal').style.display = 'none';
    });

    // Obtener el modal
    const modal = document.getElementById('comment-modal');

    // Agregar un controlador de eventos para cerrar el modal al hacer clic fuera del modal
    window.addEventListener('click', function(event) {
        if (event.target == modal) {
            // Ocultar el modal
            modal.style.display = 'none';
        }
    });

    const modalClose = $('#modal-close');

    // Agregar un evento click al modal
    modal.on('click', function(event) {
        if (event.target === modal[0]) {
            modal.hide();
        }
    });

    // Agregar un evento click al botón de cierre
    modalClose.on('click', function() {
        modal.hide();
    });

});
