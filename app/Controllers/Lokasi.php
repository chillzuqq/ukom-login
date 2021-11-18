<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\LokasiModel;

class Lokasi extends BaseController
{
    public function __construct()
    {
        $this->LokasiModel = new LokasiModel();
    }

    public function index()
    {
        $data = [
            'title' => 'Lokasi | Our Inventory',
            'table_title' => 'Data Lokasi',
            'lokasi' => $this->LokasiModel->findAll()
        ];
        return view('dashboard/lokasi', $data);
    }
}
