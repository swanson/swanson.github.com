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