// Uber.js
var matt = new Driver()
var total = 0.0;
var calculator = new PriceCalculator()

matt.addRide(new Ride("Carmel", "Mass Ave", new Time("10am")))
matt.addRide(new Ride("Mass Ave", "Broad Ripple", new Time("9pm")))

for each (Ride ride : matt.getRides()) {
    total += calculator.computeFare(ride, matt.car)
}

print "You earned: $" + total
print "But we don't provide benefits :("

class Driver {
    String name
    Car car
    List<Ride> rides
}

class Ride {
  Address origin
  Address destination
  Time requestedTime

  float drivingDistance() {
    return GeoUtils.findDrivingDistance(origin, destination)
  }
}

class PriceCalculator {
  TAX_RATE = 1.05
  COST_PER_MILE = 0.50

  float computeFare(ride, car) {
    var rate = lookupBaseRate(car.getType())
    rate = rate + ride.drivingDistance() * COST_PER_MILE

    if (duringSurgePricing(ride.requestedTime)) {
       rate = rate * 2.5
    }

    return rate * TAX_RATE;
  }

  float lookupBaseRate(serviceLevel) {
    switch serviceLevel:
      case ServiceLevel.BLACK_CAR:
        return 10.0
      case ServiceLevel.XL:
        return 7.0
      case ServiceLevel.X:
        return 5.0
  }

  bool duringSurgePricing(requestedTime) {
    return requestedTime >= new Time("5pm") ||
        requestedTime.isFriday() || requestedTime.isWeekend()
  }

}

class Car {
    String make
    String model
    int year
    String color
    int capacity

    ServiceLevel getServiceLevel() {
        if (color == "black" && year > 2010) {
            return ServiceLevel.BLACK_CAR
        } else if (capacity > 4) {
            return ServiceLevel.XL
        } else {
            return ServiceLevel.X
        }
    }
}