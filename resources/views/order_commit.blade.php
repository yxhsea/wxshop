@extends('master')

@section('title', '订单提交')

@section('content')
  <div class="page bk_content" style="top: 0;">
    <div class="weui_cells">
        @foreach($cart_items as $cart_item)
        <div class="weui_cell">
            <div class="weui_cell_hd">
              <img src="{{$cart_item->product->preview}}" alt="" class="bk_icon">
            </div>
            <div class="weui_cell_bd weui_cell_primary">
                <p class="bk_summary">{{$cart_item->product->name}}</p>
            </div>
            <div class="weui_cell_ft">
              <span class="bk_price">{{$cart_item->product->price}}</span>
              <span> x </span>
              <span class="bk_important">{{$cart_item->count}}</span>
            </div>
        </div>
        @endforeach
    </div>
    <div class="weui_cells_title">支付方式</div>
    <div class="weui_cells">
        <div class="weui_cell weui_cell_select">
            <div class="weui_cell_bd weui_cell_primary">
                <select class="weui_select" name="payway">
                    <option selected="" value="1">支付宝</option>
                    <option value="2">微信</option>
                </select>
            </div>
        </div>
    </div>

    <form action="{{url('/service/alipay')}}" id="alipay" method="post">
      {{ csrf_field() }}
      <input type="hidden" name="total_price" value="{{$total_price}}" />
      <input type="hidden" name="name" value="{{$name}}" />
      <input type="hidden" name="order_no" value="{{$order_no}}" />
    </form>

    <div class="weui_cells">
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <p>总计:</p>
            </div>
            <div class="weui_cell_ft bk_price" style="font-size: 25px;">￥ {{$total_price}}</div>
        </div>
    </div>
  </div>
  <div class="bk_fix_bottom">
    <div class="bk_btn_area">
      <button class="weui_btn weui_btn_primary" onclick="_onPay();">提交订单</button>
    </div>
  </div>

@endsection

@section('my-js')
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" charset="utf-8"></script>
<script type="text/javascript">
  wx.config({
      debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
      appId: "{{$bk_wx_js_config->appId}}", // 必填，公众号的唯一标识
      timestamp: {{$bk_wx_js_config->timestamp}}, // 必填，生成签名的时间戳
      nonceStr: "{{$bk_wx_js_config->nonceStr}}", // 必填，生成签名的随机串
      signature: "{{$bk_wx_js_config->signature}}",// 必填，签名，见附录1
      jsApiList: ['chooseWXPay'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
  });
  wx.ready(function(){
    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
  });
  wx.error(function(res){
    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。

  });

  function _onPay() {

    var payway = $('.weui_select option:selected').val();
    if(payway == '1') {
      $('#alipay').submit();
      return;
    }

    $.ajax({
      type: "POST",
      url: '{{url('/service/wxpay')}}',
      dataType: 'json',
      cache: false,
      data: {name: "{{$name}}", order_no: "{{$order_no}}", total_price: "{{$total_price}}", _token: "{{csrf_token()}}"},
      success: function(data) {
        if(data == null) {
          $('.bk_toptips').show();
          $('.bk_toptips span').html('服务端错误');
          setTimeout(function() {$('.bk_toptips').hide();}, 2000);
          return;
        }

        wx.chooseWXPay({
            timestamp: data.timestamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
            nonceStr: data.nonceStr, // 支付签名随机串，不长于 32 位
            package: data.package, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
            signType: data.signType, // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
            paySign: data.paySign, // 支付签名
            success: function (res) {
                // 支付成功后的回调函数
                location.href = '/order_list';
            }
        });
      },
      error: function(xhr, status, error) {
        console.log(xhr);
        console.log(status);
        console.log(error);
        var ua = navigator.userAgent.toLowerCase();//获取判断用的对象
        if (ua.match(/MicroMessenger/i) != "micromessenger") {
          alert('请在微信浏览器中打开');
        }
      }
    });
  }
</script>
@endsection
