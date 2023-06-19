import 'package:deygo/redux/actions.dart';

import 'app_state.dart';

AppState AppStateReducer(AppState state, dynamic action) {
  if (action is UpdateIsDriverAction) {
    return updateIsDriverReducer(state, action);
  }
  if (action is UpdateUserAction) {
    return updateUserReducer(state, action);
  }
  if (action is UpdateDriverAction) {
    return updateDriverReducer(state, action);
  }
  if (action is UpdatePassengerAction) {
    return updatePassengerReducer(state, action);
  }
  return state;
}

AppState updateIsDriverReducer(AppState state, dynamic action) {
  return AppState(
    driver: state.driver,
    user: state.user,
    passenger: state.passenger,
    state: state.state,
    isDriver: action.newVal,
  );
}

AppState updateUserReducer(AppState state, dynamic action) {
  return AppState(
    user: action.user,
    driver: state.driver,
    passenger: state.passenger,
    state: state.state,
    isDriver: state.isDriver,
  );
}

AppState updateDriverReducer(AppState state, dynamic action) {
  return AppState(
    driver: action.driver,
    user: state.user,
    passenger: state.passenger,
    state: state.state,
    isDriver: state.isDriver,
  );
}

AppState updatePassengerReducer(AppState state, dynamic action) {
  return AppState(
    passenger: action.passenger,
    user: state.user,
    driver: state.driver,
    state: state.state,
    isDriver: state.isDriver,
  );
}
