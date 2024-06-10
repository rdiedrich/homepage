defmodule HomepageWeb.HelperComponents do
  use HomepageWeb, :html

  slot :label, required: true
  slot :entry, default: []

  def dropdown(assigns) do
    ~H"""
    <div class="dropdown dropdown-end">
      <label tabindex="0" class="btn btn-ghost m-1">
        <%= render_slot(@label) %>
      </label>
      <ul tabindex="0" class="dropdown-content bg-white menu p-2 shadow rounded-box">
        <li :for={ent <- @entry}>
          <%= render_slot(ent) %>
        </li>
      </ul>
    </div>
    """
  end

  slot :inner_block, required: true

  def markdown(assigns) do
    ~H"""
    <%= render_slot(@inner_block)
    |> slot_markdown_as_html()
    |> raw() %>
    """
  end

  defp slot_markdown_as_html(%{dynamic: dynamic_slot, static: ["", ""]}) do
    [slot] = dynamic_slot.(false)
    slot |> slot_markdown_as_html()
  end

  defp slot_markdown_as_html(rendered_slot) do
    %{static: [markdown]} = rendered_slot

    trim_leading_space(markdown)
    |> String.replace(~S("\""), ~S("""), global: true)
    |> Earmark.as_html!(compact_output: true)
  end

  defp trim_leading_space(markdown) do
    lines =
      markdown
      |> String.split("\n")
      |> Enum.drop_while(fn str -> String.trim(str) == "" end)

    case lines do
      [first | _] ->
        [space] = Regex.run(~r/^\s*/, first)

        lines
        |> Enum.map(fn line -> String.replace_prefix(line, space, "") end)
        |> Enum.join("\n")

      _ ->
        ""
    end
  end
end
