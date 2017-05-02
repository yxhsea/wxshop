<?php

namespace App\Http\Middleware;

use Closure;

class CheckWeixin
{
    /**
     * Run the request filter.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $is_wx = $request->input('is_wx', 0);
        // 如果当前处于微信浏览器中
        if($is_wx == 1) {
          $openid = $request->session()->get('openid', '');
          // 获取openid
          if($openid == '') {
            // 指定微信重定向后的地址
            $product_ids = $request->input('product_ids', '');
            $redirect_uri = urlencode('http://'.$_SERVER['HTTP_HOST'].'/order_commit?product_ids='.$product_ids);
            // 微信重定向
            $url = 'https://open.weixin.qq.com/connect/oauth2/authorize' .
              '?appid=' . config('wx_config.APPID') .
              '&redirect_uri=' . $redirect_uri .
              '&response_type=code' .
              '&scope=snsapi_base' .
              '&state=STATE' .
              '#wechat_redirect';

            return redirect($url);
          }
        }

        return $next($request);
    }

}
