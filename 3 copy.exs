defmodule Employee do
  defstruct id: nil, name: nil, salary: nil
end

defmodule Team do
end

defmodule Main do
  def run do
    bob = %Employee{id: "1", name: "Bob", salary: 5000}
    jane = %Employee{id: "2", name: "Jane", salary: 6000}
    dick = %Employee{id: "3", name: "Dick", salary: 7000}
    johnson = %Employee{id: "4", name: "Johnson", salary: 8000}

    team = %{name: "Accounting", employees: [bob, jane, dick, johnson]}

    Enum.member?(team.employees, bob)
    IO.puts Enum.map(team.employees, &(&1.name))
    Enum.max_by(team.employees, &(&1.salary))
    Enum.map([bob, jane, dick], &(&1.name))
    Enum.member?([bob, jane, dick], %Employee{id: "3", name: "Dick", salary: 7000})
    Enum.member?([bob, jane, dick], johnson)
    Enum.map([1, 2, 3], &(&1 * &1))
    Enum.member?([1, 2, 3], 2)
  end
end

Main.run()
