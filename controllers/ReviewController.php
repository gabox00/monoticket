<?php

namespace MONOTICKET\Controllers;

use MONOTICKET\Models\Review;
use Exception;

class ReviewController {

    public function index() {
        try {
            $movieId = $_POST['movie_id'] ?? '';
            $reviews = Review::getReviewsByMovieId($movieId);
            http_response_code(200);
            header('Content-Type: application/json');
            echo json_encode($reviews);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['error' => $e->getMessage()]);
        }
    }

    public function store() {
        try {
            $movieId = $_POST['movie_id'] ?? '';
            $review = $_POST['review'] ?? '';
            $review = new Review($movieId, $review);
            $newReview = $review->save();
            http_response_code(201);
            header('Content-Type: application/json');
            echo json_encode($newReview);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['error' => $e->getMessage()]);
        }
    }
}
