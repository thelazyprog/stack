defmodule Stack.Server do
  use GenServer

  def start_link(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(value) do
    GenServer.cast(__MODULE__, {:push, value})
  end

  def init(initial_stack) do
    {:ok, initial_stack}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, value}, current_stack) do
    {:noreply, [value | current_stack]}
  end
end
