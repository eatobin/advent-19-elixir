defmodule Mix.Tasks.PrintB do
  @moduledoc "The hello mix task: `mix help print_b`"
  use Mix.Task

  @shortdoc "Calls the Day01.print_b/0 function."
  def run(_) do
    # This will start our application
    Mix.Task.run("app.start")

    Day01.print_b()
  end
end
