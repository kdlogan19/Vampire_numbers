defmodule VampireNumber do
  def start_link(number) do
    pid = spawn_link(__MODULE__, :init, [number])
    {:ok, pid}
  end

  def init(number) do
    main(number)
  end

  def main(number) do
    #IO.inspect number
    IO.puts " PID = #{inspect self()}"
    #map = Enum.reduce (number, %{}, fn x, acc -> is_vampire(n)
    Enum.each(number, fn(n) ->
      result = is_vampire(n)
      if(result != :nil) do
        IO.puts(Enum.join(result, " ")) 
      end
    end)
  end

  def is_vampire(num) do
    numStr = to_charlist(num)
    numSort = Enum.sort(numStr)
    numSize = length(numStr)
    range1 = Kernel.trunc(:math.pow(10,(numSize/2-1)))
    range2 = Kernel.trunc(:math.sqrt(num))
    get_factors(range1,range2,num,numSort)
  end

  def get_factors(start_index,end_index,num,numSort) do
    fang_list = Enum.filter(start_index..end_index, fn(fang1) -> is_fang(num,fang1,numSort) end)
    if(fang_list != []) do
      map = Enum.reduce(fang_list, [], fn x, acc ->
        acc = acc ++ [x,Kernel.trunc(num/x)]
      end)
      [num,Enum.join(map, " ")]
    else
      :nil
    end
  end

  def is_fang(num,fang1,numSort) do
      if rem(num, fang1) == 0 do
        fang2 = Kernel.trunc(num/fang1)
        unless (rem(fang1,10) == 0 && rem(fang2,10) == 0) do
          fang1Str = to_charlist(fang1)
          fang2Str = to_charlist(fang2)
          if(numSort == Enum.sort(fang1Str ++ fang2Str) && length(fang1Str) == length(fang2Str)) do
            true
          else
            false
          end
        end
      end
  end
end