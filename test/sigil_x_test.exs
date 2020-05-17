defmodule SigilXTest do
  use ExUnit.Case
  import SigilX

  doctest SigilX

  test "example 1" do
    assert Regex.match?(~X'[a-z-[s-u]]', "z")
  end

  test "example 2" do
    refute Regex.match?(~X'[a-z-[s-u]]', "t")
  end

  test "example 3" do
    assert Regex.match?(~X'^(?:[\p{IsGreek}-[\P{Lu}]]+)$', "Δ")
  end

  test "example 4" do
    refute Regex.match?(~X'^(?:[\p{IsGreek}-[\P{Lu}]]+)$', "δ")
  end
end
