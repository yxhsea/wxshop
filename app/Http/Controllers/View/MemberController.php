<?php

namespace App\Http\Controllers\View;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MemberController extends Controller
{
  public function toLogin(Request $request)
  {
    $return_url = $request->input('return_url', '');
    return view('login')->with('return_url', urldecode($return_url));
  }

  public function toRegister($value='')
  {
    return view('register');
  }
}
