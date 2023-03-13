defmodule Stack.ServerTest do
  use ExUnit.Case
  alias Stack.{Server, Stash}

  test "stack follows LIFO order" do
    Server.push("test")
    Server.push(1)
    Server.push(:push)

    assert :push == Server.pop()
    assert 1 == Server.pop()
    assert "test" == Server.pop()
  end
end
