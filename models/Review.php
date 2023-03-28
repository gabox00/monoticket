<?php

namespace MONOTICKET\Models;

use Exception;
use MONOTICKET\Config\Database;

class Review
{
    private int $id;
    private int $movie_id;
    public string $review;
    public string $created_at;
    public string $updated_at;

    private $db;

    public function __construct($_movie_id, $_review) {
        $this->db = Database::Connect();
        $this->movie_id = $_movie_id;
        $this->review = $_review;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getMovieId(): int
    {
        return $this->movie_id;
    }

    public static function getReviewsByMovieId(int $movieId): array {
        $db = Database::Connect();
        $stmt = $db->prepare('SELECT * FROM reviews WHERE movie_id = ? ORDER BY created_at DESC');
        $stmt->bind_param('i', $movieId);
        $stmt->execute();
        $rs = $stmt->get_result();
        return $rs->fetch_all(MYSQLI_ASSOC);
    }

    public function getReviewById(string|int $id) {
        $stmt = $this->db->prepare('SELECT * FROM reviews WHERE id = ?');
        $stmt->bind_param('i', $id);
        $stmt->execute();
        $rs = $stmt->get_result();
        return $rs && $rs->num_rows == 1
            ? $rs->fetch_object()
            : null;
    }

    public function save(){
        try {
            $movie_id = $this->getMovieId();
            $stmt = $this->db->prepare("INSERT INTO reviews VALUES(null,?,?,NOW(),NOW())");
            $stmt->bind_param('is', $movie_id, $this->review);
            $stmt->execute();
            $lastMovieId = $this->db->insert_id;
            return $this->getReviewById($lastMovieId);
        }
        catch (Exception $e){
            return false;
        }
    }

}