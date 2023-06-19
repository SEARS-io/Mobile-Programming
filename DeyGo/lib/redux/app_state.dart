import 'models.dart';

class AppState {
  List<dynamic> state;
  User? user;
  Passenger? passenger;
  Driver? driver;
  bool isDriver = false;

  AppState({
    this.state = const [],
    this.user,
    this.passenger,
    this.driver,
    this.isDriver = false,
  });
}
