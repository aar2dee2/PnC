defmodule PnC do
  
  @moduledoc """
  Contains function to generate arrangements and combinations of objects in lists.
  """
  
  @doc """
  Generates all possible combinations of objects in a list - arrangement of objects does not matter - where num out of n objects are chosen for each list.
  Ref: https://elixirforum.com/t/generate-all-combinations-having-a-fixed-array-size/26196/16

  ## Examples
      iex> combinations(["1", "2", "3"], 2)
      [["1", "2"], ["1", "3"], ["2", "3"]]
  """
  @spec combinations(list(), integer()) :: list(list())
  def combinations(_list, 0), do: [[]]
  def combinations([], _num), do: []

  def combinations([head | tail], num) do
    Enum.map(combinations(tail, num - 1), &[head | &1]) ++
    combinations(tail, num)
  end
  @doc """
  Generates all possible uniques arrangements (permutations) of objects in a list - each arrangements includes all objects.
  Ref: https://elixirforum.com/t/most-elegant-way-to-generate-all-permutations/2706

  """
  @spec perm(list()) :: list(list())
  def perm([]), do: [[]]
  def perm(names), do: for x <- names, rest <- perm(names--[x]), do: [x|rest]

end