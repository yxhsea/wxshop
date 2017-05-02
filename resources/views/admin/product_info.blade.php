@extends('admin.master')

@section('content')

  <style>
    .row.cl {
      margin: 20px 0;
    }
  </style>

<form class="form form-horizontal" action="" method="post">
  <div class="row cl">
    <label class="form-label col-3"><span class="c-red"></span>名称：</label>
    <div class="formControls col-5">
      {{$product->name}}
    </div>
    <div class="col-4"> </div>
  </div>
  <div class="row cl">
    <label class="form-label col-3"><span class="c-red"></span>简介：</label>
    <div class="formControls col-5">
      {{$product->summary}}
    </div>
    <div class="col-4"> </div>
  </div>
  <div class="row cl">
    <label class="form-label col-3"><span class="c-red"></span>价格：</label>
    <div class="formControls col-5">
      {{$product->price}}
    </div>
    <div class="col-4"> </div>
  </div>
  <div class="row cl">
    <label class="form-label col-3"><span class="c-red"></span>类别：</label>
    <div class="formControls col-5">
      {{$product->category->name}}
    </div>
  </div>
  <div class="row cl">
    <label class="form-label col-3">预览图：</label>
    <div class="formControls col-5">
      @if($product->preview != null)
        <img id="preview_id" src="{{URL::asset($product->preview)}}" style="border: 1px solid #B8B9B9; width: 100px; height: 100px;"/>
      @endif
    </div>
  </div>
  <div class="row cl">
    <label class="form-label col-3">详细内容：</label>
    <div class="formControls col-8">
      {{$pdt_content->content}}
    </div>
  </div>
  <div class="row cl">
    <label class="form-label col-3">产品图片：</label>
    <div class="formControls col-8">
      @foreach($pdt_images as $pdt_image)
        <img src="{{URL::asset($pdt_image->image_path)}}" style="border: 1px solid #B8B9B9; width: 100px; height: 100px;" />
      @endforeach
    </div>
  </div>
</div>
@endsection
