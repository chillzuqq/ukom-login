<?php

namespace App\Controllers;

use App\Models\BarangModel;
use App\Models\LokasiModel;
use App\Models\SumberModel;

class Dashboard extends BaseController
{
    protected $barangmodel;

    public function __construct()
    {
        $this->barangmodel = new BarangModel();
        $this->lokasimodel = new LokasiModel();
        $this->sumbermodel = new SumberModel();
    }
    public function index()
    {
        $data = [
            'title' => 'Dashboard | Our Inventory'
        ];
        return view('dashboard/index', $data);
    }

    public function barang()
    {
        $data = [
            'title' => 'Barang | Our Inventory',
            'table_title' => 'Data Barang',
            'barang' => $this->barangmodel->getAllBarang()
        ];
        // dd($data['barang']);
        return view('dashboard/barang', $data);
    }

    public function createBarang()
    {
        $data = [
            'title' => 'Tambah Barang | Our Inventory',
            'lokasi' => $this->lokasimodel->findAll(),
            'sumber' => $this->sumbermodel->findAll()
        ];
        // dd($data['lokasi']);
        return view('dashboard/addbarang', $data);
    }

    public function saveBarang()
    {
        $nama = $this->request->getVar('nama_barang');
        $spek = $this->request->getvar('spesifikasi');
        $lokasi = $this->request->getvar('lokasi');
        $kondisi = $this->request->getvar('kondisi');
        $jumlah = $this->request->getvar('jumlah_barang');
        $sumber = $this->request->getvar('sumber_dana');

        $send = $this->barangmodel->addBarang($nama, $spek, $lokasi, $kondisi, $jumlah, $sumber);
        // dd($send);
        if ($send) {
            return redirect()->to(base_url('dashboard/barang'));
        } else {
            echo 'gagal';
        }
    }
}
