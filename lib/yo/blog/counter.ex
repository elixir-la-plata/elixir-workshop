defmodule Yo.Blog.Counter do
  use GenServer

  # Cliente
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, 0, opts)
  end

  def get(pid) do
    GenServer.call(pid, :get)
  end

  def inc(pid) do
    GenServer.cast(pid, :inc)
  end

  # Servidor
  def init(value) do
    {:ok, value}
  end

  def handle_call(:get, _, state) do
    {:reply, state, state}
  end

  def handle_cast(:inc, state) do
    {:noreply, state + 1}
  end
end
