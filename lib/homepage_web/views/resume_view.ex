defmodule HomepageWeb.ResumeView do
  use HomepageWeb, :view

  def para(assigns) do
    ~H"""
    <div>
        <h3 class="font-bold text-lg mb-0"><%= @heading %></h3>
        <%= if assigns[:subheading] do %>
            <h4 class="italic mb-2"><%= @subheading %></h4>
        <% end %>
        <p class="mb-4">
            <%= render_slot(@inner_block) %>
        </p>
    </div>
    """
  end

  def article(assigns) do
    ~H"""
    <article>
        <h2 class="font-['Inter'] font-bold text-xl"><%= @heading %></h2>
        <%= render_slot(@inner_block) %>
    </article>
    """
  end
end
