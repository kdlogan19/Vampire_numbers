defmodule CallVampireModule do
    import SuperviseVampireModule
    def start do
    SuperviseVampireModule.start_link([String.to_integer(Enum.at(System.argv(),0)),String.to_integer(Enum.at(System.argv(),1))])
    '''
        n1 = String.to_integer(Enum.at(System.argv(),0))
        n2 = String.to_integer(Enum.at(System.argv(),1))
        VampireNumber.main(n1,n2)
    '''
    end
end

CallVampireModule.start