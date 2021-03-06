defmodule HelloWorld do
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    dispatch  = :cowboy_router.compile routes
    {:ok, _} = :cowboy.start_clear :http, 100, [{:port, 4000}], %{:env => %{:dispatch =>  dispatch}}

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: HelloWorld.Worker.start_link(arg1, arg2, arg3)
      # worker(HelloWorld.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloWorld.Supervisor]
    Supervisor.start_link(children, opts)
  end



  defp routes do
    [
      {
        :_,
        [ {"/hello-world", HelloWorld.Handlers.HelloWorld, []} ]
      }
    ]
  end

  @moduledoc """
  Documentation for HelloWorld.
  """

  @doc """
  Hello world.

  ## Examples

      iex> HelloWorld.hello
      :world

  """
  def hello do
    :world
  end
end
