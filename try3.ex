defmodule B do
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

    Enum.each(range1..range2, fn(fang1) ->
      if rem(num, fang1) == 0 do
        fang2 = Kernel.trunc(num/fang1)
        unless (rem(fang1,10) == 0 && rem(fang2,10) == 0) do
          fang1Str = to_charlist(fang1)
          fang2Str = to_charlist(fang2)
          if(numSort == Enum.sort(fang1Str ++ fang2Str)) do
            IO.puts "number = #{num} - Fang1: #{fang1Str} Fang2: #{fang2Str}"
          end
        end
      end
    end)
  end

  def display_list([num | nums]) do
    IO.puts "list numbers: #{num}"
    display_list(nums)
  end
end
