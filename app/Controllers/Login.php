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

    public function logout()
    {
        session()->destroy();
        return redirect()->to('/login');
    }

    public function auth()
    {
        $this->user = $this->request->getVar('username');
        $this->pass = $this->request->getVar('password');
        $check = $this->UserModel
            ->where([
                'username' => $this->user,
                'password' => $this->pass
            ])
            ->first();

        if ($check > 0) {
            $msg = [
                'login' => true,
                'nama' => $check['nama'],
                'level' => $check['level']
            ];

            $this->response->setJSON($msg);
            return redirect()->to('/dashboard');
        } else {
            return $this->response->setJSON('login gagal');
        }
    }
}
