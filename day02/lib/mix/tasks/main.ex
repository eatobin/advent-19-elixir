defmodule Mix.Tasks.Main do
  @moduledoc "The hello mix task: `mix help main`"
  use Mix.Task

  @shortdoc "Calls the Day02.print_main/0 function."
  def run(_) do
    # This will start our application
    Mix.Task.run("app.start")

    Day02.print_main()
  end
end
