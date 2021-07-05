defmodule PocNebulexCatchDups.Event do
  defstruct [:id, :timestamp, :payload]
end

defmodule PocNebulexCatchDups do
  use Nebulex.Caching

  alias PocNebulexCatchDups.Cache
  alias PocNebulexCatchDups.Event


  @ttl :timer.hours(1)

  @decorate cacheable(cache: Cache, keys: [{Event, event.id}, {Event, event.timestamp}], match: &match_fun/1)
  def write_update(%Event{id: id, timestamp: timestamp, payload: payload} = event) do
    IO.puts("writing event #{inspect(event)}")
    case rem(:rand.uniform(10),2) do 
      0 -> IO.puts("modulo says no");  {:ok, {id,timestamp}}
      1 -> IO.puts("modulo says yes");{:error, "modulo says no"}
    end
  end

  defp match_fun({:error,_}), do: false
  defp match_fun({:ok, {_,_}} ), do: true
end

