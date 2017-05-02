<?php

namespace App\Http\Controllers\View;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Entity\Category;
use App\Entity\Product;
use App\Entity\PdtContent;
use App\Entity\PdtImages;
use App\Entity\CartItem;
use Log;

class BookController extends Controller
{
  public function toCategory($value='')
  {
    Log::info("进入书籍类别");
    $categorys = Category::whereNull('parent_id')->get();
    return view('category')->with('categorys', $categorys);
  }

  public function toProduct($category_id)
  {
    $products = Product::where('category_id', $category_id)->get();
    return view('product')->with('products', $products);
  }

  public function toPdtContent(Request $request, $product_id)
  {
    $product = Product::find($product_id);
    $pdt_content = PdtContent::where('product_id', $product_id)->first();
    $pdt_images = PdtImages::where('product_id', $product_id)->get();

    $count = 0;

    $member = $request->session()->get('member', '');
    if($member != '') {
      $cart_items = CartItem::where('member_id', $member->id)->get();

      foreach ($cart_items as $cart_item) {
        if($cart_item->product_id == $product_id) {
          $count = $cart_item->count;
          break;
        }
      }
    } else {
      $bk_cart = $request->cookie('bk_cart');
      $bk_cart_arr = ($bk_cart!=null ? explode(',', $bk_cart) : array());

      foreach ($bk_cart_arr as $value) {   // 一定要传引用
        $index = strpos($value, ':');
        if(substr($value, 0, $index) == $product_id) {
          $count = (int) substr($value, $index+1);
          break;
        }
      }
    }

    return view('pdt_content')->with('product', $product)
                              ->with('pdt_content', $pdt_content)
                              ->with('pdt_images', $pdt_images)
                              ->with('count', $count);
  }
}
