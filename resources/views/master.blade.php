<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
  <title>@yield('title')</title>

  <link rel="stylesheet" href="{{URL::asset('/css/swipe.css')}}">
  <link rel="stylesheet" href="{{URL::asset('/css/weui.css')}}">
  <link rel="stylesheet" href="{{URL::asset('/css/book.css')}}">
</head>
<body>
<div class="bk_title_bar">
  <img class="bk_back" src="{{URL::asset('/images/back.png')}}" alt="" onclick="history.go(-1);">
  <p class="bk_title_content"></p>
  <img class="bk_menu" src="{{URL::asset('/images/menu.png')}}" alt="" onclick="onMenuClick();">
</div>


<div class="page">
  @yield('content')
</div>

<!-- tooltips -->
<div class="bk_toptips"><span></span></div>

<!--BEGIN actionSheet-->
<div id="actionSheet_wrap">
    <div class="weui_mask_transition" id="mask"></div>
    <div class="weui_actionsheet" id="weui_actionsheet">
        <div class="weui_actionsheet_menu">
            <div class="weui_actionsheet_cell" onclick="onMenuItemClick(1,'{{url('')}}')">主页</div>
            <div class="weui_actionsheet_cell" onclick="onMenuItemClick(2,'{{url('/category')}}')">书籍类别</div>
            <div class="weui_actionsheet_cell" onclick="onMenuItemClick(3,'{{url('/cart')}}')">购物车</div>
            <div class="weui_actionsheet_cell" onclick="onMenuItemClick(4,'{{url('/order_list')}}')">我的订单</div>
        </div>
        <div class="weui_actionsheet_action">
            <div class="weui_actionsheet_cell" id="actionsheet_cancel">取消</div>
        </div>
    </div>
</div>

</body>
<script src="{{URL::asset('/js/jquery-1.11.2.min.js')}}"></script>
<script src="{{URL::asset('/js/swipe.min.js')}}" charset="utf-8"></script>
<script src="{{URL::asset('/js/book.js')}}" charset="utf-8"></script>
@yield('my-js')
</html>
