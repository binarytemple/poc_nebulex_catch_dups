# PocNebulexCatchDups

Invoking `PocNebulexCatchDups.write_update/1` will sometimes fail, because the service `write_update/1` invokes will randomly fail 50% of the time. If the invocation fails it is not added to the cache. If the invocation succeeds it returns two of the input parameters and they are added to the cache, a subsequent invocation before cache expiry (1 hr) will be a cache hit and no-op with regards to the downstream service.


```elixir
iex(3)> PocNebulexCatchDups.write_update(%Event{id: 1, timestamp: 1, payload: :payload})
writing event %PocNebulexCatchDups.Event{id: 1, payload: :payload, timestamp: 1}
random says no
{:error, "random says no"}
iex(4)> PocNebulexCatchDups.write_update(%Event{id: 1, timestamp: 1, payload: :payload})
writing event %PocNebulexCatchDups.Event{id: 1, payload: :payload, timestamp: 1}
random says yes
{:ok, {1, 1}}
iex(5)> PocNebulexCatchDups.write_update(%Event{id: 1, timestamp: 1, payload: :payload})
{:ok, {1, 1}}
iex(6)> PocNebulexCatchDups.write_update(%Event{id: 1, timestamp: 1, payload: :payload})
{:ok, {1, 1}}
```

## Why..

Reactive programming with Kafka is wonderful, and message loss is pretty much guaranteed not to happen (at least once delivery), however, delivery of the same message more than once is not a rarity, it is in fact extremely common. So we need a way to ignore duplicate messages if we've successfully passed them on to the next service. This cache example is one such way of doing so. For larger scale systems we will perhaps need to make use of some probabilistic filtering algorithm such as the one outlined in the article ["The invertible bloom filter"](https://www.i-programmer.info/programming/theory/4641-the-invertible-bloom-filter.html).


