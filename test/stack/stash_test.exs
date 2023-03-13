defmodule Stack.StashTest do
  use ExUnit.Case
  alias Stack.Stash

  test "stash simply keep given data" do
    updated = ["test", 2023, :stash]
    Stash.update(updated)

    assert Stash.get() == updated
  end
end
