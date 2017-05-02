<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Entity\Category;
use Illuminate\Http\Request;
use App\Models\M3Result;

class CategoryController extends Controller
{

  public function toCategory()
  {
    $categories = Category::all();
    foreach ($categories as $category) {
      if($category->parent_id != null && $category->parent_id != '') {
        $category->parent = Category::find($category->parent_id);
      }
    }

    return view('admin.category')->with('categories', $categories);
  }

  public function  toCategoryAdd() {
    $categories = Category::whereNull('parent_id')->get();

    return view('admin/category_add')->with('categories', $categories);
  }


  public function toCategoryEdit(Request $request) {
    $id = $request->input('id', '');
    $category = Category::find($id);
    $categories = Category::whereNull('parent_id')->get();

    return view('admin/category_edit')->with('category', $category)
                                      ->with('categories', $categories);
  }

  /********************Service*********************/
  public function categoryAdd(Request $request) {
    $name = $request->input('name', '');
    $category_no = $request->input('category_no', '');
    $parent_id = $request->input('parent_id', '');
    $preview = $request->input('preview', '');

    $category = new Category;
    $category->name = $name;
    $category->category_no = $category_no;
    $category->preview = $preview;
    if($parent_id != '') {
      $category->parent_id = $parent_id;
    }
    $category->save();

    $m3_result = new M3Result;
    $m3_result->status = 0;
    $m3_result->message = '添加成功';

    return $m3_result->toJson();
  }

  public function categoryDel(Request $request) {
    $id = $request->input('id', '');
    Category::find($id)->delete();

    $m3_result = new M3Result;
    $m3_result->status = 0;
    $m3_result->message = '删除成功';

    return $m3_result->toJson();
  }

  public function categoryEdit(Request $request) {
    $id = $request->input('id', '');
    $category = Category::find($id);

    $name = $request->input('name', '');
    $category_no = $request->input('category_no', '');
    $parent_id = $request->input('parent_id', '');
    $preview = $request->input('preview', '');

    $category->name = $name;
    $category->category_no = $category_no;
    if($parent_id != '') {
      $category->parent_id = $parent_id;
    }
    $category->preview = $preview;
    $category->save();

    $m3_result = new M3Result;
    $m3_result->status = 0;
    $m3_result->message = '添加成功';

    return $m3_result->toJson();
  }

}
