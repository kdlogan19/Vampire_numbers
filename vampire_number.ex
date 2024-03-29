defmodule VampireNumber do
  def main do
    {n1, _} = IO.gets("n1") |> Integer.parse
    {n2, _} = IO.gets("n2") |> Integer.parse
    Enum.each(n1..n2, fn(n) ->
      do_stuff(n)
    end)

  end

  def do_stuff(num) do
    numStr = to_charlist(num)
    numSort = Enum.sort(numStr)
    numSize = length(numStr)
    #IO.puts numSize
    #IO.puts numStr
    #IO.puts numSort
    range1 = Kernel.trunc(:math.pow(10,(numSize/2-1)))
    range2 = Kernel.trunc(:math.sqrt(num))

    #IO.puts ("range: #{range1} #{range2}")
    get_factors(range1,range2,num,numSort)
  end

  def get_factors(start_index,end_index,num,numSort) do
    fang_list = Enum.filter(start_index..end_index, fn(fang1) -> isFang(num,fang1,numSort) end)
    if(fang_list != []) do
      IO.write "#{num} "
      Enum.each(fang_list, fn(x) -> IO.write "#{x} #{Kernel.trunc(num/x)} " end)
      IO.puts ""
    end
  end

  def isFang(num,fang1,numSort) do
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
  def display_list([num | nums]) do
    IO.puts "list numbers: #{num}"
    display_list(nums)
  end
end
'''
Enum.each(factor_list, fn(fang1) ->
      if rem(num, fang1) == 0 do
        fang2 = Kernel.trunc(num/fang1)
        unless (rem(fang1,10) == 0 && rem(fang2,10) == 0) do
          fang1Str = to_charlist(fang1)
          fang2Str = to_charlist(fang2)
          if(numSort == Enum.sort(fang1Str ++ fang2Str) && length(fang1Str) == length(fang2Str)) do
            IO.write "{num} {fang1Str} {fang2Str} "
            IO.puts ""
          end
        end
      end
    end)

'''