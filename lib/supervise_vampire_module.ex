defmodule SuperviseVampireModule do
  use Supervisor
  import VampireNumber
  def start_link(range) do
    Supervisor.start_link(__MODULE__, range)
  end

  def init(range) do
    
    n1 = Enum.at(range,0)
    n2 = Enum.at(range,1)
    work_list = Enum.chunk_every(n1..n2,10000)
    children = Enum.map(work_list, fn(limit_num) ->
      worker(VampireNumber, [limit_num], [id: limit_num, restart: :transient])
    end)
    supervise(children, strategy: :one_for_one)
  end
end

#SuperviseVampireModule.start_link([1000,100000])