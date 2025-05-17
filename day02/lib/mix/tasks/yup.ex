defmodule Mix.Tasks.PrintA do
  @moduledoc "The hello mix task: `mix help print_a`"
  use Mix.Task

  @shortdoc "Calls the Day02.print_a/0 function."
  def run(_) do
    # This will start our application
    Mix.Task.run("app.start")

    Day02.print_a()
  end
end
