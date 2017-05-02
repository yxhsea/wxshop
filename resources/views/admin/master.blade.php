<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8">
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <LINK rel="Bookmark" href="{{URL::asset('/favicon.ico')}}" >
  <LINK rel="Shortcut Icon" href="{{URL::asset('/favicon.ico')}}" />
  <!--[if lt IE 9]>
  <script type="text/javascript" src="{{URL::asset('lib/html5.js')}}"></script>
  <script type="text/javascript" src="{{URL::asset('lib/respond.min.js')}}"></script>
  <script type="text/javascript" src="{{URL::asset('lib/PIE_IE678.js')}}"></script>
  <![endif]-->
  <link href="{{URL::asset('/admin/css/H-ui.min.css')}}" rel="stylesheet" type="text/css" />
  <link href="{{URL::asset('/admin/css/H-ui.admin.css')}}" rel="stylesheet" type="text/css" />
  <link href="{{URL::asset('/admin/lib/Hui-iconfont/1.0.6/iconfont.css')}}" rel="stylesheet" type="text/css" />
  <link href="{{URL::asset('/admin/skin/default/skin.css')}}" rel="stylesheet" type="text/css" id="skin" />
  <link href="{{URL::asset('/admin/css/style.css')}}" rel="stylesheet" type="text/css" />
  <!--[if IE 6]>
  <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
  <script>DD_belatedPNG.fix('*');</script>
  <![endif]-->
  <title>基于Laravel的微商城后台管理系统</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
</head>
<body>

@yield('content')

<script type="text/javascript" src="{{URL::asset('/admin/lib/jquery/1.9.1/jquery.min.js')}}"></script>
<script type="text/javascript" src="{{URL::asset('/admin/js/jquery.form.js')}}"></script>
<script type="text/javascript" src="{{URL::asset('/admin/js/uploadFile.js')}}"></script>
<script type="text/javascript" src="{{URL::asset('/admin/lib/layer/2.1/layer.js')}}"></script>
<script type="text/javascript" src="{{URL::asset('/admin/js/H-ui.js')}}"></script>
<script type="text/javascript" src="{{URL::asset('/admin/js/H-ui.admin.js')}}"></script>
<script type="text/javascript" src="{{URL::asset('/admin/lib/Validform/5.3.2/Validform.min.js')}}"></script>
<script type="text/javascript" src="{{URL::asset('/admin/lib/ueditor/1.4.3/ueditor.config.js')}}"></script>
<script type="text/javascript" src="{{URL::asset('/admin/lib/ueditor/1.4.3/ueditor.all.min.js')}}"> </script>
<script type="text/javascript" src="{{URL::asset('/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js')}}"></script>
@yield('my-js')
</body>
</html>
