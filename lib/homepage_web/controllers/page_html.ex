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
          <.icon name="hero-arrow-top-right-on-square" /> Visit website
        </.link>

        <.link :if={@forge_url} target="_blank" href={@forge_url} class="icon-link">
          <.icon name="hero-code-bracket-square" /> See the code
        </.link>
      </div>
    </div>
    """
  end

  attr :id, :string, required: true
  slot :inner_block, required: true
  slot :title, required: true

  def resume_section(assigns) do
    ~H"""
    <section id={@id} class="pt-2 pb-4">
      <h3 class="text-xl mb-2"><%= render_slot(@title) %></h3>
      <dl class={@id in ["edu", "proj"] && "max-w-[28ch]"}>
        <%= render_slot(@inner_block) %>
      </dl>
    </section>
    """
  end

  slot :inner_block, required: true
  slot :title

  def point(assigns) do
    ~H"""
    <dt :if={@title} class="ml-2">
      <.point_heading><%= render_slot(@title) %></.point_heading>
    </dt>
    <dd class="ml-2"><%= render_slot(@inner_block) %></dd>
    """
  end

  slot :inner_block, required: true

  def point_heading(assigns) do
    ~H"""
    <h4 class="font-extrabold text-base leading-light inline-block">
      <%= render_slot(@inner_block) %>
    </h4>
    """
  end

  slot :inner_block, required: true

  def timeline_heading(assigns) do
    ~H"""
    <h4 class="font-semibold text-base leading-light block mt-4 mb-2">
      <%= render_slot(@inner_block) %>
    </h4>
    """
  end
end
