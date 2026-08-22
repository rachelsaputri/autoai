defmodule ElixirDataProcessingUtilityTest do
  use ExUnit.Case
  doctest ElixirDataProcessingUtility

  test "grants hello" do
    assert ElixirDataProcessingUtility.hello() == :world
  end
end
