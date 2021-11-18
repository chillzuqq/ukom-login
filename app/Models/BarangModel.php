<?php

namespace App\Models;

use CodeIgniter\Model;

class barangModel extends Model
{
    protected $table = 'barang';
    protected $primaryKey = 'id_barang';

    protected $allowedFields = ['nama_barang', 'spesifikasi', 'lokasi', 'kondisi', 'jumlah_barang', 'sumber_dana', 'gambar'];

    public function getBarang($id = false)
    {
        if ($id == false) {
            $sql = "SELECT * FROM view_barang_baru";

            return $this->query($sql)->getResultArray();
            // return $this
            // ->join('lokasi', 'barang.lokasi=lokasi.id_lokasi')
            // ->join('sumber_dana', 'barang.sumber_dana=sumber_dana.id_sumber')
            //     ->findAll();
        }

        return $this->where('id_barang', $id)
            ->join('lokasi', 'barang.lokasi=lokasi.id_lokasi')
            ->join('sumber_dana', 'barang.sumber_dana=sumber_dana.id_sumber')
            ->first();
    }

    public function addBarang($nama, $spek, $lokasi, $kondisi, $jumlah, $sumber, $gambar)
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
        return $this->query("CALL addbarang('$nama', '$spek', '$lokasi', '$kondisi', '$jumlah', '$sumber', '$gambar')");
    }
}
