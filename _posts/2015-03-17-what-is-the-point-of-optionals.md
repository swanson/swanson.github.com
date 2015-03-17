---
layout: post
title: "What is the point of Optionals?"
categories:
- blog
tags:
- growth
---

There is a problem with `null` (or `nil` or `undefined`). It has a tendency to propagate throughout your code. Excessive null checking is a sign of unconfident code &mdash; "I'm not sure if this could even be `null`, might as well check for it...just in case".

One pattern that developers reach for to help with this is the [`Optional` class][opt].

So some code like this:

```java
public MachineStats getMachineStatsById(int id) {
    Machine machine = machineService.getMachine(id);
    
    if (machine != null) {
        return machine.getStats();
    } else {
        throw new EntityNotFoundExpection();
    }
}
```

Becomes this:

```java
public MachineStats getMachineStatsById(int id) {
    Optional<Machine> machine = machineServive.getMachine(id);
    
    if (machine.isPresent()) {
        return machine.getStats();
    } else {
        throw new EntityNotFoundExpection();
    }
}
```

At first glance, all that we've done is swap a null check for a call to `.isPresent()`, so what's the point? Is this just "Patterns for Patterns Sake"?

I wondered this myself. Like for a long time.

But after listening to an episode of the [Giant Robots podcast][gr] on [Haskell's Maybe data type][hk], I finally understood why you would prefer `Optional` over `null`.

It's all about being expressive. 

By returning an `Optional`, you are being explicit that the value could be `null`. This loosely enforces a contract &mdash; if a method returns an `Optional`, the caller should handle the `absent` case. If a method returns an unwrapped type, then it should be assumed to never be `null`.

I can't speak for Haskell, but at least in Java, this contract has to be more of a convention than a strict enforcement. 

But if we follow this convention (and spread this knowledge among the team), we can drastically reduce the need for the defensive null checks that are so frequently sprinkled throughout a codebase.

```java
public MachineStats getMachineStatsById(int id) {
    Machine machine = machineService.getMachine(id);
    return machine.getStats();
}
```

At the end of the day, using `Optional` is more than just a band-aid for covering up `NullPointerExceptions`, it is a mechanism to better communicate how your code works to others.

[opt]: https://docs.oracle.com/javase/8/docs/api/java/util/Optional.html
[gr]: http://giantrobots.fm/
[hk]: http://giantrobots.fm/137