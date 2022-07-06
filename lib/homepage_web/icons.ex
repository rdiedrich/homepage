defmodule HomepageWeb.Icons do
  import Phoenix.LiveView.Helpers

  @priv_dir Path.join(:code.priv_dir(:homepage), "icons")
  @repo_url "https://github.com/CoreyGinnivan/system-uicons.git"

  System.cmd("rm", ["-rf",  Path.join(@priv_dir, "system-uicons")])
  System.cmd("git", ["clone", "--depth=1", @repo_url, Path.join(@priv_dir, "system-uicons")])

  source_data = File.read!(Path.join(@priv_dir, "system-uicons/src/js/data.js"))

  <<"var sourceData = "::utf8 , rest::binary>> = source_data
  # remove trailing semicolon
  sslice = String.slice(rest, 0..-3//1)
  # quote object keys
  quote_keys = Regex.replace(~r/([\w_]+):/, sslice, "\"\\1\":")
  # remove trailing commas
  rm_trailing_commas = Regex.replace(~r/,\s+(}|])/, quote_keys, "\\1")
  icon_data = Jason.decode!(rm_trailing_commas)

  icon_map = Enum.map(icon_data, fn %{"icon_path" => path} = icon ->
    svg = File.read!(Path.join(@priv_dir, "system-uicons/src/images/icons/#{path}.svg"))
    Map.put_new(icon, "icon_svg", svg)
    |> Map.new(fn {k, v} -> {String.to_atom(k), v} end)
  end)

  for %{icon_path: path, icon_svg: svg} <- icon_map do
    def unquote(String.to_atom(path))(assigns) do
      svg = unquote(svg)
      ~H"""
      <i class={"icon"}>
        <%= Phoenix.HTML.raw svg  %>
      </i>
      """
    end
  end
end
