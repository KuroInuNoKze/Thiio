<?php

namespace App\Http\Controllers;


use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response;

class AuthController extends Controller
{
    public function login(Request $request){

        if (!Auth::attempt($request->only('email', 'password'))) {
            return response(['message'=>'Invalid credentials'], Response::HTTP_UNAUTHORIZED);
        }
        $user = Auth::user();
        $token = $user->createToken('token')->plainTextToken;
        $cookie = cookie('jwt',$token,60*24);
        return response(['user'=>$user], Response::HTTP_OK)->withCookie($cookie);

    }
    public function authenticated(){
        return !!Auth::user();
    }

    public function user(){
        $cookie = Cookie::get('jwt');
        return response(['message'=>'Success', 'user'=> Auth::user()->attributesToArray()], Response::HTTP_OK)->withCookie($cookie);
    }


    function logout(){
        $cookie = Cookie::forget('jwt');
        return response(['message'=>'Success'], Response::HTTP_OK)->withCookie($cookie);
    }
}
