<?php

namespace App\Models;

use CodeIgniter\Model;

class PinjamBarangModel extends Model
{
    protected $table            = 'pinjam_barang';
    protected $primaryKey       = 'id_pinjam';
    protected $allowedFields    = ['peminjam', 'tgl_pinjam', 'barang_pinjam', 'jml_pinjam', 'tgl_kembali', 'kondisi'];

    public function getPinjam($id = false)
    {
        if ($id == false) {
            $sql = "SELECT * FROM view_pinjam_baru";

            return $this->query($sql)->getResultArray();
        }

        return $this->where('id_pinjam', $id)
            ->join('user', 'pinjam_barang.peminjam=user.id_user')
            ->join('barang', 'pinjam_barang.barang_pinjam=barang.id_barang')
            ->first();
    }
}
