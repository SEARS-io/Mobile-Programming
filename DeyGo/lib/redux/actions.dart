import 'models.dart';

class UpdateIsDriverAction {
  final bool newVal;

  UpdateIsDriverAction(this.newVal);
}

class UpdateUserAction {
  final User user;

  UpdateUserAction(this.user);
}

class UpdateDriverAction {
  final Driver driver;

  UpdateDriverAction(this.driver);
}

class UpdatePassengerAction {
  final Passenger passenger;

  UpdatePassengerAction(this.passenger);
}
