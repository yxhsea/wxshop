<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Entity\Category;
use App\Entity\Product;
use App\Entity\PdtContent;
use App\Entity\PdtImages;
use Illuminate\Http\Request;
use App\Models\M3Result;

class ProductController extends Controller
{

  public function toProduct()
  {
    $products = Product::all();
    foreach ($products as $product) {
      $product->category = Category::find($product->category_id);
    }

    return view('admin.product')->with('products', $products);
  }

  public function toProductInfo(Request $request) {
    $id = $request->input('id', '');

    $product = Product::find($id);
    $product->category = Category::find($product->category_id);

    $pdt_content = PdtContent::where('product_id', $id)->first();
    $pdt_images = PdtImages::where('product_id', $id)->get();



    return view('admin.product_info')->with('product', $product)
                                     ->with('pdt_content', $pdt_content)
                                     ->with('pdt_images', $pdt_images);
  }

  public function toProductAdd() {
    $categories = Category::whereNotNull('parent_id')->get();

    return view('admin.product_add')->with('categories', $categories);
  }

  /********************Service*********************/
  public function productAdd(Request $request)
  {
    $name = $request->input('name', '');
    $summary = $request->input('summary', '');
    $price = $request->input('price', '');
    $category_id = $request->input('category_id', '');
    $preview = $request->input('preview', '');
    $content = $request->input('content', '');

    $preview1 = $request->input('preview1', '');
    $preview2 = $request->input('preview2', '');
    $preview3 = $request->input('preview3', '');
    $preview4 = $request->input('preview4', '');
    $preview5 = $request->input('preview5', '');

    $product = new Product;
    $product->summary = $summary;
    $product->price = $price;
    $product->category_id = $category_id;
    $product->preview = $preview;
    $product->name = $name;
    $product->save();

    $pdt_content = new PdtContent;
    $pdt_content->product_id = $product->id;
    $pdt_content->content = $content;
    $pdt_content->save();

    if($preview1 != '') {
      $pdt_images = new PdtImages;
      $pdt_images->image_path = $preview1;
      $pdt_images->image_no = 1;
      $pdt_images->product_id = $product->id;
      $pdt_images->save();
    }
    if($preview2 != '') {
      $pdt_images = new PdtImages;
      $pdt_images->image_path = $preview2;
      $pdt_images->image_no = 2;
      $pdt_images->product_id = $product->id;
      $pdt_images->save();
    }
    if($preview3 != '') {
      $pdt_images = new PdtImages;
      $pdt_images->image_path = $preview3;
      $pdt_images->image_no = 3;
      $pdt_images->product_id = $product->id;
      $pdt_images->save();
    }
    if($preview4 != '') {
      $pdt_images = new PdtImages;
      $pdt_images->image_path = $preview4;
      $pdt_images->image_no = 4;
      $pdt_images->product_id = $product->id;
      $pdt_images->save();
    }
    if($preview5 != '') {
      $pdt_images = new PdtImages;
      $pdt_images->image_path = $preview5;
      $pdt_images->image_no = 5;
      $pdt_images->product_id = $product->id;
      $pdt_images->save();
    }

    $m3_result = new M3Result;
    $m3_result->status = 0;
    $m3_result->message = '添加成功';

    return $m3_result->toJson();
  }

}
