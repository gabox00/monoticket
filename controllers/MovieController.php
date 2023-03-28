<?php

namespace MONOTICKET\Controllers;

use MONOTICKET\Models\Movie;

class MovieController {

    public function index(){
        session_start();
        $query = $_POST['query'] ?? '';
        $movies = Movie::searchMovies($query);
        header('Content-Type: application/json');
        echo json_encode($movies);
    }


}
