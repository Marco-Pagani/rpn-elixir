defmodule RPN do
  @moduledoc """
  Documentation for RPN.
  """


@doc """
  Processes an individual token in the statement given the current stack.

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
            [a - b | rest]
        end
      "*" ->
        case stack do
          [a | [b | rest]] ->
            [a * b | rest]
        end
      "/" ->
        case stack do
          [a | [b | rest]] ->
            [a / b | rest]
        end
      "^" ->
        case stack do
          [a | [b | rest]] ->
            [:math.pow(a,b) | rest]
        end
      other ->
        case stack do
          [] -> [String.to_integer(other) | [] ]
          any -> [String.to_integer(other) | any ]
        end
    end
  end

  @doc """
  Takes in an RPN expression as a string of tokens separated by spaces and returns the stack that results from it. No error checking is performed currently.

  ## Examples

      iex> RPN.calculate("1 2 3 + -")
      [4]
      :ok

  """
  def calculate(input) do
    list = String.split(input)
    List.foldl(list, [], fn l,s -> process_token( l, s) end)
  end

   @doc """
  Top level command. Takes input from standard IO and prints the result

  ## Examples

      iex> RPN.rpn
      Input your statement to calculate:
      1 2 3 + -
      4
      :ok

  """
  def rpn do
    input = IO.gets("Input your statement to calculate:\n")
    [result] = calculate(input)
    IO.puts(result )
  end


end
