<?php

namespace MONOTICKET\Config;

use mysqli;

class Database {

    public static function Connect(){
        $db = new mysqli("localhost", "root", "", 'gabriel_gutierrez');
        $db->query("SET NAMES 'utf8'");
        return $db;
    }
}