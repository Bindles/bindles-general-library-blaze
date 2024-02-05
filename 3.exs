#3.exs
defmodule Employee do
  defstruct id: nil, name: nil, salary: nil
end

defmodule Team do
end

defmodule aa do
  def bb
    bob = %Employee{id: "1", name: "Bob", salary: 5000}
    jane = %Employee{id: "2", name: "Jane", salary: 6000}
    dick = %Employee{id: "3", name: "Dick", salary: 7000}
    johnson = %Employee{id: "4", name: "Johnson", salary: 8000}
    team = %Team{name: "Accounting", employees: [bob, jane, dick, johnson]}



    Enum.member?(team, bob)

    Enum.map(team, fn e -> e.name end)

    Enum.max_by(team, fn e -> e.salary end)

    Enum.max_by(team.employees, fn e -> e.salary end)

    Enum.map([bob, jane, dick], fn x -> x.name end)  # Output: ["Bob", "Jane", "Dick"]
    Enum.member?([bob, jane, dick], %Employee{id: "3", name: "Dick", salary: 7000})  # Output: true

    Enum.member?([bob, jane, dick], johnson)  # Output: true
    Enum.map([1, 2, 3], fn x -> x * x end)  # Output: [1, 4, 9]

    Enum.member?([1, 2, 3], 2)
  end
end
