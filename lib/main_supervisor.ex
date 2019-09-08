defmodule MainSupervisor do
    def start_link(range) do
        {:ok,server_pid} = VampireGenserverModule.start_link(range)
        VampireGenserverModule.get_vampire(server_pid, range)
    end
end