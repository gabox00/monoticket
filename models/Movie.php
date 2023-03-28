<?php

namespace MONOTICKET\Models;

use MONOTICKET\Config\Database;

class Movie
{
    private int $id;
    public string $title;
    public string $synopsis;
    public string $cover;
    public string $created_at;
    public string $updated_at;

    private $db;

    public function __construct($_title, $_synopsis, $_cover) {
        $this->db = Database::Connect();
        $this->title = $_title;
        $this->synopsis = $_synopsis;
        $this->cover = $_cover;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public static function searchMovies(string $query): array|null {
        $db = Database::Connect();
        $stmt = $db->prepare('SELECT * FROM movies WHERE title LIKE ? OR synopsis LIKE ? OR cover LIKE ? ORDER BY id');
        $searchParam = "%$query%";
        $stmt->bind_param('sss', $searchParam, $searchParam, $searchParam);
        $stmt->execute();
        $rs = $stmt->get_result();
        return $rs->fetch_all(MYSQLI_ASSOC);
    }

}