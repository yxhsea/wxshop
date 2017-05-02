<?php

namespace App\Tool\wxpay;

use Cache;
use App\Models\BKWXPayConfig;
use Log;

class WXTool {

  // JSSDK签名
  public static function signature($jsapi_ticket, $noncestr, $timestamp, $url) {
    $string = "jsapi_ticket=$jsapi_ticket&noncestr=$noncestr&timestamp=$timestamp&url=$url";
    $signature = sha1($string);

    return $signature;
  }

  // 获取Openid
  public static function getOpenid($code) {
    $url = 'https://api.weixin.qq.com/sns/oauth2/access_token'.
                  '?appid=' . config('wx_config.APPID') .
                  '&secret=' . config('wx_config.APPSECRET') .
                  '&code=' . $code .
                  '&grant_type=authorization_code';

    $data = WXTool::httpGet($url);
    $json = json_decode($data);

    return $json->openid;
  }

  // 获取AccessToken
  public static function getAccessToken() {
    $access_token = Cache::get('access_token', '');
    if($access_token != '') {
      return $access_token;
    }

    $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential'.
                  '&appid=' . config('wx_config.APPID') .
                  '&secret=' . config('wx_config.APPSECRET');

    $data = WXTool::httpGet($url);
    $json = json_decode($data);

    if(!isset($json->access_token)) {
      return '';
    }

    Cache::put('access_token', $json->access_token, 7200/60);

    return $json->access_token;
  }

  public static function getJsApiTicket($access_token) {
    $jsapi_ticket = Cache::get('jsapi_ticket', '');
    if($jsapi_ticket != '') {
      return $jsapi_ticket;
    }

    $url = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket' .
                '?access_token=' . $access_token .
                '&type=jsapi';

    $data = WXTool::httpGet($url);
    $json = json_decode($data);

    if(!isset($json->ticket)) {
      return '';
    }

    Cache::put('jsapi_ticket', $json->ticket, 7200/60);

    return $json->ticket;
  }

  public static function httpGet($url) {
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: text/html;charset=utf-8'));
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_TIMEOUT, 500);
    // 为保证第三方服务器与微信服务器之间数据传输的安全性，所有微信接口采用https方式调用，必须使用下面2行代码打开ssl安全校验。
    // 如果在部署过程中代码在此处验证失败，请到 http://curl.haxx.se/ca/cacert.pem 下载新的证书判别文件。
    // curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);
    // curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, true);
    curl_setopt($curl, CURLOPT_URL, $url);

    $res = curl_exec($curl);
    curl_close($curl);

    return $res;
  }

  /**
  * @biref 发送数据post
  * @param $url 传递路径
  * @param $post_date post数据
  */
  public static function httpPost($url, $post_date){
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: text/html;charset=utf-8'));
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); // stop verifying certificate
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_POST, true); // enable posting
    curl_setopt($curl, CURLOPT_POSTFIELDS, $post_date); // post
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true); // if any redirection after upload
    curl_setopt($curl, CURLOPT_URL, $url);

    $res = curl_exec($curl);
    curl_close($curl);

    return $res;
  }

  // 创建随机数
  public static function createNonceStr($length = 16) {
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    $str = "";
    for ($i = 0; $i < $length; $i++) {
      $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
    }
    return $str;
  }

  // 微信支付签名
  public static function wxPayData($body, $out_trade_no, $total_fee, $openid) {
    $appid = config('wx_config.APPID');
    $mch_id = config('wx_config.MCHID');
    $nonce_str = WXTool::createNonceStr();
    $spbill_create_ip = $_SERVER["REMOTE_ADDR"];
    $notify_url = 'http://' . $_SERVER['HTTP_HOST'] . '/service/pay/wx_notify';
    $time_start = date("YmdHis");
    $time_expire = date("YmdHis", time() + 900);
    $trade_type = 'JSAPI';

    // 生成预处理签名
    $stringA = "appid=$appid&body=$body&mch_id=$mch_id&nonce_str=$nonce_str&notify_url=$notify_url" .
              "&openid=$openid&out_trade_no=$out_trade_no&spbill_create_ip=$spbill_create_ip" .
              "&time_expire=$time_expire&time_start=$time_start&total_fee=$total_fee&trade_type=$trade_type";

    $stringSignTemp = $stringA . '&key=' . config('wx_config.KEY');
    $sign = strtoupper(md5($stringSignTemp));

    $url = 'https://api.mch.weixin.qq.com/pay/unifiedorder';
    $xmlTpl = "<xml>
              	<appid><![CDATA[%s]]></appid>
              	<body><![CDATA[%s]]></body>
              	<mch_id><![CDATA[%s]]></mch_id>
              	<nonce_str><![CDATA[%s]]></nonce_str>
              	<notify_url><![CDATA[%s]]></notify_url>
              	<out_trade_no><![CDATA[%s]]></out_trade_no>
              	<spbill_create_ip><![CDATA[%s]]></spbill_create_ip>
                <time_start><![CDATA[%s]]></time_start>
                <time_expire><![CDATA[%s]]></time_expire>
              	<total_fee><![CDATA[%s]]></total_fee>
              	<trade_type><![CDATA[%s]]></trade_type>
              	<sign><![CDATA[%s]]></sign>
                <openid><![CDATA[%s]]></openid>
              </xml>";

    $post_data = sprintf($xmlTpl, $appid, $body, $mch_id, $nonce_str, $notify_url, $out_trade_no,
                      $spbill_create_ip, $time_start, $time_expire, $total_fee, $trade_type, $sign, $openid);

    $return_data = WXTool::httpPost($url, $post_data);

    libxml_disable_entity_loader(true);
    $data = simplexml_load_string($return_data, 'SimpleXMLElement', LIBXML_NOCDATA);

    Log::info('查看错误信息: ' . $data->return_msg);

    // 重新签名
    $timeStamp = time();
    $nonceStr = WXTool::createNonceStr();
    $package = 'prepay_id=' . $data->prepay_id;
    $signType = 'MD5';

    $stringA = "appId=$appid&nonceStr=$nonceStr&package=$package&signType=$signType&timeStamp=$timeStamp";
    $stringSignTemp = $stringA . '&key=' . config('wx_config.KEY');
    $sign = strtoupper(md5($stringSignTemp));

    // 返回相关参数
    $bk_wx_pay_config = new BKWXPayConfig;
    $bk_wx_pay_config->timestamp = $timeStamp;
    $bk_wx_pay_config->nonceStr = $nonceStr;
    $bk_wx_pay_config->package = $package;
    $bk_wx_pay_config->signType = $signType;
    $bk_wx_pay_config->paySign = $sign;

    $bk_wx_pay_config->status = 0;
    $bk_wx_pay_config->message = '返回成功';

    Log::info($bk_wx_pay_config->toJson());

    return $bk_wx_pay_config->toJson();
  }
}
