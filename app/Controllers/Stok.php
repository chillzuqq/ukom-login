<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\StokModel;

class Stok extends BaseController
{
    public function __construct()
    {
        $this->StokModel = new StokModel();
    }

    public function index()
    {
        $data = [
            'title' => 'Stok | Our Inventory',
            'table_title' => 'Data Stok',
            'stok' => $this->StokModel->getStok()
        ];
        // dd($data['stok']);
        return view('dashboard/stok', $data);
    }
}
