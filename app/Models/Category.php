<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Kalnoy\Nestedset\NodeTrait;
use TCG\Voyager\Traits\Translatable;

class Category extends Model
{
    use HasFactory, Translatable, NodeTrait;

    public function categories()
    {
        return $this->hasMany(Category::class);
    }

    public function childs() {
        return $this->hasMany(Category::class,'parent_id','id') ;
    }

    public function parent()
    {
        return $this->belongsTo(Category::class,'parent_id');
    }

    public function isParent()
    {
        return !$this->parent_id ? true : false;
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
