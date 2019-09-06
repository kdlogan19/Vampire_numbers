defmodule SuperviseVampireModule do
  use Supervisor
  def start_link(range) do
    {:ok, pid} = Supervisor.start_link(__MODULE__, range)
    children_pid_list =  Supervisor.which_children(pid)
    pid_list = Enum.map(children_pid_list, fn(x) -> {_,pid,_,_} = x; pid end) 
    keep_alive(pid_list)
  end

  def init(range) do
    n1 = Enum.at(range,0)
    n2 = Enum.at(range,1)
    work_list = Enum.chunk_every(n1..n2,100000)
    children = Enum.map(work_list, fn(limit_num) ->
      worker(VampireNumber, [limit_num], [id: Enum.at(limit_num,0), restart: :transient])
    end)
    supervise(children, strategy: :one_for_one)
  end

  def keep_alive(pid_list) do
    Enum.each(pid_list, fn(x) -> 
    if Process.alive?(x) do 
      keep_alive(pid_list)
    else 
      #IO.inspect Process.alive?(x)
    end 
    end)
  end
end

#SuperviseVampireModule.start_link([1000,100000])