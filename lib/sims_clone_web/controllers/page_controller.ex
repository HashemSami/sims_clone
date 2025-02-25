defmodule SimsCloneWeb.PageController do
  use SimsCloneWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def sims(conn, _params) do
    # The sims page is often custom made,
    # so skip the default app layout.
    render(conn, :sims, layout: false)
  end
end
