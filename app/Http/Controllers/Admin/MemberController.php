<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Entity\Member;
use App\Models\M3Result;

class MemberController extends Controller
{

  public function toMember(Request $request)
  {
    $members = Member::all();
    return view('admin.member')->with('members', $members);
  }

  public function toMemberEdit(Request $request)
  {
    $id = $request->input('id', '');
    $member = Member::find($id);
    return view('admin.member_edit')->with('member', $member);
  }

  public function memberEdit(Request $request)
  {
    $member = Member::find($request->input('id', ''));

    $member->nickname = $request->input('nickname', '');
    $member->phone = $request->input('phone', '');
    $member->email = $request->input('email', '');
    $member->save();

    $m3_result = new M3Result;
    $m3_result->status = 0;
    $m3_result->message = '添加成功';

    return $m3_result->toJson();
  }
}
