<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        return view('categories', [
            'categories' => Category::all()
        ]);
    }

    public function show(Category $category)
    {
        return view('products', [
            'category' => $category,
            'products' => $category->products()->paginate(10)
        ]);
    }

}
