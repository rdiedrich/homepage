defmodule HomepageWeb.PageController do
  use HomepageWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    # render(conn, :home, layout: false)
    render(conn, :home)
  end

  def resume(conn, _params),
    do: render(conn, :resume, layout: {HomepageWeb.Layouts, :resume})
end
