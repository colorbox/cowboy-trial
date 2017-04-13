defmodule HelloWorld.Handlers.HelloWorld do
  def init(req, opts) do
    req2 = :cowboy_req.reply 200, %{"content-type" => "text/plain"}, "Hello World", req
    {:ok, req2, opts}
  end
end
