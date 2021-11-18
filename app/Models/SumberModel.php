<?php

namespace App\Models;

use CodeIgniter\Model;

class SumberModel extends Model
{
    protected $table            = 'sumber_dana';
    protected $primaryKey       = 'id_sumber';
    protected $allowedFields    = ['nama_sumber', 'keterangan'];
}
