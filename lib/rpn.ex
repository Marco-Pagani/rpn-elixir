defmodule RPN do
  @moduledoc """
  Documentation for RPN.
  """

  @doc """
  Calculate an RPN statement.

  ## Examples

      iex> RPN.calculate("1 2 3 + -")
      4

  """
  def calculate do

  end

@doc """
  Process an individual token in the statement.

  """
  def process_token(token) do
    case token do
      "+" -> ()
      "-" -> ()
      "*" -> ()
      "/" -> ()
      "^" -> ()
      other -> ()
    end
  end


end
