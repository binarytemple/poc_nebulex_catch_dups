# PocNebulexCatchDups

```elixir
iex(3)> PocNebulexCatchDups.write_update(%Event{id: 1, timestamp: 1, payload: :payload})
writing event %PocNebulexCatchDups.Event{id: 1, payload: :payload, timestamp: 1}
modulo says yes
{:error, "modulo says no"}
iex(4)> PocNebulexCatchDups.write_update(%Event{id: 1, timestamp: 1, payload: :payload})
writing event %PocNebulexCatchDups.Event{id: 1, payload: :payload, timestamp: 1}
modulo says no
{:ok, {1, 1}}
iex(5)> PocNebulexCatchDups.write_update(%Event{id: 1, timestamp: 1, payload: :payload})
{:ok, {1, 1}}
iex(6)> PocNebulexCatchDups.write_update(%Event{id: 1, timestamp: 1, payload: :payload})
{:ok, {1, 1}}
```
