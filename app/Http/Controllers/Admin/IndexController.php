<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\M3Result;
use App\Entity\Admin;

class IndexController extends Controller
{
  public function login(Request $request)
  {
    $username = $request->input('username', '');
    $password = $request->input('password', '');

    $m3_result = new M3Result;

    if($username == '' || $password == '') {
      $m3_result->status = 1;
      $m3_result->message = "帐号或密码不能为空!";
      return $m3_result->toJson();
    }

    $admin = Admin::where('username', $username)->where('password', md5('bk'. $password))->first();
    if(!$admin) {
      $m3_result->status = 2;
      $m3_result->message = "帐号或密码错误!";
    } else {
      $m3_result->status = 0;
      $m3_result->message = "登录成功!";

      $request->session()->put('admin', $admin);
    }

    return $m3_result->toJson();
  }

  public function toLogin()
  {
    return view('admin.login');
  }

  public function toExit(Request $request)
  {
    $request->session()->forget('admin');
    return view('admin.login');
  }

  public function toIndex(Request $request)
  {
    $admin = $request->session()->get('admin');
    return view('admin.index')->with('admin', $admin);
  }

  public function welcome(Request $request){
        $data = [
            'HTTP_HOST' => $request->server()['HTTP_HOST'],
            'DOCUMENT_ROOT' => $request->server()['DOCUMENT_ROOT'],
            'SERVER_SOFTWARE' => $request->server()['SERVER_SOFTWARE'],
            'SERVER_PORT' => $request->server()['SERVER_PORT'],
            'PHP_VERSION' =>  PHP_VERSION,
        ];
        return view('admin.welcome',['data'=>$data]);
    }
}
