defmodule SigilX do
  @moduledoc """
  Documentation for `SigilX`.
  """

  @doc ~S"""
  Handles the sigil `~X` for XML Schema flavor regular expressions.
  It returns a regular expression pattern without escaping
  nor interpreting interpolations.
  ## Examples
  iex> Regex.match?(~X'[a-z-[s-u]]', "z")
  true
  iex> Regex.match?(~X'[a-z-[s-u]]', "t")
  false
  iex> Regex.match?(~X'^(?:[\p{IsGreek}-[\P{Lu}]]+)$', "Δ")
  true
  iex> Regex.match?(~X'^(?:[\p{IsGreek}-[\P{Lu}]]+)$', "δ")
  false

  """
  defmacro sigil_X(term, modifiers)

  defmacro sigil_X({:<<>>, _meta, [string]}, options) when is_binary(string) do
    {:ok, translation} = :xs_regex.translate(string)
    binary = translation |> :binary.list_to_bin()
    regex = Regex.compile!(binary, :binary.list_to_bin(options ++ 'u'))
    Macro.escape(regex)
  end

  defmacro sigil_x(term, modifiers)

  defmacro sigil_x({:<<>>, _meta, [string]}, options) when is_binary(string) do
    binary = :elixir_interpolation.unescape_chars(string, &Regex.unescape_map/1)
    {:ok, translation} = :xs_regex.translate(binary)
    binary = translation |> :binary.list_to_bin()
    regex = Regex.compile!(binary, :binary.list_to_bin(options ++ 'u'))
    Macro.escape(regex)
  end
end
