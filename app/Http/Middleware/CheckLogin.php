<?php

namespace App\Http\Middleware;

use Closure;

class CheckLogin
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
        $member = $request->session()->get('member', '');
        if($member == '') {
          $return_url = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
          return redirect('/login?return_url=' . urlencode($return_url));
        }

        return $next($request);
    }

}
