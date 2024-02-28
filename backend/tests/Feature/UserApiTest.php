<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Models\User;

use Illuminate\Auth\AuthenticationException;
use Tests\TestCase;
use Tymon\JWTAuth\JWTAuth;

class UserApiTest extends TestCase
{
    /** @test */
    public function test_that_an_user_cant_be_created_without_persmission()
    {
        $this->expectException('Illuminate\Auth\AuthenticationException');
        $newUser = [
            'name' => 'Test User',
            'email' => 'test@test.com',
        ];
        $response = $this->postJson('api/users/create', [$newUser], ['X-Requested-With'=>'XMLHttpRequest','Content-Type'=>'application/json']);
    }

    /** @test */
    public function test_login()
    {
        $userCredentials = [
            'email' => 'hauck.vincent@example.net',
            'password' => 'password',
        ];
        
        $response = $this->postJson('api/login', $userCredentials, ['Accept'=>'application/json','Content-Type'=>'application/json']);
        $response->assertStatus(200);
    }

    public function test_wrong_login()
    {
        $userCredentials = [
            'email' => 'this@is.not',
            'password' => 'oneoftheuserthatyoumustuse',
        ];
        
        $response = $this->postJson('api/login', $userCredentials, ['Accept'=>'application/json','Content-Type'=>'application/json']);
        $response->assertStatus(401);
    }


    public function test_that_user_email_is_required(){
        $user = User::factory()->create();
        $this->withExceptionHandling();
        $newUser = [
            'password' => '',
            'email' => '',
        ];
        $response = $this->actingAs($user)->postJson('api/users/create',  $newUser ,['Accept'=>'application/json','Content-Type'=>'application/json'])
        ->assertUnprocessable()
        ->assertJsonValidationErrors(['email'])
        ->assertJsonValidationErrors(['password']);
    }



}
