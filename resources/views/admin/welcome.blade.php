<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="{{URL::asset('lib/html5shiv.js')}}"></script>
    <script type="text/javascript" src="{{URL::asset('lib/respond.min.js')}}"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="{{URL::asset('admin/css/H-ui.min.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{URL::asset('admin/css/H-ui.admin.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{URL::asset('lib/Hui-iconfont/1.0.8/iconfont.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{URL::asset('static/h-ui.admin/skin/default/skin.css')}}" id="skin" />
    <link rel="stylesheet" type="text/css" href="{{URL::asset('admin/css/style.css')}}" />
    <!--[if IE 6]>
    <script type="text/javascript" src="{{URL::asset('lib/DD_belatedPNG_0.0.8a-min.js')}}" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>我的桌面</title>
</head>
<body>
<div class="page-container">
    <p class="f-20 text-success" style="margin-left: 10px;">欢迎登录<span style="color:blue;">基于Laravel的微商城后台管理系统</span></p>
    <p style="margin-left: 10px;">上次登录IP：222.35.131.79.1  上次登录时间：2014-6-14 11:19:55</p>
    <table class="table table-border table-bordered table-bg mt-20">
        <thead>
        <tr>
            <th colspan="2" scope="col">服务器信息</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>服务器IP地址</td>
            <td>{{$data['HTTP_HOST']}}</td>
        </tr>
        <tr>
            <td>站点根目录</td>
            <td>{{$data['DOCUMENT_ROOT']}}</td>
        </tr>
        <tr>
            <td>服务器端口 </td>
            <td>{{$data['SERVER_PORT']}}</td>
        </tr>
        <tr>
            <td>PHP版本 </td>
            <td>{{$data['PHP_VERSION']}}</td>
        </tr>
        <tr>
            <td>服务器操作系统 </td>
            <td>{{$data['SERVER_SOFTWARE']}}</td>
        </tr>
        </tbody>
    </table>
</div>
<footer class="footer mt-20">
    <div class="container">

    </div>
</footer>
<script type="text/javascript" src="{{URL::asset('admin/js/jquery.min.js')}}"></script>
<script type="text/javascript" src="{{URL::asset('admin/js/H-ui.min.js')}}"></script>
</body>
</html>