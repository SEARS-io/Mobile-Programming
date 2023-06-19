// ignore_for_file: non_constant_identifier_names

class Location {
  final String name;
  double? latitude;
  double? longitude;

  Location({required this.name, this.latitude, this.longitude});
}

class User {
  String? password;
  final String tel;
  String? name;
  Location? current_location;
  String? email;
  String? user_id;

  User({
    required this.tel,
    this.password,
    this.name,
    this.current_location,
    this.user_id,
    this.email,
  });
}

class Passenger {
  final String user_id;
  String? pass_id;
  User? user;

  Passenger({
    required this.user_id,
    this.pass_id,
    this.user,
  });

  static Passenger fromResponse(dynamic response) {
    final Passenger newPassenger = Passenger(
      pass_id: response['pass_id'],
      user_id: response['user']['user_id'],
      user: User(
        tel: response['user']['tel'],
        password: response['user']['password'],
        email: response['user']['email'],
        name: response['user']['name'],
        current_location: Location(
          name: response['user']['location']['name'],
          latitude: response['user']['location']['latitude'],
          longitude: response['user']['location']['longitude'],
        ),
      ),
    );

    return newPassenger;
  }
}

class Driver {
  final String user_id;
  String? driver_id;
  User? user;
  double? rating;
  String? union_num;

  Driver({
    required this.user_id,
    this.driver_id,
    this.user,
    this.rating,
    this.union_num,
  });

  static Driver fromResponse(dynamic response) {
    final Driver newDriver = Driver(
      driver_id: response['driver_id'],
      rating: ((response['rating'] ?? 0) as int).toDouble(),
      union_num: response['union_number'],
      user_id: response['user']['user_id'],
      user: User(
        tel: response['user']['tel'],
        password: response['user']['password'],
        email: response['user']['email'],
        name: response['user']['name'],
        current_location: Location(
          name: response['user']['location']['name'],
          latitude: response['user']['location']['latitude'],
          longitude: response['user']['location']['longitude'],
        ),
      ),
    );

    return newDriver;
  }
}

class Booking {
  Location? locationByDestination;
  Location? locationByLocation;
  final String status;
  String? time;
  final String ride_id;
  final int amount;

  Booking({
    required this.status,
    this.time,
    required this.ride_id,
    required this.amount,
    this.locationByDestination,
    this.locationByLocation,
  });

  static Booking fromResponse(dynamic response) {
    final Booking booking = Booking(
      status: response['status'],
      ride_id: response['ride_id'],
      amount: response['amount'],
      locationByDestination:
          Location(name: response['locationByDestination']['name']),
      locationByLocation:
          Location(name: response['locationByLocation']['name']),
    );

    return booking;
  }
}
