<?php

namespace App\Controllers;

use App\Models\UserModel;

class Login extends BaseController
{
    protected $UserModel;
    public function __construct()
    {
        $this->UserModel = new UserModel();
    }

    public function index()
    {
        return view('login/login');
    }

    public function auth()
    {
        // return dd($this->request->getVar());
        $username = $this->request->getVar('username');
        $password = md5($this->request->getVar('password'));
        $dataUser = $this->UserModel->where('username', $username)->first();
        // dd($username, $password, $dataUser);

        if ($dataUser) {
            if ($this->UserModel->where('password', $username)) {
                session()->set([
                    'id' => $dataUser['id_user'],
                    'username' => $dataUser['username'],
                    'nama' => $dataUser['nama'],
                    'logged_in' => TRUE
                ]);
                session()->setFlashdata('logged', 'Anda berhasil masuk');
                return redirect()->to(base_url('barang'));
                // $this->response->setJSON($msg);
                // echo 'berhasil';

            } else {
                session()->setFlashdata('error', 'Username/Password Salah');
                return redirect()->back();
            }
        } else {
            session()->setFlashdata('error', 'anda adalah user lama, silakan resgistrasi kembali');
            return redirect()->back();
        }
    }

    // public function adduser()
    // {
    //     $data = [
    //         'nama' => 'Faiq',
    //         'username' => 'admin2',
    //         'password' => password_hash('admin2', PASSWORD_DEFAULT),
    //         'level' => 'U0'
    //     ];
    //     $save = $this->UserModel->save($data);
    //     if ($save == true) {
    //         echo 'berhasil';
    //     }
    // }

    public function logout()
    {
        session()->destroy();
        return redirect()->to(base_url('login'));
    }
}
