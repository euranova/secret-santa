# The code is largely inspired by this tweet: https://twitter.com/gausby/status/1200462062733987841

defmodule EnumUtils do
  def rotate_left([h | t]) do
    t ++ [h]
  end
end

defmodule SecretSanta do
  def pair([]) do
    {:error, "No participants, no secret santas!"}
  end

  def pair([_]) do
    {:error, "Alone for Christmas day? Watch 'Home Alone' 1 and 2!"}
  end

  def pair([_ | _] = participants) do
    {:ok,
     participants
     |> Enum.shuffle()
     |> EnumUtils.rotate_left()
     |> Enum.zip(participants)
    }
  end
end

"people.txt"
|> File.read!()
|> String.split("\n", trim: true)
|> SecretSanta.pair()
|> case do
  {:error, error} -> IO.puts(error)
  {:ok, pairs} -> Enum.each(pairs, fn {p1, p2} -> IO.puts("#{p1} -> #{p2}") end)
end
