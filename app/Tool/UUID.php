<?php

namespace App\Tool;

class UUID {

  static function create($prefix = '') {

    $chars = md5(uniqid(mt_rand(), true));

    $uuid = substr($chars,0,8);
    $uuid .= substr($chars,8,4);
    $uuid .= substr($chars,12,4);
    $uuid .= substr($chars,16,4);
    $uuid .= substr($chars,20,12);

    return $prefix . $uuid;
  }
}
