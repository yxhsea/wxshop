<?php

namespace App\Entity;

use Illuminate\Database\Eloquent\Model;

class TempEmail extends Model
{
    protected $table = 'temp_email';
    protected $primaryKey = 'id';

    public $timestamps = false;
}
