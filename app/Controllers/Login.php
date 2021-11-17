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
        return redirect()->to(base_url('login'));
    }

    public function auth()
    {
        $this->user = $this->request->getVar('username');
        $this->pass = $this->request->getVar('password');
        $data = $this->UserModel
            ->where([
                'username' => $this->user,
            ])
            ->first();
        if($data){
            $password = $data['password'];
            $verify_pass = password_verify($this->pass, $password);
            if ($verify_pass) {
                $msg = [
                    'login' => true,
                    'nama' => $data['nama'],
                    'level' => $data['level']
                ];

                $this->response->setJSON($msg);
                return redirect()->to(base_url('dashboard'));
            } else {
            return $this->response->setJSON('login gagal');
            }
        }
    }
}
