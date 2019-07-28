defmodule Client.Worker do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    tick(1)
    {:ok, 1}
  end

  def handle_info(:tick, state) do
    tick(state)
    {:noreply, state + 1}
  end

  defp tick(n) do
    IO.puts("Client tick #{n}")
    Process.send_after(self, :tick, 1500)
  end
end
