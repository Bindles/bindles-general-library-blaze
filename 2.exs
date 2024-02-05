defmodule MyUtils do
  alias IO

  def p(value) do
    IO.puts(value)
  end
end

defmodule MyUtilsTest do
  import MyUtils  # Import the MyUtils module to use the p function directly

  def example_function do
    p("This is a test message")  # Using the p function to output a string
  end
end


import MyUtils, only: [p: 1]

p("Hello, Elixir!")example_function to execute the code
