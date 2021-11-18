<?php

namespace App\Models;

use CodeIgniter\Model;

class StokModel extends Model
{
    protected $table = 'stok';

    public function getStok()
    {
        $sql = "SELECT * FROM view_stok";

        return $this->query($sql)->getResultArray();
    }
}
