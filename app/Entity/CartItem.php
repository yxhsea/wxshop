<?php

namespace App\Entity;

use Illuminate\Database\Eloquent\Model;

class CartItem extends Model
{
    protected $table = 'cart_item';
    protected $primaryKey = 'id';

    //public $timestamps = false;
}
