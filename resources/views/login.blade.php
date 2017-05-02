@extends('master')

@include('component.loading')

@section('title', '登录')

@section('content')
<div class="weui_cells_title"></div>
<div class="weui_cells weui_cells_form">
  <div class="weui_cell">
      <div class="weui_cell_hd"><label class="weui_label">帐号</label></div>
      <div class="weui_cell_bd weui_cell_primary">
          <input class="weui_input" type="text" placeholder="邮箱或手机号" name="username"/>
      </div>
  </div>
  <div class="weui_cell">
      <div class="weui_cell_hd"><label class="weui_label">密码</label></div>
      <div class="weui_cell_bd weui_cell_primary">
          <input class="weui_input" type="password" placeholder="不少于6位" name="password"/>
      </div>
  </div>
  <div class="weui_cell weui_vcode">
      <div class="weui_cell_hd"><label class="weui_label">验证码</label></div>
      <div class="weui_cell_bd weui_cell_primary">
          <input class="weui_input" type="text" placeholder="请输入验证码" name="validate_code"/>
      </div>
      <div class="weui_cell_ft">
          <img src="{{url('/service/validate_code/create')}}" class="bk_validate_code"/>
      </div>
  </div>
</div>
<div class="weui_cells_tips"></div>
<div class="weui_btn_area">
  <a class="weui_btn weui_btn_primary" href="javascript:;" onclick="onLoginClick();">登录</a>
</div>
<a href="{{url('/register')}}" class="bk_bottom_tips bk_important">没有帐号? 去注册</a>
@endsection

@section('my-js')
<script type="text/javascript">


  $('.bk_validate_code').click(function () {
    $(this).attr('src', '{{url('/service/validate_code/create')}}?random=' + Math.random());
  });

  function onLoginClick() {
    // 帐号
    var username = $('input[name=username]').val();
    if(username.length == 0) {
      $('.bk_toptips').show();
      $('.bk_toptips span').html('帐号不能为空');
      setTimeout(function() {$('.bk_toptips').hide();}, 2000);
      return;
    }
    if(username.indexOf('@') == -1) { //手机号
      if(username.length != 11 || username[0] != 1) {
        $('.bk_toptips').show();
        $('.bk_toptips span').html('帐号格式不对!');
        setTimeout(function() {$('.bk_toptips').hide();}, 2000);
        return;
      }
    } else {
      if(username.indexOf('.') == -1) {
        $('.bk_toptips').show();
        $('.bk_toptips span').html('帐号格式不对!');
        setTimeout(function() {$('.bk_toptips').hide();}, 2000);
        return;
      }
    }
    // 密码
    var password = $('input[name=password]').val();
    if(password.length == 0) {
      $('.bk_toptips').show();
      $('.bk_toptips span').html('密码不能为空!');
      setTimeout(function() {$('.bk_toptips').hide();}, 2000);
      return;
    }
    if(password.length < 6) {
      $('.bk_toptips').show();
      $('.bk_toptips span').html('密码不能少于6位!');
      setTimeout(function() {$('.bk_toptips').hide();}, 2000);
      return;
    }
    // 验证码
    var validate_code = $('input[name=validate_code]').val();
    if(validate_code.length == 0) {
      $('.bk_toptips').show();
      $('.bk_toptips span').html('验证码不能为空!');
      setTimeout(function() {$('.bk_toptips').hide();}, 2000);
      return;
    }
    if(validate_code.length < 4) {
      $('.bk_toptips').show();
      $('.bk_toptips span').html('验证码不能少于4位!');
      setTimeout(function() {$('.bk_toptips').hide();}, 2000);
      return;
    }

    $.ajax({
      type: "POST",
      url: '{{url('/service/login')}}',
      dataType: 'json',
      cache: false,
      data: {username: username, password: password, validate_code: validate_code, _token: "{{csrf_token()}}"},
      success: function(data) {
        if(data == null) {
          $('.bk_toptips').show();
          $('.bk_toptips span').html('服务端错误');
          setTimeout(function() {$('.bk_toptips').hide();}, 2000);
          return;
        }
        if(data.status != 0) {
          $('.bk_toptips').show();
          $('.bk_toptips span').html(data.message);
          setTimeout(function() {$('.bk_toptips').hide();}, 2000);
          return;
        }

        $('.bk_toptips').show();
        $('.bk_toptips span').html('登录成功');
        setTimeout(function() {$('.bk_toptips').hide();}, 2000);

        location.href = "{!!$return_url!!}";

      },
      error: function(xhr, status, error) {
        console.log(xhr);
        console.log(status);
        console.log(error);
      }
    });
  }

</script>
@endsection
