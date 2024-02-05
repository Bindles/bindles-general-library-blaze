# Define a function
defmodule Math do
  def add(a, b) do
  IO.puts "#{a} #{b}"
    a + b
  end
end

alias IO, as: P

P.puts "Hello, Elixir!"
a=2
b=3
IO.puts  a + b
IO.puts a+1
# Call the function
result = Math.add(2, 3)
IO.puts("Result: #{result}")  # Output: Result: 5

list = [1, 2, 3]
new_list = List.delete(list, 2)  # Deletes the element 2 from the list
IO.inspect(list)       # Output: [1, 2, 3]
IO.inspect(new_list)   # Output: [1, 3]
#Output: Result: 5

{_status, message} = {:ok, "Success"}
IO.puts message   # Output: Success
IO.puts length(list)
zzz = length list
P.puts zzz
abc = List.delete(list, 2)
IO.inspect list       # Output: [1, 2, 3]
IO.inspect abc
