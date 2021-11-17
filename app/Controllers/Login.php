<?php

namespace App\Controllers;

use App\Models\UserModel;

class Login extends BaseController
{
    protected $user;
    protected $pass;
    protected $level;
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
        //ambil value dari form login 
        $this->user = $this->request->getVar('username');
        $this->pass = $this->request->getVar('password');

        //cari user
        $data = $this->UserModel->where('username', $this->user)
            ->first();

        //validasi user
        if ($data) {
            //ambil data password user
            $verify_pass = password_verify($this->pass,  $data['password']);

            //validasi password  
            if ($verify_pass) {
                //buat session jika password benar
                $session_user = [
                    'id_user' => $data['id_user'],
                    'nama' => $data['nama'],
                    'username' => $data['username'],
                    'login' => true
                ];

                session()->setJSON($session_user);
                return redirect()->to(base_url('dashboard'));
            } else {
                session()->setFlashdata('pesan', 'Password Anda Salah');
                return redirect()->to(base_url('login'));
            }
        } else {
            session()->setFlashdata('pesan', 'Username Anda Salah');
            return redirect()->to(base_url('login'));
        }
    }

    public function logout()
    {
        session()->destroy();
        return redirect()->to(base_url('login'));
    }
}
