!SLIDE bullets center
![redis](redis.jpg)  

* In memory, key-value* store
* Non-blocking, single threaded
* 100k reads/writes per sec

!SLIDE bullets
# Swiss army knife for data
* Binary-safe strings
* List, set, sorted set, hash
* Pub/sub channels
* Expirable keys

!SLIDE bullets
# Caching
* Hash input query
* Shove result into redis
* Set an expiration
* Delete to invalidate

!SLIDE bullets
# Web app sessions
* Only accessed by primary key anyways
* Lower per-page overhead
* Expire automatically

!SLIDE bullets
# `tail` logs
* LPUSH + LTRIM into a list
* Track latest N events

!SLIDE bullets
# Task queues
* LPOP/RPUSH on a list
* Blocking atomic POPs for workers
* Backend for `resque` and `restmq`

!SLIDE bullets
#API Throttling
* Store list using API key
* Fast limit checks
* Capped collections with expiration
