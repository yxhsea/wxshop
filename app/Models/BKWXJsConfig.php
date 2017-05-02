<?php

namespace App\Models;

class BKWXJsConfig extends M3Result {

  public $appId; // 必填，公众号的唯一标识
  public $timestamp; // 必填，生成签名的时间戳
  public $nonceStr; // 必填，生成签名的随机串
  public $signature; // 必填，签名，见附录1
}
