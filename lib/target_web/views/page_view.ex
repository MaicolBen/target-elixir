defmodule TargetWeb.PageView do
  use TargetWeb, :view

  def google_api_key do
    System.get_env("GOOGLE_MAPS_API_KEY")
  end
end
