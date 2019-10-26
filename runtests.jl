using Test

include("crypto_square.jl")

# Tests adapted from `problem-specifications//canonical-data.json` @ v3.2.0

println("\n"^2, "-"^60, "\n"^3)

@testset "Empty plaintext." begin
    value = ""
    expected = ""
    @test cipher_text(value) == expected
end
println()

@testset "Lowercase." begin
    value = "A"
    expected = "a"
    @test cipher_text(value) == expected
end
println()

@testset "Remove spaces." begin
    value = "  b "
    expected = "b"
    @test cipher_text(value) == expected
end
println()

@testset "Remove punctuation." begin
    value = "@1,%!"
    expected = "1"
    @test cipher_text(value) == expected
end
println()

@testset "Nine character plaintext." begin
    value = "This is fun!"
    expected = "tsf hiu isn"
    @test cipher_text(value) == expected
end
println()

@testset "Eight character plaintext." begin
    value = "Chill out."
    expected = "clu hlt io "
    @test cipher_text(value) == expected
end
println()

@testset "54 character plaintext." begin
    value = "If man was meant to stay on the ground, god would have given us roots."
    expected = "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau "
    @test cipher_text(value) == expected
end
println()
