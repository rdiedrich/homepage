defmodule HomepageWeb.PageHTML do
  use HomepageWeb, :html
  import HomepageWeb.HelperComponents

  embed_templates "page_html/*"

  attr :url, :string, required: true
  attr :forge_url, :string, default: nil
  slot :inner_block, required: true
  slot :title, required: true
  def project(assigns) do
    ~H"""
    <div class="project">
      <.link target="_blank" class="" href={@url}>
        <h3><%= render_slot(@title) %></h3>
      </.link>
      <div class="desc">
        <.markdown><%= render_slot(@inner_block) %></.markdown>
      </div>
      <div class="links mt-1 text-indigo flex gap-4 justify-start">
        <.link target="_blank" href={@url} class="icon-link">
          <.icon name="hero-arrow-top-right-on-square" />
          Visit website
        </.link>

        <.link target="_blank" href={@forge_url} :if={@forge_url} class="icon-link">
          <.icon name="hero-code-bracket-square" />
          See the code
        </.link>
      </div>
    </div>
    """
  end
end
