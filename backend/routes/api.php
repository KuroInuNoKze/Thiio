<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('login', [App\Http\Controllers\AuthController::class, 'login']);
Route::middleware('auth:sanctum')->group(function () {
    Route::get('authenticated', [App\Http\Controllers\AuthController::class, 'authenticated']); //Data of the current logged user
    Route::get('user', [App\Http\Controllers\AuthController::class, 'user']); //Data of the current logged user
    Route::post('logout', [App\Http\Controllers\AuthController::class, 'logout']);
    Route::get('users', [App\Http\Controllers\UserController::class, 'getAll']); 
    Route::post('users/create', [App\Http\Controllers\UserController::class, 'create']);
    Route::get('users/{id}', [App\Http\Controllers\UserController::class, 'getUserById']); 
    Route::put('users/{id}', [App\Http\Controllers\UserController::class, 'update']);
    Route::put('users/update-password/{id}', [App\Http\Controllers\UserController::class, 'updatePassword']);
    Route::post('users/update-picture/{id}', [App\Http\Controllers\UserController::class, 'updateProfilePicture']);
    Route::delete('users/{id}', [App\Http\Controllers\UserController::class, 'remove']);
});
