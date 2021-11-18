<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\PinjamBarangModel;

class Peminjaman extends BaseController
{
    public function __construct()
    {
        $this->PinjamBarangModel = new PinjamBarangModel();
    }

    public function index()
    {
        $data = [
            'title' => 'Peminjaman | Our Inventory',
            'table_title' => 'Data Pinjam',
            'pinjam' => $this->PinjamBarangModel->getPinjam()
        ];
        // dd($data['pinjam']);
        return view('dashboard/pinjam', $data);
    }

    public function detail($id)
    {
        $data = [
            'title' => 'Peminjaman | Our Inventory',
            'page_title' => 'Detail Pinjam',
            'pinjam' => $this->PinjamBarangModel->getPinjam($id),
        ];
        return view('dashboard/detailpinjam', $data);
    }

    public function kembali($id)
    {
        $data = $this->PinjamBarangModel->getPinjam($id);
        $date = date('Y-m-d');
        $datasave = [
            'id_pinjam' => $data['id_pinjam'],
            'peminjam' => $data['peminjam'],
            'tgl_pinjam' => $data['tgl_pinjam'],
            'barang_pinjam' => $data['barang_pinjam'],
            'jml_pinjam' => $data['jml_pinjam'],
            'tgl_kembali' => $date,
            'kondisi' => $data['kondisi']
        ];
        // dd($datasave);
        $this->PinjamBarangModel->save($datasave);
        session()->setFlashdata('message', 'Data has been edited');
        return redirect()->to(base_url("peminjaman/detail/$id"));
    }
}
