software quality - a whirlwind tour
"is my code good?"

# things to touch on
code reviews - to improve your code quality and level up as developers
refactoring/code smells - to learn the mechanics of improving code

Themes:
trade-offs
deliberate
context

What is quality?
What makes code good?
How do I know if my code is good?

LOC?
Performant?
Reliable?
Easy to change?
Easy to understand?
Confidence?
Profitable?
Helpful?

Test Driven Development
Behavior Driven Development
Design patterns
Single Responsibility Principle
Don't Repeat Yourself
Rule of Threes
Law of Demeter
Metrics
Refactoring
Code Reviews
Pair Programming
Automated Testing
Static Analyis
Linters
Style Guides
SOLID
YAGNI
KISS
Command-Query Separation
Inversion of Control
Cohesion
Coupling
Continuous Integration
Continuous Deployment

# refactoring
who is doing it?
what is it/what is it not?
within a TDD workflow
show the smallest types of refactoring before code smells (naming, express intent with methods)
common patterns (extract method, class, rename)

show code side-by-side to evaluate refactoring
show one example (maybe some polymorphism?) that doesnt exactly work
recommendation: Fowler's Refactoring
trade-offs: you never know less about your program than you do right now

# code smells
what is it?
trade-offs: not always a problem
explain how smells might conflict with each other
common examples (feature envy, long method, shotgun surgery)

Message/Method Chains
Hide delegate

// Uber.js

var matt = new Driver("Matt");
matt.addRide(new Ride("Carmel", "Mass Ave", new Time("10am")))
matt.addRide(new Ride("Mass Ave", "Broad Ripple", new Time("9pm")))

var total = 0.0;
for each (Ride ride : matt.getRides()) {
    total = total + matt.calculate(ride)
}

print "You earned: $" + total
print "But we don't provide benefits :("

class Driver {
    String name
    Car car
    List<Ride> rides

    int calculate(ride) {
      var d = GeoUtils.calculate(ride.startLatitude, ride.startLongitude, 
        ride.endLatitude, ride.endLongitude);

      var s = 0;
      var t = getType()
      switch t {
        case "Black Car":
          s = 10.0
        case "Uber XL":
          s = 7.0
        case "Uber X":
          s = 5.0
      }

      s = s + d * 0.50

      // Surge pricing after 6pm and Fri/Sat/Sun
      if (currentRide.requestedTime.hour >= 17 ||
         currentRide.requestedTime.day >= 5) {
        s = s * 2.5
      }

      return s * 1.05 //tax;
    }

    string getType() {
        if (car.getColor() == "black" && car.getYear() > 2010) {
            return "Black Car"
        } else if (car.getPassengerCount() > 4) {
            return "Uber XL"
        } else {
            return "Uber X"
        }
    }
}
```


use Uber as context for examples
  * surge pricing
  * early adopter
recommendation: sourcemaking

# code reviews
who is doing them?
giving context to reviewer
code is read 10x more than written [cite]
example of empty, "what" and "why" pull requests
receiving feedback
why junior devs should review code
trade-offs:
readability vs performance
team vs individual
learning/launching
recommendation: exercism
