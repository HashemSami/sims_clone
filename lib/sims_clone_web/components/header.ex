defmodule SimsCloneWeb.Header do
  use Phoenix.Component
  use SimsCloneWeb, :verified_routes

  def header(assigns) do
    ~H"""
    <nav class="sticky top-0 z-40 bg-black shrink-0  shadow-sm">
      <div class=" mx-auto px-4 sm:px-6 lg:px-8 relative">
        <div class="flex h-16 items-center justify-between ">
          <div>
            <div class="flex items-center ">
              <.link href={~p"/"}>
                <h1>Logo</h1>
              </.link>
              Content
            </div>
          </div>

          <div class="flex justify-end gap-4">
            Contents
          </div>
        </div>
      </div>
    </nav>
    """
  end
end
