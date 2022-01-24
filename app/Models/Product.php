<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;
use TCG\Voyager\Traits\Translatable;

class Product extends Model
{
    use HasFactory, Translatable, Resizable;

    public function category()
    {
        return $this->belongsTo('App\Models\Category', 'category_id');
    }
}
