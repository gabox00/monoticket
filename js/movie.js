$(document).ready(() => {
    const searchForm = $('#search-form');
    const movieList = $('#peliculas #movie-list');

    loadMovies({target: {value: ''}}, movieList);

    searchForm.on('input', async (event) => {
        loadMovies(event, movieList);
    });
});

async function loadMovies(event, movieList){
    const query = event.target.value;
    const response = await fetch('?controller_option=MovieController&method_option=index', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({query})
    });
    const movies = await response.json();
    movieList.html('');
    movies.forEach(movie => {
        const movieCard = $('<li>').addClass('movie-card');
        movieCard.attr('data-id', movie.id); // Agregar el data-id a la tarjeta de película
        movieCard.attr('data-title', movie.title);
        const movieImage = $('<img>').addClass('movie-image').attr('src', movie.cover);
        const movieInfo = $('<div>').addClass('movie-info');
        const movieTitle = $('<h2>').addClass('movie-title').text(movie.title);
        const movieSynopsis = $('<p>').addClass('movie-synopsis').text(movie.synopsis);
        movieInfo.append(movieTitle, movieSynopsis);
        movieCard.append(movieImage, movieInfo);
        movieList.append(movieCard);
    });
}
