defmodule RPN do
  @moduledoc """
  Documentation for RPN.
  """


@doc """
  Process an individual token in the statement.

  """
  def process_token(token, stack) do
    case token do
      "+" ->
        case stack do
          [a | [b | rest]] ->
            [a + b | rest]
        end
      "-" ->
        case stack do
          [a | [b | rest]] ->
            [a + b | rest]
        end
      "*" ->
        case stack do
          [a | [b | rest]] ->
            [a + b | rest]
        end
      "/" ->
        case stack do
          [a | [b | rest]] ->
            [a + b | rest]
        end
      "^" ->
        case stack do
          [a | [b | rest]] ->
            [a + b | rest]
        end
      other ->
        case stack do
          [] -> [String.to_integer(other)]
          [any] -> [String.to_integer(other) | [any]]
        end
    end
  end

  @doc """
  Process a full RPN statement

  ## Examples

      iex> RPN.calculate("1 2 3 + -")
      4

  """
  def calculate(input) do
    List.foldl(input, [], fn l,s -> process_token( l, s) end)
  end

   @doc """
  Take input and return answer

  ## Examples

      iex> RPN.calculate("1 2 3 + -")
      4

  """
  def rpn do
    input = IO.gets("Input your statement to calculate:\n")
    list = String.split(input)
    IO.puts(calculate(list))
  end


end
