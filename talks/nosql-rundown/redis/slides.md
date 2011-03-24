!SLIDE bullets center
![redis](redis.jpg)  

* In memory, key-value* store
* Non-blocking, single threaded
* 100k reads/writes per sec

!SLIDE bullets
* Binary-safe strings
* List, set, sorted set, hash
* Pub/sub channels
* Expirable keys

!SLIDE bullets
#Web app sessions
* Only accessed by primary key anyways
* Lower per-page overhead
* Expire automatically

!SLIDE bullets
#`tail` logs
* LPUSH + LTRIM into a list
* Track latest N events

!SLIDE bullets
#Message queue
* LPOP/RPOP on a list
* Backend for `resque` and `restmq`
* Built-in in pub/sub

!SLIDE bullets
#API Throttling
* Store list using API key
* Fast limit checks
* Capped collections with expiration
