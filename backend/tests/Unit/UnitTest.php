<?php

namespace Tests\Unit;

use App\Models\User;
use PHPUnit\Framework\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class UnitTest extends TestCase
{
    /**
     * A basic test example.
     */
    public function test_email_regex(): void
    {
        $emails = [['cgarduqe@gmail.com', true], ['something@somewere.there', true], ['cgarduqe@gmail', false], ['@gmail.com', false], ['gmail.at.com', false]];
        $this->assertTrue(true);
        foreach ($emails as $key => $value) {
            if ($value[1])
                $this->assertMatchesRegularExpression("/^[a-z.-]+@[a-z.-]+\.[a-z]+$/i", $value[0]);
            else
                $this->assertDoesNotMatchRegularExpression("/^[a-z.-]+@[a-z.-]+\.[a-z]+$/i", $value[0]);
        }
    }
}
