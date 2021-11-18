<?php

namespace App\Controllers;

class Dashboard extends BaseController
{

    public function index()
    {
        $data = [
            'title' => 'Dashboard | Our Inventory'
        ];
        return view('dashboard/index', $data);
    }
}
