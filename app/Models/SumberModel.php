<?php

namespace App\Models;

use CodeIgniter\Model;

class SumberModel extends Model
{
    protected $table            = 'sumber_dana';
    protected $primaryKey       = 'id';
    protected $allowedFields    = ['nama_sumber', 'keterangan'];
}
