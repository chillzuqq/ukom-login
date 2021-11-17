<?php

namespace App\Controllers;

use App\Models\BarangModel;

class Dashboard extends BaseController
{
    protected $barangmodel;

    public function __construct()
    {
        $this->barangmodel = new BarangModel();
    }
    public function index()
    {
        $data = [
            'title' => 'Dashboard | Our Inventory'
        ];
        return view('dashboard/index', $data);
    }

    public function barang(){
        $data = [
            'title' => 'Barang | Our Inventory',
            'table_title' => 'Data Barang',
            'barang' => $this->barangmodel->getAllBarang()
        ];
        // dd($data['barang']);
        return view('dashboard/barang', $data);
    }
}
