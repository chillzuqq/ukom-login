<?php

namespace App\Models;

use CodeIgniter\Model;

class barangModel extends Model
{
    protected $table = 'barang';
    protected $primaryKey = 'id';

    protected $allowedFields = ['nama', 'username', 'password', 'level'];

    public function getAllBarang(){
        // $sql = "SELECT * FROM view_barang";
        
        // return $this->query($sql);
        return $this
        ->join('lokasi', 'barang.lokasi=lokasi.id_lokasi')
        ->join('sumber_dana', 'barang.sumber_dana=sumber_dana.id_sumber')
        ->findAll();
    }
}
