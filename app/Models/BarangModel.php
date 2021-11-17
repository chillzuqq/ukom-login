<?php

namespace App\Models;

use CodeIgniter\Model;

class barangModel extends Model
{
    protected $table = 'barang';
    protected $primaryKey = 'id';

    protected $allowedFields = ['nama_barang', 'spesifikasi', 'lokasi', 'kondisi', 'jumlah_barang', 'sumber_dana'];

    public function getAllBarang()
    {
        // $sql = "SELECT * FROM view_barang";

        // return $this->query($sql);
        return $this
            ->join('lokasi', 'barang.lokasi=lokasi.id_lokasi')
            ->join('sumber_dana', 'barang.sumber_dana=sumber_dana.id_sumber')
            ->findAll();
    }

    public function addBarang($nama, $spek, $lokasi, $kondisi, $jumlah, $sumber)
    {
        // $sql = "CALL addbarang(?, ?, ?, ?, ?, ?)";
        // $data = [
        //     'nama_barang' => $nama,
        //     'spesifikasi' => $spek,
        //     'lokasi' => $lokasi,
        //     'kondisi' => $kondisi,
        //     'jumlah_barang' => $jumlah,
        //     'sumber_dana' => $sumber,
        // ];
        return $this->query("CALL addbarang('$nama', '$spek', '$lokasi', '$kondisi', '$jumlah', '$sumber')");
    }
}
