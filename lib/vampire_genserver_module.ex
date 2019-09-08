defmodule VampireGenserverModule do
    use GenServer
    #client
    
    def start_link(range) do
        GenServer.start_link(__MODULE__, range, [])
    end


    def get_vampire(pid, range) do
        GenServer.call(pid,{:distribute_range, range},50000)
        #GenServer.cast(pid,{:print_vampire})
    end
    
    #server
    def init(_range) do
        {:ok, []}
    end

    def handle_call({:distribute_range, range},_from, current_state) do
        n1 = Enum.at(range,0)
        n2 = Enum.at(range,1)
        digit_count = length(Integer.digits(n2-n1))
        chunk_size = Kernel.trunc(:math.pow(10,(round(digit_count/2)+1)))
        work_list = Enum.chunk_every(n1..n2,chunk_size)
        list = Enum.reduce(work_list, [], fn x, acc -> [spawn(VampireNumber, :start_link, [x,self()] )|acc] end)
        keep_alive(list)
        {:reply,"Processing completed", current_state}
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

    def handle_info(vamp_list, current_state) do
        Enum.each(vamp_list, fn(y) ->
            IO.puts y
        end)
        {:noreply, [vamp_list | current_state]}
    end

    def handle_cast({:print_vampire}, current_state) do
        Enum.each(current_state, fn(x) ->
        Enum.each(x, fn(y) ->
            IO.puts y
        end)
        end)
        {:noreply, current_state}
    end

end