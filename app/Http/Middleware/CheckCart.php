<?php

namespace App\Http\Middleware;

use Closure;

class CheckCart
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

        // 获取上一次请求的url
        $return_url = '';
        if(isset($_SERVER['HTTP_REFERER'])) {
          $return_url = $_SERVER['HTTP_REFERER'];
        }

        $member = $request->session()->get('member', '');
        if($member == '') {
          return redirect('/login?return_url=' . urlencode($return_url));
        }

        return $next($request);
    }

}
