@extends('admin.master')

@section('content')
<form action="" method="post" class="form form-horizontal" id="form-order-edit">

  <div class="row cl">
    <label class="form-label col-3"><span class="c-red"></span>选择订单状态：</label>
    <div class="formControls col-5">
      <span class="select-box">
      	<select name="" class="select">
      		<option value="1" @if($order!=null && $order->status == 1)
      		  selected
      		@endif>未支付</option>
      		<option value="2" value="1" @if($order!=null &&$order->status == 2)
      		  selected
      		@endif>已支付</option>
      		<option value="3">等待发货</option>
      		<option value="4">已发货</option>
      		<option value="5">已签收</option>
      	</select>
      </span>
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

  $("#form-order-edit").Validform({
    tiptype:2,
    callback:function(form){
      var status = $('select option:selected').val();
      $('#form-order-edit').ajaxSubmit({
          type: 'post', // 提交方式 get/post
          url: '{{url('/admin/service/order/edit')}}', // 需要提交的 url
          dataType: 'json',
          data: {
            id: "{{$order->id}}",
            status: status,
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
