defmodule TargetWeb.PageController do
  use TargetWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
