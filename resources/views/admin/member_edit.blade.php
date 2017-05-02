@extends('admin.master')

@section('content')
<form action="" method="post" class="form form-horizontal" id="form-member-edit">
  {{ csrf_field() }}
  <div class="row cl">
    <label class="form-label col-3"><span class="c-red">*</span>昵称：</label>
    <div class="formControls col-5">
      <input type="text" class="input-text" value="{{$member->nickname}}" placeholder="" name="nickname" datatype="*" nullmsg="昵称不能为空">
    </div>
    <div class="col-4"> </div>
  </div>
  <div class="row cl">
    <label class="form-label col-3"><span class="c-red">*</span>手机号：</label>
    <div class="formControls col-5">
      <input type="texts" class="input-text" value="{{$member->phone}}" placeholder="" name="phone"  datatype="m" nullmsg="手机号不能为空">
    </div>
    <div class="col-4"> </div>
  </div>
  <div class="row cl">
    <label class="form-label col-3"><span class="c-red">*</span>邮箱：</label>
    <div class="formControls col-5">
      <input type="text" class="input-text" value="{{$member->email}}" placeholder="" name="email"  datatype="e" nullmsg="邮箱不能为空">
    </div>
    <div class="col-4"> </div>
  </div>
  <div class="row cl">
    <div class="col-9 col-offset-3">
      <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
    </div>
  </div>
</form>
@endsection

@section('my-js')
<script type="text/javascript">
  $("#form-member-edit").Validform({
    tiptype:2,
    callback:function(form){
      $('#form-member-edit').ajaxSubmit({
          type: 'post', // 提交方式 get/post
          url: '{{url('/admin/service/member/edit')}}', // 需要提交的 url
          dataType: 'json',
          data: {
            id: "{{$member->id}}",
            nickname: $('input[name=nickname]').val(),
            phone: $('input[name=phone]').val(),
            email: $('input[name=email]').val(),
            _token: "{{csrf_token()}}"
          },
          success: function(data) {
            if(data == null) {
              layer.msg('服务端错误', {icon:2, time:2000});
              return;
            }
            if(data.status != 0) {
              layer.msg(data.message, {icon:2, time:2000});
              return;
            }

            layer.msg(data.message, {icon:1, time:2000});
  					parent.location.reload();
          },
          error: function(xhr, status, error) {
            console.log(xhr);
            console.log(status);
            console.log(error);
            layer.msg('ajax error', {icon:2, time:2000});
          },
          beforeSend: function(xhr){
            layer.load(0, {shade: false});
          },
        });

        return false;
    }
  });
</script>
@endsection
