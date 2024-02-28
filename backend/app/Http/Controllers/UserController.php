<?php

namespace App\Http\Controllers;


use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    public function getAll(Request $request)
    {
        $users = User::all();
        return $users;
    }

    public function getUserById($id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }
        return response()->json($user);
    }
    public function create(Request $request)
    {
        $validatedData = $request->validate(User::rules());
        
        $user = User::create($validatedData);
        if ($request->hasFile('profile_picture')) {
            $imagePath = $request->file('profile_picture')->store('public/profile');
            $user->profile_picture = basename($imagePath);
            $user->save();
        }
        return response()->json(['message' => 'User created successfully'], 201);
    }

    public function update(Request $request, $id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }
        foreach ($request->all() as $key => $value) 
            $user->{$key} = $value;
            
        $validatedData = $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email,'.$user->id,
        ]);

        $user->update($validatedData);
        return response()->json(['message' => 'User updated successfully'], 204);
    }


    public function updatePassword(Request $request, $id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }
        foreach ($request->all() as $key => $value) 
            $user->{$key} = $value;
            
        $validatedData = $request->validate([
            'password' => 'required',
        ]);

        $user->update($validatedData);
        return response()->json(['message' => 'User updated successfully'], 204);
    }

    
    public function updateProfilePicture(Request $request, $id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }
        if ($request->hasFile('profile_picture')) {
            $oldImagePath = storage_path('app/public/profile') . '/'.$user->profile_picture;
            $imagePath = $request->file('profile_picture')->store('public/profile');
            $user->profile_picture = basename($imagePath);
            $user->save();
            if(file_exists($oldImagePath)){
                unlink($oldImagePath);
            }
            return response()->json(['message' => 'File Uploaded.', 'profile_image'=>$user->profile_picture], 200);
        }
        return response()->json(['message' => 'Didn\'t recive the file.'], 400);
    }
    
    public function remove($id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }
        $user->delete();
        return response()->json(['message' => 'Article deleted successfully'], 204);
    }
}
