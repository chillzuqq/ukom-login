<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\BarangModel;
use App\Models\LokasiModel;
use App\Models\SumberModel;

class Barang extends BaseController
{

    public function __construct()
    {
        $this->barangmodel = new BarangModel();
        $this->lokasimodel = new LokasiModel();
        $this->sumbermodel = new SumberModel();
    }

    public function index()
    {
        $data = [
            'title' => 'Barang | Our Inventory',
            'table_title' => 'Data Barang',
            'barang' => $this->barangmodel->getBarang(),
            'user' => session('username')
        ];
        // dd($data['barang']);
        return view('dashboard/barang', $data);
    }

    public function detail($id)
    {
        $data = [
            'title' => 'Barang | Our Inventory',
            'page_title' => 'Detail Barang',
            'barang' => $this->barangmodel->getBarang($id),
        ];
        // dd($data['barang']);
        return view('dashboard/detailbarang', $data);
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

        $imgFile = $this->request->getFile('img');
        //default img
        if ($imgFile->getError() == 4) {
            $imgName = 'default.jpg';
        } else {
            //random name
            $imgName = $imgFile->getRandomName();
            //pindah gambar
            $imgFile->move('img/uploaded', $imgName);
        }
        // dd($imgFile, $imgName);
        // send data ke procedure
        $send = $this->barangmodel->addBarang($nama, $spek, $lokasi, $kondisi, $jumlah, $sumber, $imgName);
        // dd($send);
        if ($send) {
            return redirect()->to(base_url('barang'));
        } else {
            echo 'gagal';
        }
    }

    public function delete($id)
    {
        //cari based id
        $data = $this->barangmodel->find($id);

        //if img default
        if ($data['gambar'] != 'default.jpg') {
            //delete img
            unlink('img/uploaded/' . $data['gambar']);
        }

        //hapus data
        // dd($id);
        $this->barangmodel->delete($id);
        return redirect()->to(base_url('barang'));
    }

    public function edit($id)
    {

        $data = [
            'title' => 'Edit Barang | Our Inventory',
            'table_title' => 'Data Barang',
            'barang' => $this->barangmodel->getBarang($id),
            'lokasi' => $this->lokasimodel->findAll(),
            'sumber' => $this->sumbermodel->findAll()
        ];
        // dd($data['barang']);
        return view('dashboard/editbarang', $data);
    }

    public function updatebarang()
    {
        //ambil gambar
        $imgFile = $this->request->getFile('img');
        //check
        if ($imgFile->getError() == 4) {
            $imgName = $this->request->getVar('oldImg');
        } else {
            //random name
            $imgName = $imgFile->getRandomName();
            //pindah gambar
            $imgFile->move('img/uploaded', $imgName);
            if ($this->request->getVar('oldImg') != 'default.jpg') {
                //delete old file
                unlink('img/uploaded/' . $this->request->getVar('oldImg') . '');
            }
        }

        // dd($this->request->getVar());
        $this->barangmodel->save([
            'id_barang' => $this->request->getVar('id_barang'),
            'nama_barang' => $this->request->getVar('nama_barang'),
            'spesifikasi' => $this->request->getVar('spesifikasi'),
            'lokasi' => $this->request->getVar('lokasi'),
            'kondisi' => $this->request->getVar('kondisi'),
            'jumlah_barang' => $this->request->getVar('jumlah_barang'),
            'sumber_dana' => $this->request->getVar('sumber_dana'),
            'gambar' => $imgName
        ]);
        session()->setFlashdata('message', 'Data has been edited');
        return redirect()->to(base_url('barang'));
    }
}
