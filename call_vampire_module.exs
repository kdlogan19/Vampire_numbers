defmodule CallVampireModule do
    def start do
        SuperviseVampireModule.start_link([String.to_integer(Enum.at(System.argv(),0)),String.to_integer(Enum.at(System.argv(),1))])
    end
end

CallVampireModule.start