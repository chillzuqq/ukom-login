<?php

namespace App\Models;

use CodeIgniter\Model;

class LokasiModel extends Model
{
    protected $table            = 'lokasi';
    protected $primaryKey       = 'id';
    protected $allowedFields    = ['nama_lokasi', 'penanggung_jawab', 'keterangan'];
}
