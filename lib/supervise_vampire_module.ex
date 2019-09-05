defmodule SuperviseVampireModule do
  use Supervisor
  import VampireNumber
  def start_link(range) do
    Supervisor.start_link(__MODULE__, range)
  end

  def init(range) do
    
    n1 = Enum.at(range,0)
    n2 = Enum.at(range,1)
    difference = n2 - n1
    IO.puts difference
    #work_list = for n <- range, fn(x) x -> 
    #children = Enum.map([[100000,200000],[200000,300000]], fn(limit_num) ->
    #  worker(VampireNumber, [limit_num], [id: limit_num, restart: :transient])
    #end)
    #supervise(children, strategy: :one_for_one)
  end
end

#SuperviseVampireModule.start_link([1000,100000])